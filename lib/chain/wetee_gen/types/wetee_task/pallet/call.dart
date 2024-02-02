// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../../wetee_primitives/types/app_setting_input.dart' as _i3;

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

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  Create create({
    required List<int> name,
    required List<int> image,
    required List<int> port,
    required int cpu,
    required int memory,
    required int disk,
    required int level,
    required BigInt deposit,
  }) {
    return Create(
      name: name,
      image: image,
      port: port,
      cpu: cpu,
      memory: memory,
      disk: disk,
      level: level,
      deposit: deposit,
    );
  }

  Rerun rerun({required BigInt id}) {
    return Rerun(id: id);
  }

  Update update({
    required BigInt appId,
    required List<int> name,
    required List<int> image,
    required List<int> port,
  }) {
    return Update(
      appId: appId,
      name: name,
      image: image,
      port: port,
    );
  }

  SetSettings setSettings({
    required BigInt appId,
    required List<_i3.AppSettingInput> value,
  }) {
    return SetSettings(
      appId: appId,
      value: value,
    );
  }

  Recharge recharge({
    required BigInt id,
    required BigInt deposit,
  }) {
    return Recharge(
      id: id,
      deposit: deposit,
    );
  }

  Stop stop({required BigInt appId}) {
    return Stop(appId: appId);
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
        return Rerun._decode(input);
      case 3:
        return Update._decode(input);
      case 4:
        return SetSettings._decode(input);
      case 5:
        return Recharge._decode(input);
      case 6:
        return Stop._decode(input);
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
      case Rerun:
        (value as Rerun).encodeTo(output);
        break;
      case Update:
        (value as Update).encodeTo(output);
        break;
      case SetSettings:
        (value as SetSettings).encodeTo(output);
        break;
      case Recharge:
        (value as Recharge).encodeTo(output);
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
      case Rerun:
        return (value as Rerun)._sizeHint();
      case Update:
        return (value as Update)._sizeHint();
      case SetSettings:
        return (value as SetSettings)._sizeHint();
      case Recharge:
        return (value as Recharge)._sizeHint();
      case Stop:
        return (value as Stop)._sizeHint();
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
    required this.cpu,
    required this.memory,
    required this.disk,
    required this.level,
    required this.deposit,
  });

  factory Create._decode(_i1.Input input) {
    return Create(
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
      cpu: _i1.U16Codec.codec.decode(input),
      memory: _i1.U16Codec.codec.decode(input),
      disk: _i1.U16Codec.codec.decode(input),
      level: _i1.U8Codec.codec.decode(input),
      deposit: _i1.CompactBigIntCodec.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u32>
  final List<int> port;

  /// u16
  final int cpu;

  /// u16
  final int memory;

  /// u16
  final int disk;

  /// u8
  final int level;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create': {
          'name': name,
          'image': image,
          'port': port,
          'cpu': cpu,
          'memory': memory,
          'disk': disk,
          'level': level,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(image);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(port);
    size = size + _i1.U16Codec.codec.sizeHint(cpu);
    size = size + _i1.U16Codec.codec.sizeHint(memory);
    size = size + _i1.U16Codec.codec.sizeHint(disk);
    size = size + _i1.U8Codec.codec.sizeHint(level);
    size = size + _i1.CompactBigIntCodec.codec.sizeHint(deposit);
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
    _i1.U16Codec.codec.encodeTo(
      cpu,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      memory,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      disk,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      level,
      output,
    );
    _i1.CompactBigIntCodec.codec.encodeTo(
      deposit,
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
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.image,
            image,
          ) &&
          _i4.listsEqual(
            other.port,
            port,
          ) &&
          other.cpu == cpu &&
          other.memory == memory &&
          other.disk == disk &&
          other.level == level &&
          other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        name,
        image,
        port,
        cpu,
        memory,
        disk,
        level,
        deposit,
      );
}

/// See [`Pallet::rerun`].
class Rerun extends Call {
  const Rerun({required this.id});

  factory Rerun._decode(_i1.Input input) {
    return Rerun(id: _i1.U64Codec.codec.decode(input));
  }

  /// TeeAppId
  final BigInt id;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'rerun': {'id': id}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Rerun && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// See [`Pallet::update`].
class Update extends Call {
  const Update({
    required this.appId,
    required this.name,
    required this.image,
    required this.port,
  });

  factory Update._decode(_i1.Input input) {
    return Update(
      appId: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
    );
  }

  /// TeeAppId
  final BigInt appId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u32>
  final List<int> port;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update': {
          'appId': appId,
          'name': name,
          'image': image,
          'port': port,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(image);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(port);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
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
      other is Update &&
          other.appId == appId &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.image,
            image,
          ) &&
          _i4.listsEqual(
            other.port,
            port,
          );

  @override
  int get hashCode => Object.hash(
        appId,
        name,
        image,
        port,
      );
}

/// See [`Pallet::set_settings`].
class SetSettings extends Call {
  const SetSettings({
    required this.appId,
    required this.value,
  });

  factory SetSettings._decode(_i1.Input input) {
    return SetSettings(
      appId: _i1.U64Codec.codec.decode(input),
      value: const _i1.SequenceCodec<_i3.AppSettingInput>(
              _i3.AppSettingInput.codec)
          .decode(input),
    );
  }

  /// TeeAppId
  final BigInt appId;

  /// Vec<AppSettingInput>
  final List<_i3.AppSettingInput> value;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_settings': {
          'appId': appId,
          'value': value.map((value) => value.toJson()).toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    size = size +
        const _i1.SequenceCodec<_i3.AppSettingInput>(_i3.AppSettingInput.codec)
            .sizeHint(value);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
    const _i1.SequenceCodec<_i3.AppSettingInput>(_i3.AppSettingInput.codec)
        .encodeTo(
      value,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetSettings &&
          other.appId == appId &&
          _i4.listsEqual(
            other.value,
            value,
          );

  @override
  int get hashCode => Object.hash(
        appId,
        value,
      );
}

/// See [`Pallet::recharge`].
class Recharge extends Call {
  const Recharge({
    required this.id,
    required this.deposit,
  });

  factory Recharge._decode(_i1.Input input) {
    return Recharge(
      id: _i1.U64Codec.codec.decode(input),
      deposit: _i1.U128Codec.codec.decode(input),
    );
  }

  /// TeeAppId
  final BigInt id;

  /// BalanceOf<T>
  final BigInt deposit;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'recharge': {
          'id': id,
          'deposit': deposit,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(id);
    size = size + _i1.U128Codec.codec.sizeHint(deposit);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      id,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      deposit,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Recharge && other.id == id && other.deposit == deposit;

  @override
  int get hashCode => Object.hash(
        id,
        deposit,
      );
}

/// See [`Pallet::stop`].
class Stop extends Call {
  const Stop({required this.appId});

  factory Stop._decode(_i1.Input input) {
    return Stop(appId: _i1.U64Codec.codec.decode(input));
  }

  /// TeeAppId
  final BigInt appId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'stop': {'appId': appId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      6,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Stop && other.appId == appId;

  @override
  int get hashCode => appId.hashCode;
}
