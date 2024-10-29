// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

abstract class Command {
  const Command();

  factory Command.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CommandCodec codec = $CommandCodec();

  static const $Command values = $Command();

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

class $Command {
  const $Command();

  Sh sh(List<int> value0) {
    return Sh(value0);
  }

  Bash bash(List<int> value0) {
    return Bash(value0);
  }

  Zsh zsh(List<int> value0) {
    return Zsh(value0);
  }

  None none() {
    return None();
  }
}

class $CommandCodec with _i1.Codec<Command> {
  const $CommandCodec();

  @override
  Command decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Sh._decode(input);
      case 1:
        return Bash._decode(input);
      case 2:
        return Zsh._decode(input);
      case 3:
        return const None();
      default:
        throw Exception('Command: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Command value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Sh:
        (value as Sh).encodeTo(output);
        break;
      case Bash:
        (value as Bash).encodeTo(output);
        break;
      case Zsh:
        (value as Zsh).encodeTo(output);
        break;
      case None:
        (value as None).encodeTo(output);
        break;
      default:
        throw Exception(
            'Command: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Command value) {
    switch (value.runtimeType) {
      case Sh:
        return (value as Sh)._sizeHint();
      case Bash:
        return (value as Bash)._sizeHint();
      case Zsh:
        return (value as Zsh)._sizeHint();
      case None:
        return 1;
      default:
        throw Exception(
            'Command: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

class Sh extends Command {
  const Sh(this.value0);

  factory Sh._decode(_i1.Input input) {
    return Sh(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'SH': value0};

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
      other is Sh &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Bash extends Command {
  const Bash(this.value0);

  factory Bash._decode(_i1.Input input) {
    return Bash(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'BASH': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
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
      other is Bash &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class Zsh extends Command {
  const Zsh(this.value0);

  factory Zsh._decode(_i1.Input input) {
    return Zsh(_i1.U8SequenceCodec.codec.decode(input));
  }

  /// Vec<u8>
  final List<int> value0;

  @override
  Map<String, List<int>> toJson() => {'ZSH': value0};

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(value0);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
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
      other is Zsh &&
          _i3.listsEqual(
            other.value0,
            value0,
          );

  @override
  int get hashCode => value0.hashCode;
}

class None extends Command {
  const None();

  @override
  Map<String, dynamic> toJson() => {'NONE': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is None;

  @override
  int get hashCode => runtimeType.hashCode;
}
