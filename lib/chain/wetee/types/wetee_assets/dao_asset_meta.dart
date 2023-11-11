// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class DaoAssetMeta {
  const DaoAssetMeta({
    required this.name,
    required this.symbol,
    required this.decimals,
  });

  factory DaoAssetMeta.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> name;

  /// Vec<u8>
  final List<int> symbol;

  /// u8
  final int decimals;

  static const $DaoAssetMetaCodec codec = $DaoAssetMetaCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'symbol': symbol,
        'decimals': decimals,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is DaoAssetMeta &&
          _i3.listsEqual(
            other.name,
            name,
          ) &&
          _i3.listsEqual(
            other.symbol,
            symbol,
          ) &&
          other.decimals == decimals;

  @override
  int get hashCode => Object.hash(
        name,
        symbol,
        decimals,
      );
}

class $DaoAssetMetaCodec with _i1.Codec<DaoAssetMeta> {
  const $DaoAssetMetaCodec();

  @override
  void encodeTo(
    DaoAssetMeta obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.name,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.symbol,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.decimals,
      output,
    );
  }

  @override
  DaoAssetMeta decode(_i1.Input input) {
    return DaoAssetMeta(
      name: _i1.U8SequenceCodec.codec.decode(input),
      symbol: _i1.U8SequenceCodec.codec.decode(input),
      decimals: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(DaoAssetMeta obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.name);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.symbol);
    size = size + _i1.U8Codec.codec.sizeHint(obj.decimals);
    return size;
  }
}
