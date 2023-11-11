// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../wetee_runtime/worker/message_origin.dart' as _i2;

class Neighbours {
  const Neighbours({
    required this.prev,
    required this.next,
  });

  factory Neighbours.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// MessageOrigin
  final _i2.MessageOrigin prev;

  /// MessageOrigin
  final _i2.MessageOrigin next;

  static const $NeighboursCodec codec = $NeighboursCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, List<int>>> toJson() => {
        'prev': prev.toJson(),
        'next': next.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Neighbours && other.prev == prev && other.next == next;

  @override
  int get hashCode => Object.hash(
        prev,
        next,
      );
}

class $NeighboursCodec with _i1.Codec<Neighbours> {
  const $NeighboursCodec();

  @override
  void encodeTo(
    Neighbours obj,
    _i1.Output output,
  ) {
    _i2.MessageOrigin.codec.encodeTo(
      obj.prev,
      output,
    );
    _i2.MessageOrigin.codec.encodeTo(
      obj.next,
      output,
    );
  }

  @override
  Neighbours decode(_i1.Input input) {
    return Neighbours(
      prev: _i2.MessageOrigin.codec.decode(input),
      next: _i2.MessageOrigin.codec.decode(input),
    );
  }

  @override
  int sizeHint(Neighbours obj) {
    int size = 0;
    size = size + _i2.MessageOrigin.codec.sizeHint(obj.prev);
    size = size + _i2.MessageOrigin.codec.sizeHint(obj.next);
    return size;
  }
}
