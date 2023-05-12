import 'dart:io';

import 'package:asyou_app/bridge_generated.dart';
import 'package:asyou_app/rust_wraper.io.dart';

// ignore: constant_identifier_names
const DAO_ROOT_SEED = "gloom album notable jewel divorce never trouble lesson month neck sign harbor";

void main() async {
  // 添加用户到项目
  var rootAddress = await rustApi.addSeed(seed: DAO_ROOT_SEED);
  var clientIndex = await rustApi.connect(url: "ws://127.0.0.1:3994");
  print("Start INIT");
  rustApi.initWork();
  for (var i=0;i<100;i++){
    await rustApi.send();
  }

  exit(0);
}
