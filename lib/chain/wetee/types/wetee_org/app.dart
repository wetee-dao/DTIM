// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'status.dart' as _i3;

class App {
  const App({
    required this.id,
    required this.url,
    required this.name,
    required this.desc,
    required this.icon,
    required this.creator,
    required this.status,
  });

  factory App.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// DaoAssetId
  final BigInt id;

  /// Vec<u8>
  final List<int> url;

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> desc;

  /// Vec<u8>
  final List<int> icon;

  /// AccountId
  final _i2.AccountId32 creator;

  /// Status
  final _i3.Status status;

  static const $AppCodec codec = $AppCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'desc': desc,
        'icon': icon,
        'creator': creator.toList(),
        'status': status.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is App &&
          other.id == id &&
          _i5.listsEqual(
            other.url,
            url,
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
            other.icon,
            icon,
          ) &&
          _i5.listsEqual(
            other.creator,
            creator,
          ) &&
          other.status == status;

  @override
  int get hashCode => Object.hash(
        id,
        url,
        name,
        desc,
        icon,
        creator,
        status,
      );
}

class $AppCodec with _i1.Codec<App> {
  const $AppCodec();

  @override
  void encodeTo(
    App obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.id,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.url,
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
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.creator,
      output,
    );
    _i3.Status.codec.encodeTo(
      obj.status,
      output,
    );
  }

  @override
  App decode(_i1.Input input) {
    return App(
      id: _i1.U64Codec.codec.decode(input),
      url: _i1.U8SequenceCodec.codec.decode(input),
      name: _i1.U8SequenceCodec.codec.decode(input),
      desc: _i1.U8SequenceCodec.codec.decode(input),
      icon: _i1.U8SequenceCodec.codec.decode(input),
      creator: const _i1.U8ArrayCodec(32).decode(input),
      status: _i3.Status.codec.decode(input),
    );
  }

  @override
  int sizeHint(App obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.id);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.url);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.desc);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.icon);
    size = size + const _i2.AccountId32Codec().sizeHint(obj.creator);
    size = size + _i3.Status.codec.sizeHint(obj.status);
    return size;
  }
}
