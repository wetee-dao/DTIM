// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'disk_class.dart' as _i2;

class Disk {
  const Disk({
    required this.path,
    required this.size,
  });

  factory Disk.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// DiskClass
  final _i2.DiskClass path;

  /// u32
  final int size;

  static const $DiskCodec codec = $DiskCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'path': path.toJson(),
        'size': size,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Disk && other.path == path && other.size == size;

  @override
  int get hashCode => Object.hash(
        path,
        size,
      );
}

class $DiskCodec with _i1.Codec<Disk> {
  const $DiskCodec();

  @override
  void encodeTo(
    Disk obj,
    _i1.Output output,
  ) {
    _i2.DiskClass.codec.encodeTo(
      obj.path,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.size,
      output,
    );
  }

  @override
  Disk decode(_i1.Input input) {
    return Disk(
      path: _i2.DiskClass.codec.decode(input),
      size: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Disk obj) {
    int size = 0;
    size = size + _i2.DiskClass.codec.sizeHint(obj.path);
    size = size + _i1.U32Codec.codec.sizeHint(obj.size);
    return size;
  }
}
