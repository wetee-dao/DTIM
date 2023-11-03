// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'status.dart' as _i3;

class GuildInfo {
  const GuildInfo({
    required this.id,
    required this.creator,
    required this.startBlock,
    required this.daoAccountId,
    required this.name,
    required this.desc,
    required this.metaData,
    required this.status,
  });

  factory GuildInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// GuildId
  final BigInt id;

  /// AccountId
  final _i2.AccountId32 creator;

  /// BlockNumber
  final BigInt startBlock;

  /// AccountId
  final _i2.AccountId32 daoAccountId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> metaData;

  /// Status
  final _i3.Status status;

  static const $GuildInfoCodec codec = $GuildInfoCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator.toList(),
        'startBlock': startBlock,
        'daoAccountId': daoAccountId.toList(),
        'name': name,
        'desc': desc,
        'metaData': metaData,
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is GuildInfo &&
          other.id == id &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.startBlock == startBlock &&
          _i5.listsEqual(
            other.daoAccountId,
            daoAccountId,
          ) &&
          _i5.listsEqual(
            other.name,
            name,
          ) &&
          _i5.listsEqual(
            other.desc,
            desc,
          ) &&
          _i5.listsEqual(
            other.metaData,
            metaData,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        creator,
        startBlock,
        daoAccountId,
        name,
        desc,
        metaData,
        status,
      );
}

class $GuildInfoCodec with _i1.Codec<GuildInfo> {
  const $GuildInfoCodec();

  @override
  void encodeTo(
    GuildInfo obj,
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
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.daoAccountId,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.desc,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.metaData,
      output,
    );
    _i3.Status.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  GuildInfo decode(_i1.Input input) {
    return GuildInfo(
      id: _i1.U64Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      daoAccountId: const _i1.U8ArrayCodec(32).decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      metaData: _i1.U8SequenceCodec.codec.decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  @override
  int sizeHint(GuildInfo obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.daoAccountId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.metaData);
    size = size + _i3.Status.codec.sizeHint(obj.status);
    return size;
  }
}
