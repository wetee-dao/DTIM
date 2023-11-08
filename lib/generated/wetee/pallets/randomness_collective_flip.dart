// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i3;

import '../types/primitive_types/h256.dart' as _i2;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageValue<List<_i2.H256>> _randomMaterial =
      const _i1.StorageValue<List<_i2.H256>>(
    prefix: 'RandomnessCollectiveFlip',
    storage: 'RandomMaterial',
    valueCodec: _i3.SequenceCodec<_i2.H256>(_i2.H256Codec()),
  );

  /// Series of block headers from the last 81 blocks that acts as random seed material. This
  /// is arranged as a ring buffer with `block_number % 81` being the index into the `Vec` of
  /// the oldest hash.
  _i4.Future<List<_i2.H256>> randomMaterial({_i1.BlockHash? at}) async {
    final hashedKey = _randomMaterial.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _randomMaterial.decodeValue(bytes);
    }
    return []; /* Default */
  }
}
