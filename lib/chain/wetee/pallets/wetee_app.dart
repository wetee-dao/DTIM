// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/sp_core/crypto/account_id32.dart' as _i3;
import '../types/wetee_app/pallet/call.dart' as _i7;
import '../types/wetee_app/tee_app.dart' as _i4;
import '../types/wetee_runtime/runtime_call.dart' as _i6;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _nextTeeId = const _i1.StorageValue<BigInt>(
    prefix: 'WeteeApp',
    storage: 'NextTeeId',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeApp> _tEEApps =
      const _i1.StorageDoubleMap<_i3.AccountId32, BigInt, _i4.TeeApp>(
    prefix: 'WeteeApp',
    storage: 'TEEApps',
    valueCodec: _i4.TeeApp.codec,
    hasher1: _i1.StorageHasher.identity(_i3.AccountId32Codec()),
    hasher2: _i1.StorageHasher.identity(_i2.U64Codec.codec),
  );

  /// The id of the next app to be created.
  /// 获取下一个app id
  _i5.Future<BigInt> nextTeeId({_i1.BlockHash? at}) async {
    final hashedKey = _nextTeeId.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _nextTeeId.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// 任务
  /// Those who have locked a deposit.
  /// TWOX-NOTE: Safe, as increasing integer keys are safe.
  _i5.Future<_i4.TeeApp?> tEEApps(
    _i3.AccountId32 key1,
    BigInt key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _tEEApps.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _tEEApps.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::create`].
  _i6.RuntimeCall create({
    required name,
    required image,
    required port,
  }) {
    final _call = _i7.Call.values.create(
      name: name,
      image: image,
      port: port,
    );
    return _i6.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::update`].
  _i6.RuntimeCall update() {
    final _call = _i7.Call.values.update();
    return _i6.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::set_settings`].
  _i6.RuntimeCall setSettings() {
    final _call = _i7.Call.values.setSettings();
    return _i6.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::charge`].
  _i6.RuntimeCall charge() {
    final _call = _i7.Call.values.charge();
    return _i6.RuntimeCall.values.weteeApp(_call);
  }

  /// See [`Pallet::stop`].
  _i6.RuntimeCall stop() {
    final _call = _i7.Call.values.stop();
    return _i6.RuntimeCall.values.weteeApp(_call);
  }
}
