// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/pallet_timestamp/pallet/call.dart' as _i6;
import '../types/wetee_runtime/runtime_call.dart' as _i5;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<BigInt> _now = const _i1.StorageValue<BigInt>(
    prefix: 'Timestamp',
    storage: 'Now',
    valueCodec: _i2.U64Codec.codec,
  );

  final _i1.StorageValue<bool> _didUpdate = const _i1.StorageValue<bool>(
    prefix: 'Timestamp',
    storage: 'DidUpdate',
    valueCodec: _i2.BoolCodec.codec,
  );

  /// The current time for the current block.
  _i3.Future<BigInt> now({_i1.BlockHash? at}) async {
    final hashedKey = _now.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _now.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }

  /// Whether the timestamp has been updated in this block.
  ///
  /// This value is updated to `true` upon successful submission of a timestamp by a node.
  /// It is then checked at the end of each block execution in the `on_finalize` hook.
  _i3.Future<bool> didUpdate({_i1.BlockHash? at}) async {
    final hashedKey = _didUpdate.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _didUpdate.decodeValue(bytes);
    }
    return false; /* Default */
  }

  /// Returns the storage key for `now`.
  _i4.Uint8List nowKey() {
    final hashedKey = _now.hashedKey();
    return hashedKey;
  }

  /// Returns the storage key for `didUpdate`.
  _i4.Uint8List didUpdateKey() {
    final hashedKey = _didUpdate.hashedKey();
    return hashedKey;
  }
}

class Txs {
  const Txs();

  /// Set the current time.
  ///
  /// This call should be invoked exactly once per block. It will panic at the finalization
  /// phase, if this call hasn't been invoked by that time.
  ///
  /// The timestamp should be greater than the previous one by the amount specified by
  /// [`Config::MinimumPeriod`].
  ///
  /// The dispatch origin for this call must be _None_.
  ///
  /// This dispatch class is _Mandatory_ to ensure it gets executed in the block. Be aware
  /// that changing the complexity of this call could result exhausting the resources in a
  /// block to execute any other calls.
  ///
  /// ## Complexity
  /// - `O(1)` (Note that implementations of `OnTimestampSet` must also be `O(1)`)
  /// - 1 storage read and 1 storage mutation (codec `O(1)` because of `DidUpdate::take` in
  ///  `on_finalize`)
  /// - 1 event handler `on_timestamp_set`. Must be `O(1)`.
  _i5.RuntimeCall set({required BigInt now}) {
    final _call = _i6.Call.values.set(now: now);
    return _i5.RuntimeCall.values.timestamp(_call);
  }
}

class Constants {
  Constants();

  /// The minimum period between blocks.
  ///
  /// Be aware that this is different to the *expected* period that the block production
  /// apparatus provides. Your chosen consensus system will generally work with this to
  /// determine a sensible block time. For example, in the Aura pallet it will be double this
  /// period on default settings.
  final BigInt minimumPeriod = BigInt.from(3000);
}
