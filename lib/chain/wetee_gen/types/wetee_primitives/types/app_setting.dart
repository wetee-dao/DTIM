// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class AppSetting {
  const AppSetting({
    required this.k,
    required this.v,
  });

  factory AppSetting.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> k;

  /// Vec<u8>
  final List<int> v;

  static const $AppSettingCodec codec = $AppSettingCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, List<int>> toJson() => {
        'k': k,
        'v': v,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AppSetting &&
          _i3.listsEqual(
            other.k,
            k,
          ) &&
          _i3.listsEqual(
            other.v,
            v,
          );

  @override
  int get hashCode => Object.hash(
        k,
        v,
      );
}

class $AppSettingCodec with _i1.Codec<AppSetting> {
  const $AppSettingCodec();

  @override
  void encodeTo(
    AppSetting obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.k,
      output,
    );
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.v,
      output,
    );
  }

  @override
  AppSetting decode(_i1.Input input) {
    return AppSetting(
      k: _i1.U8SequenceCodec.codec.decode(input),
      v: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AppSetting obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.k);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.v);
    return size;
  }
}
