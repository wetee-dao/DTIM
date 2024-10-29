import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:polkadart/polkadart.dart';
import 'package:polkadart/scale_codec.dart' as codec;
import 'package:polkadart_keyring/polkadart_keyring.dart';

import 'package:dtim/application/chain/wetee/wetee_gen/types/wetee_runtime/runtime_call.dart';
import 'package:dtim/application/chain/wetee/wetee_gen/wetee_gen.dart';
import 'package:dtim/domain/models/models.dart';
import 'type.dart';
export 'type.dart';
export 'key_pair.dart';

/// WeTEE 对象
class WeTEE {
  WeTEE(
    this.provider,
    this.rpc,
  )   : query = Queries(rpc.state),
        constant = Constants(),
        tx = Extrinsics(),
        registry = Registry();

  factory WeTEE.url(String url) {
    final provider = Provider.fromUri(Uri.parse(url));
    final rpc = Rpc(
      state: StateApi(provider),
      system: SystemApi(provider),
    );
    return WeTEE(provider, rpc);
  }

  final Provider provider;

  final Queries query;

  final Constants constant;

  final Rpc rpc;

  final Extrinsics tx;

  final Registry registry;

  static final chainUnit = BigInt.from(1000000000000);

  static Map<String, KeyPair> keyPairs = <String, KeyPair>{};

  Future connect() async {
    return await provider.connect();
  }

  Future disconnect() async {
    return await provider.disconnect();
  }

  static Future<Uint8List> signFromAddress(String address, List<int> list) async {
    if (keyPairs[address] == null) {
      throw Exception('Address $address not found');
    }
    final KeyPair keyPair = keyPairs[address]!;

  
    final signature = keyPair.sign(Uint8List.fromList(list));
    // final hexSignature = hex.encode(signature);

    return signature;
  }

  Future<String> signAndSubmit(RuntimeCall rCall, String address, {WithGovPs? gov}) async {
    final blockHash = await query.system.blockHash(BigInt.from(0));
    final version = constant.system.version;
    if (keyPairs[address] == null) {
      throw Exception('Address $address not found');
    }
    final KeyPair keyPair = keyPairs[address]!;
    // final publicKey = hex.encode(keyPair.publicKey.bytes);

    // 获取用户信息
    final account = await query.system.account(keyPair.publicKey.bytes);

    // 构建请求
    late RuntimeCall toCall;
    if (gov != null) {
      if (gov.runType == 2) {
        toCall = tx.weTEESudo.sudo(daoId: gov.daoId, call: rCall);
      } else {
        toCall = tx.weTEEGov.submitProposal(
          daoId: gov.daoId,
          memberData: gov.member,
          proposal: rCall,
          periodIndex: gov.periodIndex,
        );
      }
    } else {
      toCall = rCall;
    }

    final hexCall = toCall.encode();

    // 构建签名体
    final payloadToSign = SigningPayload(
      method: hexCall,
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
    final hexSignature = await signFromAddress(address, payload);

    // 构建交易
    final extrinsic = ExtrinsicPayload(
      signer: Uint8List.fromList(keyPair.publicKey.bytes),
      method: hexCall,
      signature: hexSignature,
      blockNumber: 0,
      eraPeriod: 0,
      tip: 0,
      nonce: account.nonce.toInt(),
    ).encode(registry, SignatureType.sr25519);

    final author = AuthorApi(provider);
    final submit = await author.submitAndWatchExtrinsic(
      extrinsic,
      (data) => print('Extrinsic result: ${data.type} - ${data.value}'),
    );
    submit.onDone(() {
      print('done');
    });
    submit.cancel();
    return "";
  }

  static Future<bool> addKeyring({required ChainAccountData account, required String password}) async {
    late KeyPair keyPair ;
    if (account.encoding.type=="uri"){
      keyPair = await KeyPair.sr25519.fromUri(account.encoded, password);
    }else if (account.encoding.type=="mnemonic") {
      keyPair = await KeyPair.sr25519.fromMnemonic(account.encoded, password);
    }

    if (hex.encode(keyPair.publicKey.bytes) != account.address) {
      throw 'password not match';
    }

    keyPairs[account.address] = keyPair;
    return true;
  }

  Future<int> getBlockNumber() async {
    final completer = Completer<int>();
    final sub = await subscribeFinalizedHeads((s) {
      completer.complete(s.blockNumber!);
    }, provider);
    final header = await completer.future;
    sub.cancel();
    return header;
  }

  Future<List<StorageData>> queryMapList({
    required String module,
    required String storage,
    BlockHash? at,
  }) async {
    final Uint8List hashedKey = Uint8List(32);
    Hasher.twoxx128.hashTo(
      data: Uint8List.fromList(utf8.encode(module)),
      output: hashedKey.buffer.asUint8List(hashedKey.offsetInBytes, 16),
    );
    Hasher.twoxx128.hashTo(
      data: Uint8List.fromList(utf8.encode(storage)),
      output: hashedKey.buffer.asUint8List(hashedKey.offsetInBytes + 16, 16),
    );

    final api = StateApi(provider);
    final keys = await api.getKeysPaged(key: hashedKey, count: 1000);

    final values = await api.queryStorageAt(keys);

    List<StorageData> ks = [];
    for (int i = 0; i < values.length; i++) {
      final v = values[i];
      // final item = v.changes[0];
      for (int j = 0; j < v.changes.length; j++) {
        final item = v.changes[j];
        if (item.value != null) {
          ks.add(item.value!);
        }
      }
    }
    return ks;
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

class ChainStruct<T> {
  ChainStruct();

  factory ChainStruct.decode(codec.Input input) {
    // 在这里根据输入 input 解码数据并返回一个 ChainStruct 对象
    // 这里可以根据需要进行类型转换和处理
    return ChainStruct();
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
      throw const FormatException("Invalid hexadecimal value");
    }
  }
  return val;
}
