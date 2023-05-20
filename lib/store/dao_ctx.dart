import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../bridge_struct.dart';
import '../models/models.dart';
import '../native_wraper.dart';
import '../utils/functions.dart';

class DAOCTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late DaoInfo dao;
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

  connectChain(porg, puser, callback) async {
    if (chainClient > -1) {
      await getData();
      callback();
      return;
    }
    if (porg.chainUrl != null) {
      rustApi.connect(url: porg.chainUrl!).then((v) async {
        user = puser;
        org = porg;
        rustApi.startClient(client: v).then((e) {
          chainClient = -1;
          printSuccess("连接断开");
          notifyListeners();
        }).catchError((e) {
          chainClient = -1;
          printSuccess("连接错误");
          notifyListeners();
        });

        Future.delayed(const Duration(seconds: 1), () async {
          for (var i = 0; i < 20; i++) {
            try{
              printSuccess("连接到区块链 ==> ${porg.chainUrl!} ===> $v");
              chainClient = v;
              await getData();
              // 成功后结束循环
              i = 20;
            }catch(e){
              printError("尝试获取区块连失败 ==> ${e.toString()}");
            }
            sleep(const Duration(seconds: 1));
          }

          callback();
        });
      }).catchError((e) {
        printError("连接到区块链 ==> ${org.chainUrl!} ===> 失败 ===> ${e.toString()}");
      });
    }
  }

  getData({notify = true}) async {
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

    // 区块链代码
    blockNumber = await rustApi.getBlockNumber(client: chainClient);

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
      }
      notifyListeners();
    }
  }

  bool checkAfterTx() {
    if (!members.contains(user.address)) {
      BotToast.showText(text: 'You are not a member of this DAO', duration: const Duration(seconds: 2));
      return false;
    }
    if (nativeAmount.free < 100) {
      BotToast.showText(
        text: "The user's balance is not enough to pay the handling fee",
        duration: const Duration(seconds: 2),
      );
      return false;
    }
    return true;
  }

  Future<void> daoRefresh() async {
    daoRefreshChannel = 3;
    BotToast.showText(
        text: 'Successfully joined DAO, data will take effect in subsequent blocks ',
        duration: const Duration(seconds: 2));
    await getData();
    await getVoteData();
    notifyListeners();
  }
}

final daoCtx = DAOCTX();
