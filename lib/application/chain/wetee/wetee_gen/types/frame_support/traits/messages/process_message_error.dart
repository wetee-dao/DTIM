// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../../../sp_weights/weight_v2/weight.dart' as _i3;

abstract class ProcessMessageError {
  const ProcessMessageError();

  factory ProcessMessageError.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $ProcessMessageErrorCodec codec = $ProcessMessageErrorCodec();

  static const $ProcessMessageError values = $ProcessMessageError();

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

class $ProcessMessageError {
  const $ProcessMessageError();

  BadFormat badFormat() {
    return BadFormat();
  }

  Corrupt corrupt() {
    return Corrupt();
  }

  Unsupported unsupported() {
    return Unsupported();
  }

  Overweight overweight(_i3.Weight value0) {
    return Overweight(value0);
  }

  Yield yield() {
    return Yield();
  }

  StackLimitReached stackLimitReached() {
    return StackLimitReached();
  }
}

class $ProcessMessageErrorCodec with _i1.Codec<ProcessMessageError> {
  const $ProcessMessageErrorCodec();

  @override
  ProcessMessageError decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return const BadFormat();
      case 1:
        return const Corrupt();
      case 2:
        return const Unsupported();
      case 3:
        return Overweight._decode(input);
      case 4:
        return const Yield();
      case 5:
        return const StackLimitReached();
      default:
        throw Exception('ProcessMessageError: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    ProcessMessageError value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case BadFormat:
        (value as BadFormat).encodeTo(output);
        break;
      case Corrupt:
        (value as Corrupt).encodeTo(output);
        break;
      case Unsupported:
        (value as Unsupported).encodeTo(output);
        break;
      case Overweight:
        (value as Overweight).encodeTo(output);
        break;
      case Yield:
        (value as Yield).encodeTo(output);
        break;
      case StackLimitReached:
        (value as StackLimitReached).encodeTo(output);
        break;
      default:
        throw Exception(
            'ProcessMessageError: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(ProcessMessageError value) {
    switch (value.runtimeType) {
      case BadFormat:
        return 1;
      case Corrupt:
        return 1;
      case Unsupported:
        return 1;
      case Overweight:
        return (value as Overweight)._sizeHint();
      case Yield:
        return 1;
      case StackLimitReached:
        return 1;
      default:
        throw Exception(
            'ProcessMessageError: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class BadFormat extends ProcessMessageError {
  const BadFormat();

  @override
  Map<String, dynamic> toJson() => {'BadFormat': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is BadFormat;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Corrupt extends ProcessMessageError {
  const Corrupt();

  @override
  Map<String, dynamic> toJson() => {'Corrupt': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Corrupt;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Unsupported extends ProcessMessageError {
  const Unsupported();

  @override
  Map<String, dynamic> toJson() => {'Unsupported': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Unsupported;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Overweight extends ProcessMessageError {
  const Overweight(this.value0);

  factory Overweight._decode(_i1.Input input) {
    return Overweight(_i3.Weight.codec.decode(input));
  }

  /// Weight
  final _i3.Weight value0;

  @override
  Map<String, Map<String, BigInt>> toJson() => {'Overweight': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Weight.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i3.Weight.codec.encodeTo(
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
      other is Overweight && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Yield extends ProcessMessageError {
  const Yield();

  @override
  Map<String, dynamic> toJson() => {'Yield': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Yield;

  @override
  int get hashCode => runtimeType.hashCode;
}

class StackLimitReached extends ProcessMessageError {
  const StackLimitReached();

  @override
  Map<String, dynamic> toJson() => {'StackLimitReached': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is StackLimitReached;

  @override
  int get hashCode => runtimeType.hashCode;
}
