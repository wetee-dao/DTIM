// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i7;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i11;
import '../types/wetee_primitives/types/api_meta.dart' as _i5;
import '../types/wetee_primitives/types/ink_arg.dart' as _i9;
import '../types/wetee_primitives/types/work_id.dart' as _i4;
import '../types/wetee_runtime/runtime_call.dart' as _i8;
import '../types/wetee_tee_bridge/pallet/call.dart' as _i10;
import '../types/wetee_tee_bridge/t_e_e_call.dart' as _i3;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextId = const _i1.StorageValue<BigInt>(
    prefix: 'WeTEEBridge',
    storage: 'NextId',
    valueCodec: _i2.U128Codec.codec,
  );

  final _i1.StorageDoubleMap<BigInt, BigInt, _i3.TEECall> _tEECalls =
      const _i1.StorageDoubleMap<BigInt, BigInt, _i3.TEECall>(
    prefix: 'WeTEEBridge',
    storage: 'TEECalls',
    valueCodec: _i3.TEECall.codec,
    hasher1: _i1.StorageHasher.identity(_i2.U64Codec.codec),
    hasher2: _i1.StorageHasher.identity(_i2.U128Codec.codec),
  );

  final _i1.StorageMap<_i4.WorkId, _i5.ApiMeta> _apiMetas =
      const _i1.StorageMap<_i4.WorkId, _i5.ApiMeta>(
    prefix: 'WeTEEBridge',
    storage: 'ApiMetas',
    valueCodec: _i5.ApiMeta.codec,
    hasher: _i1.StorageHasher.identity(_i4.WorkId.codec),
  );

  _i6.Future<BigInt> nextId({_i1.BlockHash? at}) async {
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

  _i6.Future<_i3.TEECall?> tEECalls(
    BigInt key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _tEECalls.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _tEECalls.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// App
  /// 应用
  _i6.Future<_i5.ApiMeta?> apiMetas(
    _i4.WorkId key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _apiMetas.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _apiMetas.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// Returns the storage key for `nextId`.
  _i7.Uint8List nextIdKey() {
    final hashedKey = _nextId.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `tEECalls`.
  _i7.Uint8List tEECallsKey(
    BigInt key1,
    BigInt key2,
  ) {
    final hashedKey = _tEECalls.hashedKeyFor(
      key1,
      key2,
    );
    return hashedKey;
  }

  /// Returns the storage key for `apiMetas`.
  _i7.Uint8List apiMetasKey(_i4.WorkId key1) {
    final hashedKey = _apiMetas.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `tEECalls`.
  _i7.Uint8List tEECallsMapPrefix(BigInt key1) {
    final hashedKey = _tEECalls.mapPrefix(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `apiMetas`.
  _i7.Uint8List apiMetasMapPrefix() {
    final hashedKey = _apiMetas.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  _i8.RuntimeCall inkCallback({
    required BigInt clusterId,
    required BigInt callId,
    required List<_i9.InkArg> args,
    required BigInt value,
    List<int>? error,
  }) {
    final _call = _i10.Call.values.inkCallback(
      clusterId: clusterId,
      callId: callId,
      args: args,
      value: value,
      error: error,
    );
    return _i8.RuntimeCall.values.weTEEBridge(_call);
  }

  _i8.RuntimeCall callInk({
    required _i4.WorkId workId,
    required _i11.AccountId32 contract,
    required List<int> method,
    required List<_i9.InkArg> args,
    required BigInt value,
  }) {
    final _call = _i10.Call.values.callInk(
      workId: workId,
      contract: contract,
      method: method,
      args: args,
      value: value,
    );
    return _i8.RuntimeCall.values.weTEEBridge(_call);
  }

  _i8.RuntimeCall setTeeApi({
    required _i4.WorkId workId,
    required _i5.ApiMeta meta,
  }) {
    final _call = _i10.Call.values.setTeeApi(
      workId: workId,
      meta: meta,
    );
    return _i8.RuntimeCall.values.weTEEBridge(_call);
  }

  _i8.RuntimeCall deleteCall({
    required BigInt clusterId,
    required BigInt callId,
  }) {
    final _call = _i10.Call.values.deleteCall(
      clusterId: clusterId,
      callId: callId,
    );
    return _i8.RuntimeCall.values.weTEEBridge(_call);
  }
}
