// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i8;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i9;

import '../sp_core/crypto/account_id32.dart' as _i2;
import '../wetee_primitives/types/command.dart' as _i3;
import '../wetee_primitives/types/container.dart' as _i6;
import '../wetee_primitives/types/cr.dart' as _i5;
import '../wetee_primitives/types/service.dart' as _i4;
import '../wetee_primitives/types/t_e_e_version.dart' as _i7;

class TeeApp {
  const TeeApp({
    required this.id,
    required this.creator,
    required this.contractId,
    required this.startBlock,
    required this.name,
    required this.image,
    required this.meta,
    required this.command,
    required this.port,
    required this.cr,
    required this.sideContainer,
    required this.level,
    required this.teeVersion,
    required this.status,
  });

  factory TeeApp.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// TeeAppId
  final BigInt id;

  /// AccountId
  final _i2.AccountId32 creator;

  /// AccountId
  final _i2.AccountId32 contractId;

  /// BlockNumber
  final BigInt startBlock;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u8>
  final List<int> meta;

  /// Command
  final _i3.Command command;

  /// Vec<Service>
  final List<_i4.Service> port;

  /// Cr
  final _i5.Cr cr;

  /// Vec<Container>
  final List<_i6.Container> sideContainer;

  /// ClusterLevel
  final int level;

  /// TEEVersion
  final _i7.TEEVersion teeVersion;

  /// WorkStatus
  final int status;

  static const $TeeAppCodec codec = $TeeAppCodec();

  _i8.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator.toList(),
        'contractId': contractId.toList(),
        'startBlock': startBlock,
        'name': name,
        'image': image,
        'meta': meta,
        'command': command.toJson(),
        'port': port.map((value) => value.toJson()).toList(),
        'cr': cr.toJson(),
        'sideContainer': sideContainer.map((value) => value.toJson()).toList(),
        'level': level,
        'teeVersion': teeVersion.toJson(),
        'status': status,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TeeApp &&
          other.id == id &&
          _i9.listsEqual(
            other.creator,
            creator,
          ) &&
          _i9.listsEqual(
            other.contractId,
            contractId,
          ) &&
          other.startBlock == startBlock &&
          _i9.listsEqual(
            other.name,
            name,
          ) &&
          _i9.listsEqual(
            other.image,
            image,
          ) &&
          _i9.listsEqual(
            other.meta,
            meta,
          ) &&
          other.command == command &&
          _i9.listsEqual(
            other.port,
            port,
          ) &&
          other.cr == cr &&
          _i9.listsEqual(
            other.sideContainer,
            sideContainer,
          ) &&
          other.level == level &&
          other.teeVersion == teeVersion &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        creator,
        contractId,
        startBlock,
        name,
        image,
        meta,
        command,
        port,
        cr,
        sideContainer,
        level,
        teeVersion,
        status,
      );
}

class $TeeAppCodec with _i1.Codec<TeeApp> {
  const $TeeAppCodec();

  @override
  void encodeTo(
    TeeApp obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.contractId,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.startBlock,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.image,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.meta,
      output,
    );
    _i3.Command.codec.encodeTo(
      obj.command,
      output,
    );
    const _i1.SequenceCodec<_i4.Service>(_i4.Service.codec).encodeTo(
      obj.port,
      output,
    );
    _i5.Cr.codec.encodeTo(
      obj.cr,
      output,
    );
    const _i1.SequenceCodec<_i6.Container>(_i6.Container.codec).encodeTo(
      obj.sideContainer,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.level,
      output,
    );
    _i7.TEEVersion.codec.encodeTo(
      obj.teeVersion,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  TeeApp decode(_i1.Input input) {
    return TeeApp(
      id: _i1.U64Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      contractId: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      meta: _i1.U8SequenceCodec.codec.decode(input),
      command: _i3.Command.codec.decode(input),
      port:
          const _i1.SequenceCodec<_i4.Service>(_i4.Service.codec).decode(input),
      cr: _i5.Cr.codec.decode(input),
      sideContainer: const _i1.SequenceCodec<_i6.Container>(_i6.Container.codec)
          .decode(input),
      level: _i1.U8Codec.codec.decode(input),
      teeVersion: _i7.TEEVersion.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(TeeApp obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.contractId);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.image);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.meta);
    size = size + _i3.Command.codec.sizeHint(obj.command);
    size = size +
        const _i1.SequenceCodec<_i4.Service>(_i4.Service.codec)
            .sizeHint(obj.port);
    size = size + _i5.Cr.codec.sizeHint(obj.cr);
    size = size +
        const _i1.SequenceCodec<_i6.Container>(_i6.Container.codec)
            .sizeHint(obj.sideContainer);
    size = size + _i1.U8Codec.codec.sizeHint(obj.level);
    size = size + _i7.TEEVersion.codec.sizeHint(obj.teeVersion);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    return size;
  }
}
