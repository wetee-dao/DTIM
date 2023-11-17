// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import '../sp_core/crypto/account_id32.dart' as _i2;

class TeeApp {
  const TeeApp({
    required this.id,
    required this.creator,
    required this.startBlock,
    required this.name,
    required this.image,
    required this.port,
    required this.status,
  });

  factory TeeApp.decode(_i1.Input input) {
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

  static const $TeeAppCodec codec = $TeeAppCodec();

  _i3.Uint8List encode() {
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
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is TeeApp &&
          other.id == id &&
          _i4.listsEqual(
            other.creator,
            creator,
          ) &&
          other.startBlock == startBlock &&
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
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        creator,
        startBlock,
        name,
        image,
        port,
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
  }

  @override
  TeeApp decode(_i1.Input input) {
    return TeeApp(
      id: _i1.U64Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      image: _i1.U8SequenceCodec.codec.decode(input),
      port: _i1.U32SequenceCodec.codec.decode(input),
      status: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(TeeApp obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.image);
    size = size + _i1.U32SequenceCodec.codec.sizeHint(obj.port);
    size = size + _i1.U8Codec.codec.sizeHint(obj.status);
    return size;
  }
}
