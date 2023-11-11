// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'digest_item.dart' as _i2;

class Digest {
  const Digest({required this.logs});

  factory Digest.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<DigestItem>
  final List<_i2.DigestItem> logs;

  static const $DigestCodec codec = $DigestCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<Map<String, dynamic>>> toJson() =>
      {'logs': logs.map((value) => value.toJson()).toList()};

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Digest &&
          _i4.listsEqual(
            other.logs,
            logs,
          );

  @override
  int get hashCode => logs.hashCode;
}

class $DigestCodec with _i1.Codec<Digest> {
  const $DigestCodec();

  @override
  void encodeTo(
    Digest obj,
    _i1.Output output,
  ) {
    const _i1.SequenceCodec<_i2.DigestItem>(_i2.DigestItem.codec).encodeTo(
      obj.logs,
      output,
    );
  }

  @override
  Digest decode(_i1.Input input) {
    return Digest(
        logs: const _i1.SequenceCodec<_i2.DigestItem>(_i2.DigestItem.codec)
            .decode(input));
  }

  @override
  int sizeHint(Digest obj) {
    int size = 0;
    size = size +
        const _i1.SequenceCodec<_i2.DigestItem>(_i2.DigestItem.codec)
            .sizeHint(obj.logs);
    return size;
  }
}
