// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import '../wetee_primitives/types/cr.dart' as _i3;

class TeeTask {
  const TeeTask({
    required this.id,
    required this.creator,
    required this.startBlock,
    required this.name,
    required this.image,
    required this.port,
    required this.status,
    required this.cr,
    required this.deposit,
    required this.level,
  });

  factory TeeTask.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// TeeAppId
  final BigInt id;

  /// AccountId
  final _i2.AccountId32 creator;

  /// BlockNumber
  final BigInt startBlock;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> image;

  /// Vec<u32>
  final List<int> port;

  /// u8
  final int status;

  /// Cr
  final _i3.Cr cr;

  /// Balance
  final BigInt deposit;

  /// u8
  final int level;

  static const $TeeTaskCodec codec = $TeeTaskCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator.toList(),
        'startBlock': startBlock,
        'name': name,
        'image': image,
        'port': port,
        'status': status,
        'cr': cr.toJson(),
        'deposit': deposit,
        'level': level,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TeeTask &&
          other.id == id &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.startBlock == startBlock &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.image,
            image,
          ) &&
          _i5.listsEqual(
            other.port,
            port,
          ) &&
          other.status == status &&
          other.cr == cr &&
          other.deposit == deposit &&
          other.level == level;

  @override
  int get hashCode => Object.hash(
        id,
        creator,
        startBlock,
        name,
        image,
        port,
        status,
        cr,
        deposit,
        level,
      );
}

class $TeeTaskCodec with _i1.Codec<TeeTask> {
  const $TeeTaskCodec();

  @override
  void encodeTo(
    TeeTask obj,
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
    _i1.U32SequenceCodec.codec.encodeTo(
      obj.port,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.status,
      output,
    );
    _i3.Cr.codec.encodeTo(
      obj.cr,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.deposit,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.level,
      output,
    );
  }

  @override
  TeeTask decode(_i1.Input input) {
    return TeeTask(
      id: _i1.U64Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
      cr: _i3.Cr.codec.decode(input),
      deposit: _i1.U128Codec.codec.decode(input),
      level: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(TeeTask obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.image);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(obj.port);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    size = size + _i3.Cr.codec.sizeHint(obj.cr);
    size = size + _i1.U128Codec.codec.sizeHint(obj.deposit);
    size = size + _i1.U8Codec.codec.sizeHint(obj.level);
    return size;
  }
}
