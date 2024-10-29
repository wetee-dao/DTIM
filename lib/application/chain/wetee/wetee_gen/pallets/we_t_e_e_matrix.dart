// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/frame_support/pallet_id.dart' as _i9;
import '../types/wetee_matrix/node_info.dart' as _i2;
import '../types/wetee_matrix/pallet/call.dart' as _i7;
import '../types/wetee_matrix/status.dart' as _i8;
import '../types/wetee_runtime/runtime_call.dart' as _i6;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.NodeInfo> _matrix =
      const _i1.StorageMap<BigInt, _i2.NodeInfo>(
    prefix: 'WeTEEMatrix',
    storage: 'Matrix',
    valueCodec: _i2.NodeInfo.codec,
    hasher: _i1.StorageHasher.identity(_i3.U128Codec.codec),
  );

  final _i1.StorageValue<BigInt> _nextId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEMatrix',
    storage: 'NextId',
    valueCodec: _i3.U128Codec.codec,
  );

  /// All Nodes that have been created.
  /// 所有节点
  _i4.Future<_i2.NodeInfo?> matrix(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _matrix.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _matrix.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The id of the next node to be created.
  /// 获取下一个节点id
  _i4.Future<BigInt> nextId({_i1.BlockHash? at}) async {
    final hashedKey = _nextId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextId.decodeValue(bytes);
    }
    return BigInt.one; /* Default */
  }

  /// Returns the storage key for `matrix`.
  _i5.Uint8List matrixKey(BigInt key1) {
    final hashedKey = _matrix.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `nextId`.
  _i5.Uint8List nextIdKey() {
    final hashedKey = _nextId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `matrix`.
  _i5.Uint8List matrixMapPrefix() {
    final hashedKey = _matrix.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Create a N o de
  /// 从一个通证池,创建一个节点
  _i6.RuntimeCall createNode({
    required List<int> name,
    required List<int> desc,
    required List<int> purpose,
    required List<int> metaData,
    required List<int> imApi,
    required List<int> bg,
    required List<int> logo,
    required List<int> img,
    required List<int> homeUrl,
  }) {
    final _call = _i7.Call.values.createNode(
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
    );
    return _i6.RuntimeCall.values.weTEEMatrix(_call);
  }

  /// update node info
  /// 更新节点信息
  _i6.RuntimeCall updateNode({
    required BigInt nodeId,
    List<int>? name,
    List<int>? desc,
    List<int>? purpose,
    List<int>? metaData,
    List<int>? imApi,
    List<int>? bg,
    List<int>? logo,
    List<int>? img,
    List<int>? homeUrl,
    _i8.Status? status,
  }) {
    final _call = _i7.Call.values.updateNode(
      nodeId: nodeId,
      name: name,
      desc: desc,
      purpose: purpose,
      metaData: metaData,
      imApi: imApi,
      bg: bg,
      logo: logo,
      img: img,
      homeUrl: homeUrl,
      status: status,
    );
    return _i6.RuntimeCall.values.weTEEMatrix(_call);
  }
}

class Constants {
  Constants();

  /// pallet id
  /// 模块id
  final _i9.PalletId palletId = const <int>[
    119,
    101,
    109,
    97,
    116,
    114,
    105,
    120,
  ];
}
