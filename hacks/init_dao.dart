import 'dart:io';

import 'package:dtim/bridge_struct.dart';
import 'package:dtim/native_wraper.dart';

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";

void main() async {
  // 添加用户到项目
  var rootAddress = await rustApi.addSeed(seed: DAO_ROOT_SEED);
  var clientIndex = await rustApi.connect(url: "ws://127.0.0.1:9944");
  rustApi.startClient(client: clientIndex).then((e) {}).catchError((e) {});

  await Future.delayed(const Duration(seconds: 5));

  print("Start INIT " + clientIndex.toString());
  await rustApi.daoInitFromPair(client: clientIndex, address: rootAddress);
  await rustApi.createDao(
    client: clientIndex,
    from: rootAddress,
    name: "ProgrammingDAO",
    purpose: "For the freedom of programming",
    metaData: "{}",
    bg: '',
    desc: 'For the freedom of programming',
    homeUrl: 'https://wetee.app/',
    imApi: 'https://im.tc.asyou.me/',
    img: '',
    logo: 'https://wetee.app/static/web3/img/icon.png',
  );

  // 初始化资产
  await rustApi.createAsset(
    client: clientIndex,
    from: rootAddress,
    daoId: 5000,
    name: "TEST",
    decimals: 10000,
    totalSupply: 10000,
    symbol: 'T',
  );

  print("Project INIT");
  await rustApi.createProject(
    from: rootAddress,
    client: clientIndex,
    daoId: 5000,
    name: "TEST",
    desc: "TEST",
    ext: const WithGovPs(
      runType: 2,
      amount: 100,
      member: MemberGroup(scope: 1, id: 0),
      periodIndex: 0,
    ),
  );

  print("INIT DONE");
  exit(0);
}
