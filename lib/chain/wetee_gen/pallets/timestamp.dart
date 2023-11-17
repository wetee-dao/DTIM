// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i2;

import '../types/pallet_timestamp/pallet/call.dart' as _i5;
import '../types/wetee_runtime/runtime_call.dart' as _i4;

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

  /// Current time for the current block.
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

  /// Did the timestamp get updated in this block?
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
}

class Txs {
  const Txs();

  /// See [`Pallet::set`].
  _i4.RuntimeCall set({required now}) {
    final _call = _i5.Call.values.set(now: now);
    return _i4.RuntimeCall.values.timestamp(_call);
  }
}

class Constants {
  Constants();

  /// The minimum period between blocks. Beware that this is different to the *expected*
  /// period that the block production apparatus provides. Your chosen consensus system will
  /// generally work with this to determine a sensible block time. e.g. For Aura, it will be
  /// double this period on default settings.
  final BigInt minimumPeriod = BigInt.from(3000);
}
