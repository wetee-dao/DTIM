// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/sp_runtime/multi_signature.dart' as _i9;
import '../types/wetee_dsecret/pallet/call.dart' as _i8;
import '../types/wetee_primitives/types/p2_p_addr.dart' as _i4;
import '../types/wetee_primitives/types/work_id.dart' as _i10;
import '../types/wetee_runtime/runtime_call.dart' as _i7;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<List<int>> _codeSignature =
      const _i1.StorageValue<List<int>>(
    prefix: 'WeTEEDsecret',
    storage: 'CodeSignature',
    valueCodec: _i2.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<List<int>> _codeSigner =
      const _i1.StorageValue<List<int>>(
    prefix: 'WeTEEDsecret',
    storage: 'CodeSigner',
    valueCodec: _i2.U8SequenceCodec.codec,
  );

  final _i1.StorageValue<BigInt> _nextNodeId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEDsecret',
    storage: 'NextNodeId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageMap<BigInt, _i3.AccountId32> _nodes =
      const _i1.StorageMap<BigInt, _i3.AccountId32>(
    prefix: 'WeTEEDsecret',
    storage: 'Nodes',
    valueCodec: _i3.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, _i4.P2PAddr> _nodePubServers =
      const _i1.StorageMap<BigInt, _i4.P2PAddr>(
    prefix: 'WeTEEDsecret',
    storage: 'NodePubServers',
    valueCodec: _i4.P2PAddr.codec,
    hasher: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// DKG 代码版本
  _i5.Future<List<int>> codeSignature({_i1.BlockHash? at}) async {
    final hashedKey = _codeSignature.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _codeSignature.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// DKG 代码打包签名人
  _i5.Future<List<int>> codeSigner({_i1.BlockHash? at}) async {
    final hashedKey = _codeSigner.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _codeSigner.decodeValue(bytes);
    }
    return List<int>.filled(
      0,
      0,
      growable: true,
    ); /* Default */
  }

  /// The id of the next node to be created.
  /// 获取下一个 node id
  _i5.Future<BigInt> nextNodeId({_i1.BlockHash? at}) async {
    final hashedKey = _nextNodeId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextNodeId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// dkg 节点列表
  _i5.Future<_i3.AccountId32?> nodes(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _nodes.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nodes.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// dkg pub server
  /// dkg pub 服务
  _i5.Future<_i4.P2PAddr?> nodePubServers(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _nodePubServers.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nodePubServers.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `codeSignature`.
  _i6.Uint8List codeSignatureKey() {
    final hashedKey = _codeSignature.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `codeSigner`.
  _i6.Uint8List codeSignerKey() {
    final hashedKey = _codeSigner.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `nextNodeId`.
  _i6.Uint8List nextNodeIdKey() {
    final hashedKey = _nextNodeId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `nodes`.
  _i6.Uint8List nodesKey(BigInt key1) {
    final hashedKey = _nodes.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nodePubServers`.
  _i6.Uint8List nodePubServersKey(BigInt key1) {
    final hashedKey = _nodePubServers.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `nodes`.
  _i6.Uint8List nodesMapPrefix() {
    final hashedKey = _nodes.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `nodePubServers`.
  _i6.Uint8List nodePubServersMapPrefix() {
    final hashedKey = _nodePubServers.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// 注册 dkg 节点
  /// register dkg node
  _i7.RuntimeCall registerNode({required _i3.AccountId32 sender}) {
    final _call = _i8.Call.values.registerNode(sender: sender);
    return _i7.RuntimeCall.values.weTEEDsecret(_call);
  }

  /// 上传共识节点代码
  /// update consensus node code
  _i7.RuntimeCall uploadCode({
    required List<int> signature,
    required List<int> signer,
  }) {
    final _call = _i8.Call.values.uploadCode(
      signature: signature,
      signer: signer,
    );
    return _i7.RuntimeCall.values.weTEEDsecret(_call);
  }

  /// 上传共识节点代码
  /// update consensus node code
  _i7.RuntimeCall uploadClusterProof({
    required BigInt cid,
    required List<int> report,
    required List<_i3.AccountId32> pubs,
    required List<_i9.MultiSignature> sigs,
  }) {
    final _call = _i8.Call.values.uploadClusterProof(
      cid: cid,
      report: report,
      pubs: pubs,
      sigs: sigs,
    );
    return _i7.RuntimeCall.values.weTEEDsecret(_call);
  }

  /// 上传 devloper，report hash 启动应用
  _i7.RuntimeCall workLaunch({
    required _i10.WorkId work,
    List<int>? report,
    required _i3.AccountId32 deployKey,
  }) {
    final _call = _i8.Call.values.workLaunch(
      work: work,
      report: report,
      deployKey: deployKey,
    );
    return _i7.RuntimeCall.values.weTEEDsecret(_call);
  }

  /// 设置节点公网服务
  /// set node pub server
  _i7.RuntimeCall setNodePubServer({
    required BigInt id,
    required _i4.P2PAddr server,
  }) {
    final _call = _i8.Call.values.setNodePubServer(
      id: id,
      server: server,
    );
    return _i7.RuntimeCall.values.weTEEDsecret(_call);
  }
}
