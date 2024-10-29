// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

import '../finality_grandpa/equivocation_1.dart' as _i3;
import '../finality_grandpa/equivocation_2.dart' as _i4;

abstract class Equivocation {
  const Equivocation();

  factory Equivocation.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EquivocationCodec codec = $EquivocationCodec();

  static const $Equivocation values = $Equivocation();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Equivocation {
  const $Equivocation();

  Prevote prevote(_i3.Equivocation value0) {
    return Prevote(value0);
  }

  Precommit precommit(_i4.Equivocation value0) {
    return Precommit(value0);
  }
}

class $EquivocationCodec with _i1.Codec<Equivocation> {
  const $EquivocationCodec();

  @override
  Equivocation decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Prevote._decode(input);
      case 1:
        return Precommit._decode(input);
      default:
        throw Exception('Equivocation: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Equivocation value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Prevote:
        (value as Prevote).encodeTo(output);
        break;
      case Precommit:
        (value as Precommit).encodeTo(output);
        break;
      default:
        throw Exception(
            'Equivocation: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Equivocation value) {
    switch (value.runtimeType) {
      case Prevote:
        return (value as Prevote)._sizeHint();
      case Precommit:
        return (value as Precommit)._sizeHint();
      default:
        throw Exception(
            'Equivocation: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Prevote extends Equivocation {
  const Prevote(this.value0);

  factory Prevote._decode(_i1.Input input) {
    return Prevote(_i3.Equivocation.codec.decode(input));
  }

  /// finality_grandpa::Equivocation<AuthorityId, finality_grandpa::Prevote<
  ///H, N>, AuthoritySignature,>
  final _i3.Equivocation value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Prevote': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i3.Equivocation.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.Equivocation.codec.encodeTo(
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
      other is Prevote && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}

class Precommit extends Equivocation {
  const Precommit(this.value0);

  factory Precommit._decode(_i1.Input input) {
    return Precommit(_i4.Equivocation.codec.decode(input));
  }

  /// finality_grandpa::Equivocation<AuthorityId, finality_grandpa::Precommit
  ///<H, N>, AuthoritySignature,>
  final _i4.Equivocation value0;

  @override
  Map<String, Map<String, dynamic>> toJson() => {'Precommit': value0.toJson()};

  int _sizeHint() {
    int size = 1;
    size = size + _i4.Equivocation.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.Equivocation.codec.encodeTo(
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
      other is Precommit && other.value0 == value0;

  @override
  int get hashCode => value0.hashCode;
}
