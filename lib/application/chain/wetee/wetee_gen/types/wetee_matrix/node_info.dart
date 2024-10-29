// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'status.dart' as _i3;

class NodeInfo {
  const NodeInfo({
    required this.id,
    required this.creator,
    required this.startBlock,
    required this.accountId,
    required this.name,
    required this.desc,
    required this.purpose,
    required this.metaData,
    required this.imApi,
    required this.bg,
    required this.logo,
    required this.img,
    required this.homeUrl,
    required this.status,
  });

  factory NodeInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u128
  final BigInt id;

  /// AccountId
  final _i2.AccountId32 creator;

  /// BlockNumber
  final BigInt startBlock;

  /// AccountId
  final _i2.AccountId32 accountId;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> purpose;

  /// Vec<u8>
  final List<int> metaData;

  /// Vec<u8>
  final List<int> imApi;

  /// Vec<u8>
  final List<int> bg;

  /// Vec<u8>
  final List<int> logo;

  /// Vec<u8>
  final List<int> img;

  /// Vec<u8>
  final List<int> homeUrl;

  /// Status
  final _i3.Status status;

  static const $NodeInfoCodec codec = $NodeInfoCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator.toList(),
        'startBlock': startBlock,
        'accountId': accountId.toList(),
        'name': name,
        'desc': desc,
        'purpose': purpose,
        'metaData': metaData,
        'imApi': imApi,
        'bg': bg,
        'logo': logo,
        'img': img,
        'homeUrl': homeUrl,
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NodeInfo &&
          other.id == id &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.startBlock == startBlock &&
          _i5.listsEqual(
            other.accountId,
            accountId,
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
            other.purpose,
            purpose,
          ) &&
          _i5.listsEqual(
            other.metaData,
            metaData,
          ) &&
          _i5.listsEqual(
            other.imApi,
            imApi,
          ) &&
          _i5.listsEqual(
            other.bg,
            bg,
          ) &&
          _i5.listsEqual(
            other.logo,
            logo,
          ) &&
          _i5.listsEqual(
            other.img,
            img,
          ) &&
          _i5.listsEqual(
            other.homeUrl,
            homeUrl,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        creator,
        startBlock,
        accountId,
        name,
        desc,
        purpose,
        metaData,
        imApi,
        bg,
        logo,
        img,
        homeUrl,
        status,
      );
}

class $NodeInfoCodec with _i1.Codec<NodeInfo> {
  const $NodeInfoCodec();

  @override
  void encodeTo(
    NodeInfo obj,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
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
      obj.accountId,
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
      obj.purpose,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.metaData,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.imApi,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.bg,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.logo,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.img,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.homeUrl,
      output,
    );
    _i3.Status.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  NodeInfo decode(_i1.Input input) {
    return NodeInfo(
      id: _i1.U128Codec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      accountId: const _i1.U8ArrayCodec(32).decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      purpose: _i1.U8SequenceCodec.codec.decode(input),
      metaData: _i1.U8SequenceCodec.codec.decode(input),
      imApi: _i1.U8SequenceCodec.codec.decode(input),
      bg: _i1.U8SequenceCodec.codec.decode(input),
      logo: _i1.U8SequenceCodec.codec.decode(input),
      img: _i1.U8SequenceCodec.codec.decode(input),
      homeUrl: _i1.U8SequenceCodec.codec.decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  @override
  int sizeHint(NodeInfo obj) {
    int size = 0;
    size = size + _i1.U128Codec.codec.sizeHint(obj.id);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.accountId);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.purpose);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.metaData);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.imApi);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.bg);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.logo);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.img);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.homeUrl);
    size = size + _i3.Status.codec.sizeHint(obj.status);
    return size;
  }
}
