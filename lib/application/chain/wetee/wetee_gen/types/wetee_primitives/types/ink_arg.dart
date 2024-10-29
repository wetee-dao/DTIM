// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

abstract class InkArg {
  const InkArg();

  factory InkArg.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $InkArgCodec codec = $InkArgCodec();

  static const $InkArg values = $InkArg();

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

class $InkArg {
  const $InkArg();

  TBool tBool(bool value0) {
    return TBool(value0);
  }

  U8 u8(int value0) {
    return U8(value0);
  }

  I8 i8(int value0) {
    return I8(value0);
  }

  U16 u16(int value0) {
    return U16(value0);
  }

  I16 i16(int value0) {
    return I16(value0);
  }

  U32 u32(int value0) {
    return U32(value0);
  }

  I32 i32(int value0) {
    return I32(value0);
  }

  U64 u64(BigInt value0) {
    return U64(value0);
  }

  I64 i64(BigInt value0) {
    return I64(value0);
  }

  U128 u128(BigInt value0) {
    return U128(value0);
  }

  I128 i128(BigInt value0) {
    return I128(value0);
  }

  TString tString(List<int> value0) {
    return TString(value0);
  }
}

class $InkArgCodec with _i1.Codec<InkArg> {
  const $InkArgCodec();

  @override
  InkArg decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return TBool._decode(input);
      case 1:
        return U8._decode(input);
      case 2:
        return I8._decode(input);
      case 3:
        return U16._decode(input);
      case 4:
        return I16._decode(input);
      case 5:
        return U32._decode(input);
      case 6:
        return I32._decode(input);
      case 7:
        return U64._decode(input);
      case 8:
        return I64._decode(input);
      case 9:
        return U128._decode(input);
      case 10:
        return I128._decode(input);
      case 11:
        return TString._decode(input);
      default:
        throw Exception('InkArg: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    InkArg value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case TBool:
        (value as TBool).encodeTo(output);
        break;
      case U8:
        (value as U8).encodeTo(output);
        break;
      case I8:
        (value as I8).encodeTo(output);
        break;
      case U16:
        (value as U16).encodeTo(output);
        break;
      case I16:
        (value as I16).encodeTo(output);
        break;
      case U32:
        (value as U32).encodeTo(output);
        break;
      case I32:
        (value as I32).encodeTo(output);
        break;
      case U64:
        (value as U64).encodeTo(output);
        break;
      case I64:
        (value as I64).encodeTo(output);
        break;
      case U128:
        (value as U128).encodeTo(output);
        break;
      case I128:
        (value as I128).encodeTo(output);
        break;
      case TString:
        (value as TString).encodeTo(output);
        break;
      default:
        throw Exception(
            'InkArg: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(InkArg value) {
    switch (value.runtimeType) {
      case TBool:
        return (value as TBool)._sizeHint();
      case U8:
        return (value as U8)._sizeHint();
      case I8:
        return (value as I8)._sizeHint();
      case U16:
        return (value as U16)._sizeHint();
      case I16:
        return (value as I16)._sizeHint();
      case U32:
        return (value as U32)._sizeHint();
      case I32:
        return (value as I32)._sizeHint();
      case U64:
        return (value as U64)._sizeHint();
      case I64:
        return (value as I64)._sizeHint();
      case U128:
        return (value as U128)._sizeHint();
      case I128:
        return (value as I128)._sizeHint();
      case TString:
        return (value as TString)._sizeHint();
      default:
        throw Exception(
            'InkArg: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class TBool extends InkArg {
  const TBool(this.value0);

  factory TBool._decode(_i1.Input input) {
    return TBool(_i1.BoolCodec.codec.decode(input));
  }

  /// bool
  final bool value0;

  @override
  Map<String, bool> toJson() => {'TBool': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.BoolCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
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
      other is TBool && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class U8 extends InkArg {
  const U8(this.value0);

  factory U8._decode(_i1.Input input) {
    return U8(_i1.U8Codec.codec.decode(input));
  }

  /// u8
  final int value0;

  @override
  Map<String, int> toJson() => {'U8': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
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
      other is U8 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class I8 extends InkArg {
  const I8(this.value0);

  factory I8._decode(_i1.Input input) {
    return I8(_i1.I8Codec.codec.decode(input));
  }

  /// i8
  final int value0;

  @override
  Map<String, int> toJson() => {'I8': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.I8Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.I8Codec.codec.encodeTo(
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
      other is I8 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class U16 extends InkArg {
  const U16(this.value0);

  factory U16._decode(_i1.Input input) {
    return U16(_i1.U16Codec.codec.decode(input));
  }

  /// u16
  final int value0;

  @override
  Map<String, int> toJson() => {'U16': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
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
      other is U16 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class I16 extends InkArg {
  const I16(this.value0);

  factory I16._decode(_i1.Input input) {
    return I16(_i1.I16Codec.codec.decode(input));
  }

  /// i16
  final int value0;

  @override
  Map<String, int> toJson() => {'I16': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.I16Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.I16Codec.codec.encodeTo(
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
      other is I16 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class U32 extends InkArg {
  const U32(this.value0);

  factory U32._decode(_i1.Input input) {
    return U32(_i1.U32Codec.codec.decode(input));
  }

  /// u32
  final int value0;

  @override
  Map<String, int> toJson() => {'U32': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U32Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
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
      other is U32 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class I32 extends InkArg {
  const I32(this.value0);

  factory I32._decode(_i1.Input input) {
    return I32(_i1.I32Codec.codec.decode(input));
  }

  /// i32
  final int value0;

  @override
  Map<String, int> toJson() => {'I32': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.I32Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.I32Codec.codec.encodeTo(
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
      other is I32 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class U64 extends InkArg {
  const U64(this.value0);

  factory U64._decode(_i1.Input input) {
    return U64(_i1.U64Codec.codec.decode(input));
  }

  /// u64
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'U64': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
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
      other is U64 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class I64 extends InkArg {
  const I64(this.value0);

  factory I64._decode(_i1.Input input) {
    return I64(_i1.I64Codec.codec.decode(input));
  }

  /// i64
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'I64': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.I64Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      8,
      output,
    );
    _i1.I64Codec.codec.encodeTo(
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
      other is I64 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class U128 extends InkArg {
  const U128(this.value0);

  factory U128._decode(_i1.Input input) {
    return U128(_i1.U128Codec.codec.decode(input));
  }

  /// u128
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'U128': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U128Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      9,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
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
      other is U128 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class I128 extends InkArg {
  const I128(this.value0);

  factory I128._decode(_i1.Input input) {
    return I128(_i1.I128Codec.codec.decode(input));
  }

  /// i128
  final BigInt value0;

  @override
  Map<String, BigInt> toJson() => {'I128': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.I128Codec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      10,
      output,
    );
    _i1.I128Codec.codec.encodeTo(
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
      other is I128 && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class TString extends InkArg {
  const TString(this.value0);

  factory TString._decode(_i1.Input input) {
    return TString(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'TString': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      11,
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
      other is TString &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}
