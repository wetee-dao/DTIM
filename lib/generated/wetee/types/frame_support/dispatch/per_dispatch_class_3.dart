// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class PerDispatchClass {
  const PerDispatchClass({
    required this.normal,
    required this.operational,
    required this.mandatory,
  });

  factory PerDispatchClass.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// T
  final int normal;

  /// T
  final int operational;

  /// T
  final int mandatory;

  static const $PerDispatchClassCodec codec = $PerDispatchClassCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'normal': normal,
        'operational': operational,
        'mandatory': mandatory,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is PerDispatchClass &&
          other.normal == normal &&
          other.operational == operational &&
          other.mandatory == mandatory;

  @override
  int get hashCode => Object.hash(
        normal,
        operational,
        mandatory,
      );
}

class $PerDispatchClassCodec with _i1.Codec<PerDispatchClass> {
  const $PerDispatchClassCodec();

  @override
  void encodeTo(
    PerDispatchClass obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.normal,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.operational,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.mandatory,
      output,
    );
  }

  @override
  PerDispatchClass decode(_i1.Input input) {
    return PerDispatchClass(
      normal: _i1.U32Codec.codec.decode(input),
      operational: _i1.U32Codec.codec.decode(input),
      mandatory: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(PerDispatchClass obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.normal);
    size = size + _i1.U32Codec.codec.sizeHint(obj.operational);
    size = size + _i1.U32Codec.codec.sizeHint(obj.mandatory);
    return size;
  }
}
