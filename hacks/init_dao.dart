import 'dart:io';

import 'package:asyou_app/bridge_struct.dart';
import 'package:asyou_app/native_wraper.dart';

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";

void main() async {
  // 添加用户到项目
  var rootAddress = await rustApi.addSeed(seed: DAO_ROOT_SEED);
  var clientIndex = await rustApi.connect(url: "ws://127.0.0.1:3994");
  print("Start INIT");
  await rustApi.daoInitFromPair(client: clientIndex, address: rootAddress);
  await rustApi.createDao(
    client: clientIndex,
    from: rootAddress,
    name: "TESTDAO",
    purpose: "For the freedom of programming",
    metaData: "{}",
  );
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
    ),
  );
  print("INIT DONE");
  exit(0);
}
