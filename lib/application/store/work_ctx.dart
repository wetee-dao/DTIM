// import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/native_wraper.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:dtim/bridge_struct.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/platform_infos.dart';

const chainUrl = "ws://chain-ws.tc.asyou.me:80";
// const chainUrl = "ws://127.0.0.1:9944";

class WorkCTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late OrgInfo dao;
  late AssetAccountData daoAmount;
  late int userPoint;
  late AssetAccountData nativeAmount;
  late AssetAccountData share;

  int chainClient = -1;
  int blockNumber = 0;
  int totalIssuance = 0;
  int daoRefreshChannel = 0;
  List<GuildInfo> guilds = [];
  List<ProjectInfo> projects = [];
  List<String> members = [];
  String ss58Address = "";
  List<GovVote> votes = [];
  List<GovProps> pending = [];
  List<GovReferendum> going = [];

  connectChain(AccountOrg porg,Account puser,Function callback) async {
    if (chainClient > -1) {
      await getData();
      callback();
      return;
    }

    user = puser;
    org = porg;
    rustApi.connect(url: chainUrl).then((clientIndex) async {
      rustApi.startClient(client: clientIndex).then((e) {
        chainClient = -1;
        printSuccess("连接断开");
        notifyListeners();
      }).catchError((e) {
        chainClient = -1;
        printError("连接错误 => $e");
        notifyListeners();
      });

      Future.delayed(const Duration(seconds: 1), () async {
        for (var i = 0; i < 20; i++) {
          try {
            await rustApi.getBlockNumber(client: clientIndex);
            printSuccess("连接到区块链 ==> $chainUrl ===> $clientIndex");
            chainClient = clientIndex;
            // 成功后结束循环
            i = 20;
            notifyListeners();
          } catch (e) {
            printError("尝试获取区块连失败 ==> ${e.toString()}");
          }
          await Future.delayed(const Duration(seconds: 1));
        }
        await getData();
        callback();
      });
    }).catchError((e) {
      printError("连接到区块链 ==> $chainUrl ===> 失败 ===> ${e.toString()}");
    });
  }

  disconnectChain() async {
    if(chainClient==-1) return;
    await rustApi.stopClient(client: chainClient);
    chainClient = -1;
  }

  getData({notify = true}) async {
    // 区块链代码
    blockNumber = await rustApi.getBlockNumber(client: chainClient);

    if(org.daoId==0) return;

    // DAO信息
    dao = await rustApi.daoInfo(client: chainClient, daoId: org.daoId);
    daoAmount = await rustApi.nativeBalance(client: chainClient, address: dao.daoAccountId);
    totalIssuance = await rustApi.daoTotalIssuance(client: chainClient, daoId: org.daoId);

    // 工会&项目
    guilds = await rustApi.daoGuilds(client: chainClient, daoId: org.daoId);
    projects = await rustApi.daoProjects(client: chainClient, daoId: org.daoId);

    // 用户荣誉点 share 链上金额
    userPoint = await rustApi.daoMemberPoint(client: chainClient, daoId: org.daoId, member: user.address);
    share = await rustApi.daoBalance(client: chainClient, daoId: org.daoId, address: user.address);
    nativeAmount = await rustApi.nativeBalance(client: chainClient, address: user.address);
    ss58Address = await rustApi.ss58(address: user.address);

    // DAO 成员
    members = await rustApi.daoMemebers(client: chainClient, daoId: org.daoId);
    votes = await rustApi.daoGovVotesOfUser(client: chainClient, daoId: org.daoId, from: user.address);

    if (notify) notifyListeners();
  }

  getVoteData({notify = true}) async {
    pending = await rustApi.daoGovPendingReferendumList(client: chainClient, daoId: org.daoId);
    going = await rustApi.daoGovReferendumList(client: chainClient, daoId: org.daoId);

    if (notify) notifyListeners();
  }

  timeTick() async {
    int newBlockNumber = await rustApi.getBlockNumber(client: chainClient);
    if (newBlockNumber != blockNumber) {
      blockNumber = newBlockNumber;
      if (daoRefreshChannel > 0) {
        daoRefreshChannel--;
        await getData();
        await getVoteData();
      } else {
        if (user.address != '') {
          nativeAmount = await rustApi.nativeBalance(client: chainClient, address: user.address);
          share = await rustApi.daoBalance(client: chainClient, daoId: org.daoId, address: user.address);
        }
      }
      notifyListeners();
    }
  }

  Future<bool> checkAfterTx() async {
    if (!members.contains(user.address)) {
      BotToast.showText(text: 'You are not a member of this Org workgroup', duration: const Duration(seconds: 2));
      return false;
    }
    if (nativeAmount.free < 100) {
      BotToast.showText(
        text: "The user's balance is not enough to pay the handling fee",
        duration: const Duration(seconds: 2),
      );
      return false;
    }
    return await inputPassword();
  }

  Future<void> daoRefresh() async {
    daoRefreshChannel = 3;
    BotToast.showText(
        text: 'Successfully, data will take effect in subsequent blocks ', duration: const Duration(seconds: 2));
    await getData();
    await getVoteData();
    notifyListeners();
  }

  Future<bool> inputPassword() async {
    return await inputPasswordg(user);
  }
}

final workCtx = WorkCTX();

Future<bool> inputPasswordg(Account user) async {
  if (!PlatformInfos.isWeb) {
    final ctx = globalCtx();
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: ctx,
      title: L10n.of(ctx)!.userPaypassword,
      okLabel: L10n.of(ctx)!.ok,
      cancelLabel: L10n.of(ctx)!.cancel,
      textFields: [
        DialogTextField(
          obscureText: true,
          hintText: L10n.of(ctx)!.pleaseEnterYourPassword,
          initialText: "",
        )
      ],
    );
    if (input == null) return false;
    final res = await waitFutureLoading<String>(
      context: globalCtx(),
      future: () async {
        final pwd = input[0];
        try {
          await rustApi.addKeyring(keyringStr: user.chainData, password: pwd);
        } catch (e) {
          return "密码错误";
        }
        return "ok";
      },
    );
    if (res.result != "ok") {
      BotToast.showText(text: res.result ?? "error", duration: const Duration(seconds: 2));
      return false;
    }
  }
  return true;
}
