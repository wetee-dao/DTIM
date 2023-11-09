import 'package:convert/convert.dart';
import 'package:dtim/chain/wetee/types/wetee_runtime/runtime_call.dart';
import 'package:dtim/chain/wetee/wetee.dart';
import 'package:polkadart/polkadart.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

extension Tx on Wetee {
  Future<String> signAndSubmit(RuntimeCall rCall,KeyPair keyPair,Provider provider) async {
    final call = hex.encode(rCall.encode());
    final blockHash = await query.system.blockHash(BigInt.from(0));
    final version = constant.system.version;
    final publicKey = hex.encode(keyPair.publicKey.bytes);

    // 获取用户信息
    final account = await query.system.account(keyPair.publicKey.bytes);

    // 构建签名体
    final payloadToSign = SigningPayload(
      method: call,
      blockHash: hex.encode(blockHash),
      genesisHash: hex.encode(blockHash),
      blockNumber: 0,
      eraPeriod: 0,
      nonce: account.nonce.toInt(),
      specVersion: version.specVersion,
      transactionVersion: version.transactionVersion,
      tip: 0,
    );

    // 签名
    final payload = payloadToSign.encode(registry);
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
    ).encode(registry);

    final author = AuthorApi(provider);
    final submit = await author.submitAndWatchExtrinsic(
      extrinsic,
      (data) => print('From here: ${data.type} - ${data.value}'),
    );
    print(submit);
    return "";
  }
}
