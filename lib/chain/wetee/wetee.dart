import 'dart:async';
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_runtime/runtime_call.dart';
import 'package:dtim/chain/wetee_gen/wetee_gen.dart';
import 'package:dtim/domain/models/block_header.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:polkadart/polkadart.dart';
import 'package:polkadart_keyring/polkadart_keyring.dart';

import 'type.dart';

export './key_pair.dart';
export './type.dart';

class Wetee {
  Wetee(
    this.provider,
    this.rpc,
  )   : query = Queries(rpc.state),
        constant = Constants(),
        tx = Extrinsics(),
        registry = Registry();

  factory Wetee.url(String url) {
    final provider = Provider.fromUri(Uri.parse(url));
    final rpc = Rpc(
      state: StateApi(provider),
      system: SystemApi(provider),
    );
    return Wetee(provider, rpc);
  }

  final Provider provider;

  final Queries query;

  final Constants constant;

  final Rpc rpc;

  final Extrinsics tx;

  final Registry registry;

  static final chainUnit = BigInt.from(1000000000000);

  Map<String, KeyPair> keyPairs = <String, KeyPair>{};

  Future connect() async {
    return await provider.connect();
  }

  Future disconnect() async {
    return await provider.disconnect();
  }

  Future<String> signAndSubmit(RuntimeCall rCall, String address, {WithGovPs? gov}) async {
    final blockHash = await query.system.blockHash(BigInt.from(0));
    final version = constant.system.version;
    if(keyPairs[address]==null){
      throw Exception('Address $address not found');
    }
    final KeyPair keyPair = keyPairs[address]!;
    final publicKey = hex.encode(keyPair.publicKey.bytes);

    // 获取用户信息
    final account = await query.system.account(keyPair.publicKey.bytes);

    late RuntimeCall toCall;
    if (gov != null) {
      if (gov.runType == 2) {
        toCall = tx.weteeSudo.sudo(daoId: gov.daoId, call: rCall);
      } else {
        toCall = tx.weteeGov.submitProposal(
          daoId: gov.daoId,
          memberData: gov.member,
          proposal: rCall,
          periodIndex: gov.periodIndex,
        );
      }
    } else {
      toCall = rCall;
    }

    final call = hex.encode(toCall.encode());
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
    // print(signature);
    final hexSignature = hex.encode(signature);
    // final hexSignature = "0d168ee693a3451613b651b0bafc501a8729c5dbe25c611bf1176e544c7aea0af861553b470cde9327465610d23eb1efe915965cf4797368733353b84b467708";

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
    submit.cancel();
    return "";
  }

  Future<bool> addKeyring({required String keyringStr,required String password}) async {
    ChainData data = ChainData.fromJson(json.decode(keyringStr)) ;
    final keyPair = await KeyPair.fromMnemonic(data.encoded);
    final publicKey = hex.encode(keyPair.publicKey.bytes);
    keyPairs[publicKey] = keyPair;
    return true;
  }

  Future<int> getBlockNumber(Provider provider) async {
    final completer = Completer<void>();
    var header = 0;
    final sub = await subscribeFinalizedHeads((s) {
      print('Finalized head: ${s.blockNumber}');
      header = s.blockNumber!;
    }, provider);
    await completer.future.then((_) => sub.cancel());
    return header;
  }

  Future<StreamSubscription<BlockHeader>> subscribeFinalizedHeads(
      void Function(BlockHeader) onData, Provider provider) async {
    final subscription = await provider.subscribe(
      'chain_subscribeFinalizedHeads',
      [],
      onCancel: (subscription) async {
        await provider.send('chain_unsubscribeFinalizedHeads', [subscription]);
      },
    );

    return subscription.stream.map((response) {
      var header = BlockHeader.fromJson(response.result);
      header.blockNumber = hexToInt(header.number);
      return header;
    }).listen(onData);

    // return subscription.stream.map((event) => event.result).listen(onData);
  }
}

int hexToInt(String hex) {
  hex = hex.replaceAll("0x", "");
  int val = 0;
  int len = hex.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = hex.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("Invalid hexadecimal value");
    }
  }
  return val;
}
