// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i7;
import '../types/wetee_sudo/pallet/call.dart' as _i8;
import '../types/wetee_sudo/sudo_task.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.AccountId32> _account =
      const _i1.StorageMap<BigInt, _i2.AccountId32>(
    prefix: 'WeTEESudo',
    storage: 'Account',
    valueCodec: _i2.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, bool> _closeDao =
      const _i1.StorageMap<BigInt, bool>(
    prefix: 'WeTEESudo',
    storage: 'CloseDao',
    valueCodec: _i3.BoolCodec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i4.SudoTask>> _sudoTasks =
      const _i1.StorageMap<BigInt, List<_i4.SudoTask>>(
    prefix: 'WeTEESudo',
    storage: 'SudoTasks',
    valueCodec: _i3.SequenceCodec<_i4.SudoTask>(_i4.SudoTask.codec),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  /// WETEE Root account id.
  /// 组织最高权限 id
  _i5.Future<_i2.AccountId32?> account(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _account.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _account.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// WETEE Root account id.
  /// 组织最高权限 id
  _i5.Future<bool?> closeDao(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _closeDao.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _closeDao.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// sudo模块调用历史
  _i5.Future<List<_i4.SudoTask>> sudoTasks(
    BigInt key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _sudoTasks.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _sudoTasks.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// Returns the storage key for `account`.
  _i6.Uint8List accountKey(BigInt key1) {
    final hashedKey = _account.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `closeDao`.
  _i6.Uint8List closeDaoKey(BigInt key1) {
    final hashedKey = _closeDao.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage key for `sudoTasks`.
  _i6.Uint8List sudoTasksKey(BigInt key1) {
    final hashedKey = _sudoTasks.hashedKeyFor(key1);
    return hashedKey;
  }

  /// Returns the storage map key prefix for `account`.
  _i6.Uint8List accountMapPrefix() {
    final hashedKey = _account.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `closeDao`.
  _i6.Uint8List closeDaoMapPrefix() {
    final hashedKey = _closeDao.mapPrefix();
    return hashedKey;
  }

  /// Returns the storage map key prefix for `sudoTasks`.
  _i6.Uint8List sudoTasksMapPrefix() {
    final hashedKey = _sudoTasks.mapPrefix();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Execute external transactions as root
  /// 以 root 账户执行函数
  _i7.RuntimeCall sudo({
    required BigInt daoId,
    required _i7.RuntimeCall call,
  }) {
    final _call = _i8.Call.values.sudo(
      daoId: daoId,
      call: call,
    );
    return _i7.RuntimeCall.values.weTEESudo(_call);
  }

  /// set sudo account
  /// 设置超级用户账户
  _i7.RuntimeCall setSudoAccount({
    required BigInt daoId,
    required _i2.AccountId32 sudoAccount,
  }) {
    final _call = _i8.Call.values.setSudoAccount(
      daoId: daoId,
      sudoAccount: sudoAccount,
    );
    return _i7.RuntimeCall.values.weTEESudo(_call);
  }

  /// close sudo
  /// 关闭 sudo 功能
  _i7.RuntimeCall closeSudo({required BigInt daoId}) {
    final _call = _i8.Call.values.closeSudo(daoId: daoId);
    return _i7.RuntimeCall.values.weTEESudo(_call);
  }
}
