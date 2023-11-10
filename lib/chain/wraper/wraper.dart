import 'package:dtim/domain/models/account.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';
import 'package:substrate_bip39/substrate_bip39.dart';

// TODO 等待库风新后修复为安全的写法
Future<ChainData> getSeedPhrase({
  required String seedStr,
  required String name,
  required String password,
}) async {
  final keyPair = await KeyPair.fromMnemonic(seedStr);
  return ChainData(
    keyPair.address,
    seedStr,
   ChainDataEncoding(
      seedStr.split(' '),
      'mnemonic',
      'bip39',
    ),
    {
      'name': name,
      'password': password,
    },
  ); 
}

List<String> seedGenerate() {
  return SubstrateBip39.generate(words: 24).words;
}

