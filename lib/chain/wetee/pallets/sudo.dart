// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/pallet_sudo/pallet/call.dart' as _i5;
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<_i2.AccountId32> _key =
      const _i1.StorageValue<_i2.AccountId32>(
    prefix: 'Sudo',
    storage: 'Key',
    valueCodec: _i2.AccountId32Codec(),
  );

  /// The `AccountId` of the sudo key.
  _i3.Future<_i2.AccountId32?> key({_i1.BlockHash? at}) async {
    final hashedKey = _key.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _key.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::sudo`].
  _i4.RuntimeCall sudo({required call}) {
    final _call = _i5.Call.values.sudo(call: call);
    return _i4.RuntimeCall.values.sudo(_call);
  }

  /// See [`Pallet::sudo_unchecked_weight`].
  _i4.RuntimeCall sudoUncheckedWeight({
    required call,
    required weight,
  }) {
    final _call = _i5.Call.values.sudoUncheckedWeight(
      call: call,
      weight: weight,
    );
    return _i4.RuntimeCall.values.sudo(_call);
  }

  /// See [`Pallet::set_key`].
  _i4.RuntimeCall setKey({required new_}) {
    final _call = _i5.Call.values.setKey(new_: new_);
    return _i4.RuntimeCall.values.sudo(_call);
  }

  /// See [`Pallet::sudo_as`].
  _i4.RuntimeCall sudoAs({
    required who,
    required call,
  }) {
    final _call = _i5.Call.values.sudoAs(
      who: who,
      call: call,
    );
    return _i4.RuntimeCall.values.sudo(_call);
  }
}
