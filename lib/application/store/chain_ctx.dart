// import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/chain/wetee_gen/types/orml_tokens/account_data.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_gov/period.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_gov/vote_info.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:dtim/chain/wetee/wetee.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:polkadart/polkadart.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_org/guild_info.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_org/org_info.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_project/project_info.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_gov/pre_prop.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_gov/prop.dart';

// final chainUrl = PlatformInfos.isDesktop ? "ws://chain.gc.wetee.app:80" : "wss://chain.gc.wetee.app";
const chainUrl = "ws://127.0.0.1:9944";

class WeTEECTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late OrgInfo dao;
  late AccountData daoAmount;
  late int userPoint;
  late AccountData nativeAmount;
  late AccountData share;

  WeTEE? chainClient;
  Provider? provider;

  int blockNumber = 0;
  int totalIssuance = 0;
  int daoRefreshChannel = 0;
  bool reConnecting = false;
  List<GuildInfo> guilds = [];
  List<ProjectInfo> projects = [];
  List<String> members = [];
  String ss58Address = "";
  List<VoteInfo> votes = [];
  List<PreProp> pending = [];
  List<Prop> going = [];
  List<Period> periods = [];
  List<Function> callbacks = [];

  setOrg(AccountOrg porg, Account puser) {
    user = puser;
    org = porg;
  }

  connectChain(Function? callback) async {
    if (chainClient != null) {
      if (org.daoId == "") {
        callback?.call();
        return;
      }
      await getData();
      return;
    }
    if (callback != null) {
      callbacks.add(callback);
    }
    if (reConnecting == true) {
      return;
    }
    final chainPre = WeTEE.url(chainUrl);
    printDebug("准备连接到区块链 ==> $chainUrl");
    chainPre.getBlockNumber().then((clientIndex) async {
      printSuccess("连接到区块链 ==> $chainUrl ===> $clientIndex");

      chainClient = chainPre;
      notifyListeners();

      await getData();
      for (var c in callbacks) {
        c();
      }
      callbacks = [];
    }).catchError((e) {
      chainClient = null;
      printError("连接到区块链 ==> $chainUrl ===> 失败 ===> ${e.toString()}");
      if (reConnecting == true) return;
      reConnecting = true;
      printWarning("等待 5s 后重新链接");
      Timer(const Duration(seconds: 5), () {
        reConnecting = false;
        connectChain(null);
      });
    });
  }

  disconnectChain() async {
    if (chainClient == null) return;
    await chainClient!.disconnect();
    chainClient = null;
    provider = null;
  }

  getData({notify = true}) async {
    // 区块链代码
    blockNumber = await chainClient!.getBlockNumber();

    if (org.daoId == "") return;
    final daoId = BigInt.tryParse(org.daoId)!;
    final publicKey = hex.decode(user.address);

    // DAO信息
    dao = (await chainClient!.query.weteeOrg.daos(daoId))!;
    daoAmount = await chainClient!.query.tokens.accounts(dao.daoAccountId, BigInt.from(0));
    totalIssuance = (await chainClient!.query.tokens.totalIssuance(daoId)).toInt();

    // 工会&项目
    guilds = await chainClient!.query.weteeOrg.guilds(daoId);
    projects = await chainClient!.query.weteeProject.daoProjects(daoId);

    // 用户荣誉点 share 链上金额
    userPoint = await chainClient!.query.weteeOrg.memberPoint(daoId, publicKey);
    share = await chainClient!.query.tokens.accounts(publicKey, daoId);
    nativeAmount = await chainClient!.query.tokens.accounts(publicKey, BigInt.from(0));
    ss58Address = user.ss58Address;

    // DAO 成员
    members = (await chainClient!.query.weteeOrg.members(daoId)).map((e) =>"0x${hex.encode(e)}").toList();
    votes = await chainClient!.query.weteeGov.votesOf(publicKey);

    periods = await chainClient!.query.weteeGov.periods(daoId);

    if (notify) notifyListeners();
  }

  getVoteData({notify = true}) async {
    if (org.daoId == 0) return;
    pending = await chainClient!.query.weteeGov.preProps(BigInt.tryParse(org.daoId)!);
    going = [];
    // await chainClient!.query.weteeGov.props(BigInt.from(org.daoId), key2);

    if (notify) notifyListeners();
  }

  timeTick() async {
    int newBlockNumber = await chainClient!.getBlockNumber();
    if (newBlockNumber != blockNumber) {
      blockNumber = newBlockNumber;
      if (daoRefreshChannel > 0) {
        daoRefreshChannel--;
        await getData();
        await getVoteData();
      } else {
        if (user.address != '') {
          if (org.daoId == 0) return;
          nativeAmount = await chainClient!.query.tokens.accounts(hex.decode(user.address), BigInt.from(0));
          share = await chainClient!.query.tokens.accounts(hex.decode(user.address), BigInt.tryParse(org.daoId)!);
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
    if (nativeAmount.free < BigInt.from(100)) {
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

  WeTEE get client => chainClient!;
}

final weteeCtx = WeTEECTX();

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
          await WeTEE.addKeyring(account: ChainAccountData.fromJson(json.decode(user.chainData)), password: pwd);
        } catch (e) {
          return e.toString();
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
