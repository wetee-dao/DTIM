// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:polkadart/polkadart.dart' as _i1;

import '../types/pallet_sudo/pallet/call.dart' as _i6;
import '../types/sp_core/crypto/account_id32.dart' as _i2;
import '../types/sp_runtime/multiaddress/multi_address.dart' as _i8;
import '../types/sp_weights/weight_v2/weight.dart' as _i7;
import '../types/wetee_runtime/runtime_call.dart' as _i5;

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

  /// Returns the storage key for `key`.
  _i4.Uint8List keyKey() {
    final hashedKey = _key.hashedKey();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Authenticates the sudo key and dispatches a function call with `Root` origin.
  _i5.RuntimeCall sudo({required _i5.RuntimeCall call}) {
    final _call = _i6.Call.values.sudo(call: call);
    return _i5.RuntimeCall.values.sudo(_call);
  }

  /// Authenticates the sudo key and dispatches a function call with `Root` origin.
  /// This function does not check the weight of the call, and instead allows the
  /// Sudo user to specify the weight of the call.
  ///
  /// The dispatch origin for this call must be _Signed_.
  _i5.RuntimeCall sudoUncheckedWeight({
    required _i5.RuntimeCall call,
    required _i7.Weight weight,
  }) {
    final _call = _i6.Call.values.sudoUncheckedWeight(
      call: call,
      weight: weight,
    );
    return _i5.RuntimeCall.values.sudo(_call);
  }

  /// Authenticates the current sudo key and sets the given AccountId (`new`) as the new sudo
  /// key.
  _i5.RuntimeCall setKey({required _i8.MultiAddress new_}) {
    final _call = _i6.Call.values.setKey(new_: new_);
    return _i5.RuntimeCall.values.sudo(_call);
  }

  /// Authenticates the sudo key and dispatches a function call with `Signed` origin from
  /// a given account.
  ///
  /// The dispatch origin for this call must be _Signed_.
  _i5.RuntimeCall sudoAs({
    required _i8.MultiAddress who,
    required _i5.RuntimeCall call,
  }) {
    final _call = _i6.Call.values.sudoAs(
      who: who,
      call: call,
    );
    return _i5.RuntimeCall.values.sudo(_call);
  }

  /// Permanently removes the sudo key.
  ///
  /// **This cannot be un-done.**
  _i5.RuntimeCall removeKey() {
    final _call = _i6.Call.values.removeKey();
    return _i5.RuntimeCall.values.sudo(_call);
  }
}
