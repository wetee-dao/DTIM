// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class ModuleError {
  const ModuleError({
    required this.index,
    required this.error,
  });

  factory ModuleError.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u8
  final int index;

  /// [u8; MAX_MODULE_ERROR_ENCODED_SIZE]
  final List<int> error;

  static const $ModuleErrorCodec codec = $ModuleErrorCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'index': index,
        'error': error.toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ModuleError &&
          other.index == index &&
          _i3.listsEqual(
            other.error,
            error,
          );

  @override
  int get hashCode => Object.hash(
        index,
        error,
      );
}

class $ModuleErrorCodec with _i1.Codec<ModuleError> {
  const $ModuleErrorCodec();

  @override
  void encodeTo(
    ModuleError obj,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      obj.index,
      output,
    );
    const _i1.U8ArrayCodec(4).encodeTo(
      obj.error,
      output,
    );
  }

  @override
  ModuleError decode(_i1.Input input) {
    return ModuleError(
      index: _i1.U8Codec.codec.decode(input),
      error: const _i1.U8ArrayCodec(4).decode(input),
    );
  }

  @override
  int sizeHint(ModuleError obj) {
    int size = 0;
    size = size + _i1.U8Codec.codec.sizeHint(obj.index);
    size = size + const _i1.U8ArrayCodec(4).sizeHint(obj.error);
    return size;
  }
}
