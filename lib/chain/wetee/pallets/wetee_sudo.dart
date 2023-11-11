// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i6;
import '../types/wetee_sudo/pallet/call.dart' as _i7;
import '../types/wetee_sudo/sudo_task.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<BigInt, _i2.AccountId32> _account =
      const _i1.StorageMap<BigInt, _i2.AccountId32>(
    prefix: 'WeteeSudo',
    storage: 'Account',
    valueCodec: _i2.AccountId32Codec(),
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, bool> _closeDao =
      const _i1.StorageMap<BigInt, bool>(
    prefix: 'WeteeSudo',
    storage: 'CloseDao',
    valueCodec: _i3.BoolCodec.codec,
    hasher: _i1.StorageHasher.identity(_i3.U64Codec.codec),
  );

  final _i1.StorageMap<BigInt, List<_i4.SudoTask>> _sudoTasks =
      const _i1.StorageMap<BigInt, List<_i4.SudoTask>>(
    prefix: 'WeteeSudo',
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
}

class Txs {
  const Txs();

  /// See [`Pallet::sudo`].
  _i6.RuntimeCall sudo({
    required daoId,
    required call,
  }) {
    final _call = _i7.Call.values.sudo(
      daoId: daoId,
      call: call,
    );
    return _i6.RuntimeCall.values.weteeSudo(_call);
  }

  /// See [`Pallet::set_sudo_account`].
  _i6.RuntimeCall setSudoAccount({
    required daoId,
    required sudoAccount,
  }) {
    final _call = _i7.Call.values.setSudoAccount(
      daoId: daoId,
      sudoAccount: sudoAccount,
    );
    return _i6.RuntimeCall.values.weteeSudo(_call);
  }

  /// See [`Pallet::close_sudo`].
  _i6.RuntimeCall closeSudo({required daoId}) {
    final _call = _i7.Call.values.closeSudo(daoId: daoId);
    return _i6.RuntimeCall.values.weteeSudo(_call);
  }
}
