import 'package:flutter/material.dart';

import '../bridge_generated.dart';
import '../models/models.dart';
import '../rust_wraper.io.dart';
import '../utils/functions.dart';

class DAOCTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late AssetAccountData nativeAmount;
  late AssetAccountData share;

  int chainClient = -1;
  List<GuildInfo> guilds = [];
  List<ProjectInfo> projects = [];
  List<String> members = [];
  String ss58Address = "";

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
    guilds = await rustApi.daoGuilds(client: chainClient, daoId: org.daoId);
    projects = await rustApi.daoProjects(client: chainClient, daoId: org.daoId);
    share = await rustApi.daoBalance(client: chainClient, daoId: org.daoId, address: user.address);
    nativeAmount = await rustApi.nativeBalance(client: chainClient, address: user.address);
    ss58Address = await rustApi.ss58(address: user.address);
    members = await rustApi.daoMemebers(client: chainClient, daoId: org.daoId);
    print(members);
    print(user.address);

    notifyListeners();
  }
}

final daoCtx = DAOCTX();
