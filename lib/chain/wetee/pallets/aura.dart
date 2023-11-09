// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/sp_consensus_aura/sr25519/app_sr25519/public.dart' as _i2;
import '../types/sp_consensus_slots/slot.dart' as _i4;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<List<_i2.Public>> _authorities =
      const _i1.StorageValue<List<_i2.Public>>(
    prefix: 'Aura',
    storage: 'Authorities',
    valueCodec: _i3.SequenceCodec<_i2.Public>(_i2.PublicCodec()),
  );

  final _i1.StorageValue<_i4.Slot> _currentSlot =
      const _i1.StorageValue<_i4.Slot>(
    prefix: 'Aura',
    storage: 'CurrentSlot',
    valueCodec: _i4.SlotCodec(),
  );

  /// The current authority set.
  _i5.Future<List<_i2.Public>> authorities({_i1.BlockHash? at}) async {
    final hashedKey = _authorities.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _authorities.decodeValue(bytes);
    }
    return []; /* Default */
  }

  /// The current slot of this block.
  ///
  /// This will be set in `on_initialize`.
  _i5.Future<_i4.Slot> currentSlot({_i1.BlockHash? at}) async {
    final hashedKey = _currentSlot.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _currentSlot.decodeValue(bytes);
    }
    return BigInt.zero; /* Default */
  }
}
