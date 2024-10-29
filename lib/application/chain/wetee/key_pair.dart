import 'package:convert/convert.dart';
import 'package:dtim/domain/models/account.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';
import 'package:sr25519/sr25519.dart' show Bip39;

// 助记词转换为账户
Future<ChainAccountData> getSeedPhrase({
  required String seedStr,
  required String name,
  required String password,
}) async {
  final keyPair = await KeyPair.sr25519.fromMnemonic(seedStr, password);
  final address = keyPair.address;

  return ChainAccountData(
    hex.encode(keyPair.publicKey.bytes),
    seedStr,
    ChainDataEncoding(
      [""],
      'mnemonic',
      'sr25519',
    ),
    {
      'ss58Address': address,
      'name': name,
    },
  );
}

// 助记词转换为账户
Future<ChainAccountData> getFromUri({
  required String uri,
  required String name,
  required String password,
}) async {
  final keyPair = await KeyPair.sr25519.fromUri(uri, password);
  final address = keyPair.address;

  return ChainAccountData(
    hex.encode(keyPair.publicKey.bytes),
    uri,
    ChainDataEncoding(
      [""],
      'uri',
      'sr25519',
    ),
    {
      'ss58Address': address,
      'name': name,
    },
  );
}


// 生成助记词
List<String> seedGenerate() {
  return Bip39.generateMnemonic().words;
}
