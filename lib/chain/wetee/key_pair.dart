import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dtim/domain/models/account.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';
import 'package:substrate_bip39/substrate_bip39.dart';

// TODO 等待库跟新后修复为安全的写法
Future<ChainAccountData> getSeedPhrase({
  required String seedStr,
  required String name,
  required String password,
}) async {
  final keyPair = await KeyPair.fromMnemonic(seedStr);
  return ChainAccountData(
    "0x${hex.encode(keyPair.publicKey.bytes)}",
    seedStr,
    ChainDataEncoding(
      [""],
      'mnemonic',
      'bip39',
    ),
    {
      'ss58Address': keyPair.address,
      'name': name,
      'password': password,
    },
  );
}

List<String> seedGenerate() {
  return SubstrateBip39.generate(words: 24).words;
}

Future<String> signFromAddress(Account user, String ctx) async {
  ChainAccountData data = ChainAccountData.fromJson(json.decode(user.chainData));

  final keyPair = await KeyPair.fromMnemonic(data.encoded);
  List<int> list = utf8.encode(ctx);
  Uint8List bytes = Uint8List.fromList(list);
  final signature = keyPair.sign(bytes);

  return "0x${hex.encode(signature)}";
}
