// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../sp_core/crypto/account_id32.dart' as _i3;

abstract class RawOrigin {
  const RawOrigin();

  factory RawOrigin.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $RawOriginCodec codec = $RawOriginCodec();

  static const $RawOrigin values = $RawOrigin();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, dynamic> toJson();
}

class $RawOrigin {
  const $RawOrigin();

  Root root() {
    return Root();
  }

  Signed signed(_i3.AccountId32 value0) {
    return Signed(value0);
  }

  None none() {
    return None();
  }
}

class $RawOriginCodec with _i1.Codec<RawOrigin> {
  const $RawOriginCodec();

  @override
  RawOrigin decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const Root();
      case 1:
        return Signed._decode(input);
      case 2:
        return const None();
      default:
        throw Exception('RawOrigin: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    RawOrigin value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Root:
        (value as Root).encodeTo(output);
        break;
      case Signed:
        (value as Signed).encodeTo(output);
        break;
      case None:
        (value as None).encodeTo(output);
        break;
      default:
        throw Exception(
            'RawOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(RawOrigin value) {
    switch (value.runtimeType) {
      case Root:
        return 1;
      case Signed:
        return (value as Signed)._sizeHint();
      case None:
        return 1;
      default:
        throw Exception(
            'RawOrigin: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Root extends RawOrigin {
  const Root();

  @override
  Map<String, dynamic> toJson() => {'Root': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Root;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Signed extends RawOrigin {
  const Signed(this.value0);

  factory Signed._decode(_i1.Input input) {
    return Signed(const _i1.U8ArrayCodec(32).decode(input));
  }

  /// AccountId
  final _i3.AccountId32 value0;

  @override
  Map<String, List<int>> toJson() => {'Signed': value0.toList()};

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
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
      other is Signed &&
          _i4.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class None extends RawOrigin {
  const None();

  @override
  Map<String, dynamic> toJson() => {'None': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is None;

  @override
  int get hashCode => runtimeType.hashCode;
}
