// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i4;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../sp_core/crypto/account_id32.dart' as _i2;
import 'dao_asset_meta.dart' as _i3;

class DaoAssetInfo {
  const DaoAssetInfo({
    required this.owner,
    required this.metadata,
  });

  factory DaoAssetInfo.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// AccountId
  final _i2.AccountId32 owner;

  /// DaoAssetMeta
  final _i3.DaoAssetMeta metadata;

  static const $DaoAssetInfoCodec codec = $DaoAssetInfoCodec();

  _i4.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'owner': owner.toList(),
        'metadata': metadata.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DaoAssetInfo &&
          _i5.listsEqual(
            other.owner,
            owner,
          ) &&
          other.metadata == metadata;

  @override
  int get hashCode => Object.hash(
        owner,
        metadata,
      );
}

class $DaoAssetInfoCodec with _i1.Codec<DaoAssetInfo> {
  const $DaoAssetInfoCodec();

  @override
  void encodeTo(
    DaoAssetInfo obj,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      obj.owner,
      output,
    );
    _i3.DaoAssetMeta.codec.encodeTo(
      obj.metadata,
      output,
    );
  }

  @override
  DaoAssetInfo decode(_i1.Input input) {
    return DaoAssetInfo(
      owner: const _i1.U8ArrayCodec(32).decode(input),
      metadata: _i3.DaoAssetMeta.codec.decode(input),
    );
  }

  @override
  int sizeHint(DaoAssetInfo obj) {
    int size = 0;
    size = size + const _i2.AccountId32Codec().sizeHint(obj.owner);
    size = size + _i3.DaoAssetMeta.codec.sizeHint(obj.metadata);
    return size;
  }
}
