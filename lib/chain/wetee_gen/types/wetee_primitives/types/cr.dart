// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class Cr {
  const Cr({
    required this.cpu,
    required this.mem,
    required this.disk,
  });

  factory Cr.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u16
  final int cpu;

  /// u16
  final int mem;

  /// u16
  final int disk;

  static const $CrCodec codec = $CrCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'cpu': cpu,
        'mem': mem,
        'disk': disk,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Cr && other.cpu == cpu && other.mem == mem && other.disk == disk;

  @override
  int get hashCode => Object.hash(
        cpu,
        mem,
        disk,
      );
}

class $CrCodec with _i1.Codec<Cr> {
  const $CrCodec();

  @override
  void encodeTo(
    Cr obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.cpu,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.mem,
      output,
    );
    _i1.U16Codec.codec.encodeTo(
      obj.disk,
      output,
    );
  }

  @override
  Cr decode(_i1.Input input) {
    return Cr(
      cpu: _i1.U16Codec.codec.decode(input),
      mem: _i1.U16Codec.codec.decode(input),
      disk: _i1.U16Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Cr obj) {
    int size = 0;
    size = size + _i1.U16Codec.codec.sizeHint(obj.cpu);
    size = size + _i1.U16Codec.codec.sizeHint(obj.mem);
    size = size + _i1.U16Codec.codec.sizeHint(obj.disk);
    return size;
  }
}
