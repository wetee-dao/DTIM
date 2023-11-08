// import 'dart:io';

// import 'package:dtim/bridge_struct.dart';
// import 'package:dtim/native_wraper.dart';

import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:dtim/generated/wetee/wetee.dart';
import 'package:polkadart/polkadart.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";

void main() async {
  final provider = Provider.fromUri(Uri.parse('ws://127.0.0.1:9944'));
  // final api = Polkadot(provider);
  final wetee = Wetee(provider);
  final keyPair = await KeyPair.fromMnemonic(DAO_ROOT_SEED);
  final publicKey = hex.encode(keyPair.publicKey.bytes);
  final author = AuthorApi(provider);

  wetee.query.weteeOrg.nextDaoId().then((e) {
    print(e);
  });

  final account = await wetee.query.system.account(keyPair.publicKey.bytes);
  print(account.nonce);
  print(keyPair.address);

  var runcall = wetee.tx.weteeOrg.createDao(
    name: convertStringToUint8List("ProgrammingDAO"),
    bg: convertStringToUint8List(''),
    logo: convertStringToUint8List(''),
    img: convertStringToUint8List('https://wetee.app/static/web3/img/logo.png'),
    homeUrl: convertStringToUint8List('https://wetee.app/'),
    imApi: convertStringToUint8List('https://im.tc.asyou.me/'),
    desc: convertStringToUint8List('For the freedom of programming'),
    purpose: convertStringToUint8List("For the freedom of programming"),
    metaData: convertStringToUint8List("{}"),
  );
  final call = hex.encode(runcall.encode());
  final blockHash = await wetee.query.system.blockHash(BigInt.from(0));
  final version =  wetee.constant.system.version;

  print(call);

  // 构建签名体
  final payloadToSign = SigningPayload(
    method: call,
    blockHash:  hex.encode(blockHash),
    genesisHash: hex.encode(blockHash),
    blockNumber: 0,
    eraPeriod: 0,
    nonce: account.nonce.toInt(),
    specVersion: version.specVersion,
    transactionVersion: version.transactionVersion,
    tip: 0,
  );

  // 签名
  final payload = payloadToSign.encode(wetee.registry);
  final signature = keyPair.sign(payload);
  final hexSignature = hex.encode(signature);


  final extrinsic = Extrinsic(
    signer: publicKey,
    method: call,
    signature: hexSignature,
    blockNumber: 0,
    eraPeriod: 0,
    tip: 0,
    nonce: account.nonce.toInt(),
  ).encode(wetee.registry);

  // final hexExtrinsic = hex.encode(extrinsic);
  final submit = await author.submitAndWatchExtrinsic(
    extrinsic,
    (data) => print('From here: ${data.type} - ${data.value}'),
  );
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

Uint8List convertStringToUint8List(String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);

  return unit8List;
}

String convertUint8ListToString(Uint8List uint8list) {
  return String.fromCharCodes(uint8list);
}
