// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'edit_type.dart' as _i2;

class AppSettingInput {
  const AppSettingInput({
    required this.etype,
    required this.k,
    required this.v,
  });

  factory AppSettingInput.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// EditType
  final _i2.EditType etype;

  /// Vec<u8>
  final List<int> k;

  /// Vec<u8>
  final List<int> v;

  static const $AppSettingInputCodec codec = $AppSettingInputCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'etype': etype.toJson(),
        'k': k,
        'v': v,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is AppSettingInput &&
          other.etype == etype &&
          _i4.listsEqual(
            other.k,
            k,
          ) &&
          _i4.listsEqual(
            other.v,
            v,
          );

  @override
  int get hashCode => Object.hash(
        etype,
        k,
        v,
      );
}

class $AppSettingInputCodec with _i1.Codec<AppSettingInput> {
  const $AppSettingInputCodec();

  @override
  void encodeTo(
    AppSettingInput obj,
    _i1.Output output,
  ) {
    _i2.EditType.codec.encodeTo(
      obj.etype,
      output,
    );
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
  AppSettingInput decode(_i1.Input input) {
    return AppSettingInput(
      etype: _i2.EditType.codec.decode(input),
      k: _i1.U8SequenceCodec.codec.decode(input),
      v: _i1.U8SequenceCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(AppSettingInput obj) {
    int size = 0;
    size = size + _i2.EditType.codec.sizeHint(obj.etype);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.k);
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.v);
    return size;
  }
}
