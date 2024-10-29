// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i10;

import '../../wetee_primitives/types/command.dart' as _i4;
import '../../wetee_primitives/types/container.dart' as _i7;
import '../../wetee_primitives/types/disk.dart' as _i6;
import '../../wetee_primitives/types/env_input.dart' as _i5;
import '../../wetee_primitives/types/service.dart' as _i3;
import '../../wetee_primitives/types/t_e_e_version.dart' as _i8;
import '../price.dart' as _i9;

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
    required List<int> signer,
    required List<int> signature,
    required List<int> meta,
    required List<_i3.Service> port,
    required _i4.Command command,
    required List<_i5.EnvInput> env,
    List<int>? secretEnv,
    required int cpu,
    required int memory,
    required List<_i6.Disk> disk,
    required int gpu,
    required List<_i7.Container> sideContainer,
    required int level,
    required _i8.TEEVersion teeVersion,
  }) {
    return Create(
      name: name,
      image: image,
      signer: signer,
      signature: signature,
      meta: meta,
      port: port,
      command: command,
      env: env,
      secretEnv: secretEnv,
      cpu: cpu,
      memory: memory,
      disk: disk,
      gpu: gpu,
      sideContainer: sideContainer,
      level: level,
      teeVersion: teeVersion,
    );
  }

  Update update({
    required BigInt appId,
    List<int>? newName,
    List<int>? newImage,
    List<int>? newSigner,
    List<int>? newSignature,
    List<_i3.Service>? newPort,
    _i4.Command? newCommand,
    required List<_i5.EnvInput> newEnv,
    List<int>? secretEnv,
    required bool withRestart,
  }) {
    return Update(
      appId: appId,
      newName: newName,
      newImage: newImage,
      newSigner: newSigner,
      newSignature: newSignature,
      newPort: newPort,
      newCommand: newCommand,
      newEnv: newEnv,
      secretEnv: secretEnv,
      withRestart: withRestart,
    );
  }

  Restart restart({required BigInt appId}) {
    return Restart(appId: appId);
  }

  UpdatePrice updatePrice({
    required int level,
    required _i9.Price price,
  }) {
    return UpdatePrice(
      level: level,
      price: price,
    );
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
        return Update._decode(input);
      case 6:
        return Restart._decode(input);
      case 7:
        return UpdatePrice._decode(input);
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
      case Restart:
        (value as Restart).encodeTo(output);
        break;
      case UpdatePrice:
        (value as UpdatePrice).encodeTo(output);
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
        return (value as Update)._sizeHint();
      case Restart:
        return (value as Restart)._sizeHint();
      case UpdatePrice:
        return (value as UpdatePrice)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// App create
/// 注册任务
class Create extends Call {
  const Create({
    required this.name,
    required this.image,
    required this.signer,
    required this.signature,
    required this.meta,
    required this.port,
    required this.command,
    required this.env,
    this.secretEnv,
    required this.cpu,
    required this.memory,
    required this.disk,
    required this.gpu,
    required this.sideContainer,
    required this.level,
    required this.teeVersion,
  });

  factory Create._decode(_i1.Input input) {
    return Create(
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      signer: _i1.U8SequenceCodec.codec.decode(input),
      signature: _i1.U8SequenceCodec.codec.decode(input),
      meta: _i1.U8SequenceCodec.codec.decode(input),
      port:
          const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec).decode(input),
      command: _i4.Command.codec.decode(input),
      env: const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec)
          .decode(input),
      secretEnv: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      cpu: _i1.U32Codec.codec.decode(input),
      memory: _i1.U32Codec.codec.decode(input),
      disk: const _i1.SequenceCodec<_i6.Disk>(_i6.Disk.codec).decode(input),
      gpu: _i1.U32Codec.codec.decode(input),
      sideContainer: const _i1.SequenceCodec<_i7.Container>(_i7.Container.codec)
          .decode(input),
      level: _i1.U8Codec.codec.decode(input),
      teeVersion: _i8.TEEVersion.codec.decode(input),
    );
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u8>
  final List<int> signer;

  /// Vec<u8>
  final List<int> signature;

  /// Vec<u8>
  final List<int> meta;

  /// Vec<Service>
  final List<_i3.Service> port;

  /// Command
  final _i4.Command command;

  /// Vec<EnvInput>
  final List<_i5.EnvInput> env;

  /// Option<EnvHash>
  final List<int>? secretEnv;

  /// u32
  final int cpu;

  /// u32
  final int memory;

  /// Vec<Disk>
  final List<_i6.Disk> disk;

  /// u32
  final int gpu;

  /// Vec<Container>
  final List<_i7.Container> sideContainer;

  /// u8
  final int level;

  /// TEEVersion
  final _i8.TEEVersion teeVersion;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'create': {
          'name': name,
          'image': image,
          'signer': signer,
          'signature': signature,
          'meta': meta,
          'port': port.map((value) => value.toJson()).toList(),
          'command': command.toJson(),
          'env': env.map((value) => value.toJson()).toList(),
          'secretEnv': secretEnv,
          'cpu': cpu,
          'memory': memory,
          'disk': disk.map((value) => value.toJson()).toList(),
          'gpu': gpu,
          'sideContainer':
              sideContainer.map((value) => value.toJson()).toList(),
          'level': level,
          'teeVersion': teeVersion.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(image);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signer);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(signature);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(meta);
    size = size +
        const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec).sizeHint(port);
    size = size + _i4.Command.codec.sizeHint(command);
    size = size +
        const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec).sizeHint(env);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(secretEnv);
    size = size + _i1.U32Codec.codec.sizeHint(cpu);
    size = size + _i1.U32Codec.codec.sizeHint(memory);
    size =
        size + const _i1.SequenceCodec<_i6.Disk>(_i6.Disk.codec).sizeHint(disk);
    size = size + _i1.U32Codec.codec.sizeHint(gpu);
    size = size +
        const _i1.SequenceCodec<_i7.Container>(_i7.Container.codec)
            .sizeHint(sideContainer);
    size = size + _i1.U8Codec.codec.sizeHint(level);
    size = size + _i8.TEEVersion.codec.sizeHint(teeVersion);
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
    _i1.U8SequenceCodec.codec.encodeTo(
      signer,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      signature,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      meta,
      output,
    );
    const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec).encodeTo(
      port,
      output,
    );
    _i4.Command.codec.encodeTo(
      command,
      output,
    );
    const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec).encodeTo(
      env,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      secretEnv,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      cpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      memory,
      output,
    );
    const _i1.SequenceCodec<_i6.Disk>(_i6.Disk.codec).encodeTo(
      disk,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      gpu,
      output,
    );
    const _i1.SequenceCodec<_i7.Container>(_i7.Container.codec).encodeTo(
      sideContainer,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      level,
      output,
    );
    _i8.TEEVersion.codec.encodeTo(
      teeVersion,
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
          _i10.listsEqual(
            other.name,
            name,
          ) &&
          _i10.listsEqual(
            other.image,
            image,
          ) &&
          _i10.listsEqual(
            other.signer,
            signer,
          ) &&
          _i10.listsEqual(
            other.signature,
            signature,
          ) &&
          _i10.listsEqual(
            other.meta,
            meta,
          ) &&
          _i10.listsEqual(
            other.port,
            port,
          ) &&
          other.command == command &&
          _i10.listsEqual(
            other.env,
            env,
          ) &&
          other.secretEnv == secretEnv &&
          other.cpu == cpu &&
          other.memory == memory &&
          _i10.listsEqual(
            other.disk,
            disk,
          ) &&
          other.gpu == gpu &&
          _i10.listsEqual(
            other.sideContainer,
            sideContainer,
          ) &&
          other.level == level &&
          other.teeVersion == teeVersion;

  @override
  int get hashCode => Object.hash(
        name,
        image,
        signer,
        signature,
        meta,
        port,
        command,
        env,
        secretEnv,
        cpu,
        memory,
        disk,
        gpu,
        sideContainer,
        level,
        teeVersion,
      );
}

