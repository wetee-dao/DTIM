// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

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

class $Call {
  const $Call();

  Create create({
    required List<int> name,
    required List<int> image,
    required List<int> port,
  }) {
    return Create(
      name: name,
      image: image,
      port: port,
    );
  }

  Update update() {
    return Update();
  }

  SetSettings setSettings() {
    return SetSettings();
  }

  Charge charge() {
    return Charge();
  }

  Stop stop() {
    return Stop();
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return Create._decode(input);
      case 2:
        return const Update();
      case 3:
        return const SetSettings();
      case 4:
        return const Charge();
      case 5:
        return const Stop();
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Create:
        (value as Create).encodeTo(output);
        break;
      case Update:
        (value as Update).encodeTo(output);
        break;
      case SetSettings:
        (value as SetSettings).encodeTo(output);
        break;
      case Charge:
        (value as Charge).encodeTo(output);
        break;
      case Stop:
        (value as Stop).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Create:
        return (value as Create)._sizeHint();
      case Update:
        return 1;
      case SetSettings:
        return 1;
      case Charge:
        return 1;
      case Stop:
        return 1;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::create`].
class Create extends Call {
  const Create({
    required this.name,
    required this.image,
    required this.port,
  });

  factory Create._decode(_i1.Input input) {
    return Create(
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u32>
  final List<int> port;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'create': {
          'name': name,
          'image': image,
          'port': port,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(image);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(port);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      image,
      output,
    );
    _i1.U32SequenceCodec.codec.encodeTo(
      port,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Create &&
          _i3.listsEqual(
            other.name,
            name,
          ) &&
          _i3.listsEqual(
            other.image,
            image,
          ) &&
          _i3.listsEqual(
            other.port,
            port,
          );

  @override
  int get hashCode => Object.hash(
        name,
        image,
        port,
      );
}

/// See [`Pallet::update`].
class Update extends Call {
  const Update();

  @override
  Map<String, dynamic> toJson() => {'update': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Update;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::set_settings`].
class SetSettings extends Call {
  const SetSettings();

  @override
  Map<String, dynamic> toJson() => {'set_settings': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is SetSettings;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::charge`].
class Charge extends Call {
  const Charge();

  @override
  Map<String, dynamic> toJson() => {'charge': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Charge;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// See [`Pallet::stop`].
class Stop extends Call {
  const Stop();

  @override
  Map<String, dynamic> toJson() => {'stop': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is Stop;

  @override
  int get hashCode => runtimeType.hashCode;
}
