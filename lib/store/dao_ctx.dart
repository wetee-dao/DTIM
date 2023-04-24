import 'package:flutter/material.dart';

import '../bridge_generated.dart';
import '../models/models.dart';
import '../rust_wraper.io.dart';
import '../utils/functions.dart';

class DAOCTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late DaoInfo dao;
  late AssetAccountData daoAmount;
  late AssetAccountData nativeAmount;
  late AssetAccountData share;

  int chainClient = -1;
  int blockNumber = 0;
  int totalIssuance = 0;
  List<GuildInfo> guilds = [];
  List<ProjectInfo> projects = [];
  List<String> members = [];
  String ss58Address = "";
  List<GovVote> votes = [];
  List<GovProps> pending = [];
  List<GovReferendum> going = [];

  connectChain(porg, puser, callback) {
    if (porg.chainUrl != null) {
      rustApi.connect(url: porg.chainUrl!).then((v) async {
        printSuccess("连接到区块链 ==> ${porg.chainUrl!} ===> $v");
        chainClient = v;
        user = puser;
        org = porg;

        await getData();

        callback();
      }).catchError((e) {
        printError("连接到区块链 ==> ${org.chainUrl!} ===> 失败 ===> ${e.toString()}");
      });
    }
  }

  getData() async {
    dao = await rustApi.daoInfo(client: chainClient, daoId: org.daoId);
    print(dao.daoAccountId);
    daoAmount = await rustApi.nativeBalance(client: chainClient, address: dao.daoAccountId);
    totalIssuance = await rustApi.daoTotalIssuance(client: chainClient, daoId: org.daoId);
    guilds = await rustApi.daoGuilds(client: chainClient, daoId: org.daoId);
    projects = await rustApi.daoProjects(client: chainClient, daoId: org.daoId);
    share = await rustApi.daoBalance(client: chainClient, daoId: org.daoId, address: user.address);
    nativeAmount = await rustApi.nativeBalance(client: chainClient, address: user.address);
    ss58Address = await rustApi.ss58(address: user.address);
    members = await rustApi.daoMemebers(client: chainClient, daoId: org.daoId);
    votes = await rustApi.daoGovVotesOfUser(client: chainClient, daoId: org.daoId, from: user.address);
    blockNumber = await rustApi.getBlockNumber(client: chainClient);

    notifyListeners();
  }

  getVoteData() async {
    pending = await rustApi.daoGovPendingReferendumList(client: chainClient, daoId: org.daoId);
    going = await rustApi.daoGovReferendumList(client: chainClient, daoId: org.daoId);

    notifyListeners();
  }

  timeTick() async {
    int newBlockNumber = await rustApi.getBlockNumber(client: chainClient);
    if (newBlockNumber != blockNumber) {
      blockNumber = newBlockNumber;
      notifyListeners();
    }
  }
}

final daoCtx = DAOCTX();
