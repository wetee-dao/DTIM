// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'status.dart' as _i2;

class OrgApp {
  const OrgApp({
    required this.id,
    required this.appId,
    required this.startBlock,
    required this.name,
    required this.desc,
    required this.icon,
    required this.url,
    required this.status,
  });

  factory OrgApp.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// DaoAssetId
  final BigInt id;

  /// DaoAssetId
  final BigInt appId;

  /// BlockNumber
  final BigInt startBlock;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> icon;

  /// Vec<u8>
  final List<int> url;

  /// Status
  final _i2.Status status;

  static const $OrgAppCodec codec = $OrgAppCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'appId': appId,
        'startBlock': startBlock,
        'name': name,
        'desc': desc,
        'icon': icon,
        'url': url,
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is OrgApp &&
          other.id == id &&
          other.appId == appId &&
          other.startBlock == startBlock &&
          _i4.listsEqual(
            other.name,
            name,
          ) &&
          _i4.listsEqual(
            other.desc,
            desc,
          ) &&
          _i4.listsEqual(
            other.icon,
            icon,
          ) &&
          _i4.listsEqual(
            other.url,
            url,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        appId,
        startBlock,
        name,
        desc,
        icon,
        url,
        status,
      );
}

class $OrgAppCodec with _i1.Codec<OrgApp> {
  const $OrgAppCodec();

  @override
  void encodeTo(
    OrgApp obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      obj.appId,
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
      obj.desc,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.icon,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.url,
      output,
    );
    _i2.Status.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  OrgApp decode(_i1.Input input) {
    return OrgApp(
      id: _i1.U64Codec.codec.decode(input),
      appId: _i1.U64Codec.codec.decode(input),
      startBlock: _i1.U64Codec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      icon: _i1.U8SequenceCodec.codec.decode(input),
      url: _i1.U8SequenceCodec.codec.decode(input),
      status: _i2.Status.codec.decode(input),
    );
  }

  @override
  int sizeHint(OrgApp obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + _i1.U64Codec.codec.sizeHint(obj.appId);
    size = size + _i1.U64Codec.codec.sizeHint(obj.startBlock);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.icon);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.url);
    size = size + _i2.Status.codec.sizeHint(obj.status);
    return size;
  }
}
