// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

abstract class DiskClass {
  const DiskClass();

  factory DiskClass.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $DiskClassCodec codec = $DiskClassCodec();

  static const $DiskClass values = $DiskClass();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, List<int>> toJson();
}

class $DiskClass {
  const $DiskClass();

  Ssd ssd(List<int> value0) {
    return Ssd(value0);
  }
}

class $DiskClassCodec with _i1.Codec<DiskClass> {
  const $DiskClassCodec();

  @override
  DiskClass decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Ssd._decode(input);
      default:
        throw Exception('DiskClass: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    DiskClass value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Ssd:
        (value as Ssd).encodeTo(output);
        break;
      default:
        throw Exception(
            'DiskClass: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(DiskClass value) {
    switch (value.runtimeType) {
      case Ssd:
        return (value as Ssd)._sizeHint();
      default:
        throw Exception(
            'DiskClass: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Ssd extends DiskClass {
  const Ssd(this.value0);

  factory Ssd._decode(_i1.Input input) {
    return Ssd(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'SSD': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      value0,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Ssd &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