/// App update
/// 更新任务
class Update extends Call {
  const Update({
    required this.appId,
    this.newName,
    this.newImage,
    this.newSigner,
    this.newSignature,
    this.newPort,
    this.newCommand,
    required this.newEnv,
    this.secretEnv,
    required this.withRestart,
  });

  factory Update._decode(_i1.Input input) {
    return Update(
      appId: _i1.U64Codec.codec.decode(input),
      newName: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      newImage: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      newSigner: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      newSignature: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      newPort: const _i1.OptionCodec<List<_i3.Service>>(
              _i1.SequenceCodec<_i3.Service>(_i3.Service.codec))
          .decode(input),
      newCommand:
          const _i1.OptionCodec<_i4.Command>(_i4.Command.codec).decode(input),
      newEnv: const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec)
          .decode(input),
      secretEnv: const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
          .decode(input),
      withRestart: _i1.BoolCodec.codec.decode(input),
    );
  }

  /// TeeAppId
  final BigInt appId;

  /// Option<Vec<u8>>
  final List<int>? newName;

  /// Option<Vec<u8>>
  final List<int>? newImage;

  /// Option<Vec<u8>>
  final List<int>? newSigner;

  /// Option<Vec<u8>>
  final List<int>? newSignature;

  /// Option<Vec<Service>>
  final List<_i3.Service>? newPort;

  /// Option<Command>
  final _i4.Command? newCommand;

  /// Vec<EnvInput>
  final List<_i5.EnvInput> newEnv;

  /// Option<EnvHash>
  final List<int>? secretEnv;

  /// bool
  final bool withRestart;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update': {
          'appId': appId,
          'newName': newName,
          'newImage': newImage,
          'newSigner': newSigner,
          'newSignature': newSignature,
          'newPort': newPort?.map((value) => value.toJson()).toList(),
          'newCommand': newCommand?.toJson(),
          'newEnv': newEnv.map((value) => value.toJson()).toList(),
          'secretEnv': secretEnv,
          'withRestart': withRestart,
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(appId);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(newName);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(newImage);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(newSigner);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(newSignature);
    size = size +
        const _i1.OptionCodec<List<_i3.Service>>(
                _i1.SequenceCodec<_i3.Service>(_i3.Service.codec))
            .sizeHint(newPort);
    size = size +
        const _i1.OptionCodec<_i4.Command>(_i4.Command.codec)
            .sizeHint(newCommand);
    size = size +
        const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec)
            .sizeHint(newEnv);
    size = size +
        const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec)
            .sizeHint(secretEnv);
    size = size + _i1.BoolCodec.codec.sizeHint(withRestart);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      appId,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      newName,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      newImage,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      newSigner,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      newSignature,
      output,
    );
    const _i1.OptionCodec<List<_i3.Service>>(
            _i1.SequenceCodec<_i3.Service>(_i3.Service.codec))
        .encodeTo(
      newPort,
      output,
    );
    const _i1.OptionCodec<_i4.Command>(_i4.Command.codec).encodeTo(
      newCommand,
      output,
    );
    const _i1.SequenceCodec<_i5.EnvInput>(_i5.EnvInput.codec).encodeTo(
      newEnv,
      output,
    );
    const _i1.OptionCodec<List<int>>(_i1.U8SequenceCodec.codec).encodeTo(
      secretEnv,
      output,
    );
    _i1.BoolCodec.codec.encodeTo(
      withRestart,
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
          other.newName == newName &&
          other.newImage == newImage &&
          other.newSigner == newSigner &&
          other.newSignature == newSignature &&
          other.newPort == newPort &&
          other.newCommand == newCommand &&
          _i10.listsEqual(
            other.newEnv,
            newEnv,
          ) &&
          other.secretEnv == secretEnv &&
          other.withRestart == withRestart;

  @override
  int get hashCode => Object.hash(
        appId,
        newName,
        newImage,
        newSigner,
        newSignature,
        newPort,
        newCommand,
        newEnv,
        secretEnv,
        withRestart,
      );
}

/// App restart
/// 更新任务
class Restart extends Call {
  const Restart({required this.appId});

  factory Restart._decode(_i1.Input input) {
    return Restart(appId: _i1.U64Codec.codec.decode(input));
  }

  /// TeeAppId
  final BigInt appId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'restart': {'appId': appId}
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
      other is Restart && other.appId == appId;

  @override
  int get hashCode => appId.hashCode;
}

/// update price
/// 更新价格
class UpdatePrice extends Call {
  const UpdatePrice({
    required this.level,
    required this.price,
  });

  factory UpdatePrice._decode(_i1.Input input) {
    return UpdatePrice(
      level: _i1.U8Codec.codec.decode(input),
      price: _i9.Price.codec.decode(input),
    );
  }

  /// u8
  final int level;

  /// Price
  final _i9.Price price;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'update_price': {
          'level': level,
          'price': price.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U8Codec.codec.sizeHint(level);
    size = size + _i9.Price.codec.sizeHint(price);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      7,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      level,
      output,
    );
    _i9.Price.codec.encodeTo(
      price,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is UpdatePrice && other.level == level && other.price == price;

  @override
  int get hashCode => Object.hash(
        level,
        price,
      );
}
