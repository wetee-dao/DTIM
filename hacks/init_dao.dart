// import 'dart:io';

// import 'package:dtim/bridge_struct.dart';
// import 'package:dtim/native_wraper.dart';

import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:polkadart/apis/apis.dart';
import 'package:polkadart/polkadart.dart' show Provider, StateApi;

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";

void main() async {

  final polkadart =
      Provider.fromUri(Uri.parse('ws://127.0.0.1:9944'));
  final state = StateApi(polkadart);
  final runtimeVersion = await state.getRuntimeVersion();
  print(runtimeVersion.toJson());

  final author = AuthorApi(polkadart);
  final extrinsic = hex.decode(
      '350284004ea987928399dfe5b94bf7d37995850a21067bfa4549fa83b40250ee635fc06400036990f9642741b00d3484d2e5bd7cba6fa2eea682f6b6c612e47c204f09b0838c171ba42feae5bea1c48a48213cba42a5d590e1c07d1213d263a258f23f5102001c000a07004ea987928399dfe5b94bf7d37995850a21067bfa4549fa83b40250ee635fc064025a6202');

  final submit = await author.submitAndWatchExtrinsic(extrinsic as Uint8List,
      (data) => print('From here: ${data.type} - ${data.value}'));
  print(submit);

  // 添加用户到项目
  // var rootAddress = await rustApi.addSeed(seed: DAO_ROOT_SEED);
  // var clientIndex = await rustApi.connect(url: "ws://127.0.0.1:9944");
  // rustApi.startClient(client: clientIndex).then((e) {}).catchError((e) {});

  // await Future.delayed(const Duration(seconds: 5));

  // print("Start INIT " + clientIndex.toString());
  // await rustApi.daoInitFromPair(client: clientIndex, address: rootAddress);
  // await rustApi.createDao(
  //   client: clientIndex,
  //   from: rootAddress,
  //   name: "ProgrammingDAO",
  //   purpose: "For the freedom of programming",
  //   metaData: "{}",
  //   bg: '',
  //   desc: 'For the freedom of programming',
  //   homeUrl: 'https://wetee.app/',
  //   imApi: 'https://im.tc.asyou.me/',
  //   img: 'https://wetee.app/static/web3/img/logo.png',
  //   logo: 'https://wetee.app/static/web3/img/icon.png',
  // );

  // // 初始化资产
  // await rustApi.createAsset(
  //   client: clientIndex,
  //   from: rootAddress,
  //   daoId: 5000,
  //   name: "TEST",
  //   decimals: 10000,
  //   totalSupply: 10000,
  //   symbol: 'T',
  // );

  // print("Project INIT");
  // await rustApi.createProject(
  //   from: rootAddress,
  //   client: clientIndex,
  //   daoId: 5000,
  //   name: "TEST",
  //   desc: "TEST",
  //   ext: const WithGovPs(
  //     runType: 2,
  //     amount: 100,
  //     member: MemberGroup(scope: 1, id: 0),
  //     periodIndex: 0,
  //   ),
  // );

  // print("INIT DONE");
  // exit(0);
}
