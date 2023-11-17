// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../sp_weights/weight_v2/weight.dart' as _i2;

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
  final _i2.Weight normal;

  /// T
  final _i2.Weight operational;

  /// T
  final _i2.Weight mandatory;

  static const $PerDispatchClassCodec codec = $PerDispatchClassCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, Map<String, BigInt>> toJson() => {
        'normal': normal.toJson(),
        'operational': operational.toJson(),
        'mandatory': mandatory.toJson(),
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
    _i2.Weight.codec.encodeTo(
      obj.normal,
      output,
    );
    _i2.Weight.codec.encodeTo(
      obj.operational,
      output,
    );
    _i2.Weight.codec.encodeTo(
      obj.mandatory,
      output,
    );
  }

  @override
  PerDispatchClass decode(_i1.Input input) {
    return PerDispatchClass(
      normal: _i2.Weight.codec.decode(input),
      operational: _i2.Weight.codec.decode(input),
      mandatory: _i2.Weight.codec.decode(input),
    );
  }

  @override
  int sizeHint(PerDispatchClass obj) {
    int size = 0;
    size = size + _i2.Weight.codec.sizeHint(obj.normal);
    size = size + _i2.Weight.codec.sizeHint(obj.operational);
    size = size + _i2.Weight.codec.sizeHint(obj.mandatory);
    return size;
  }
}
