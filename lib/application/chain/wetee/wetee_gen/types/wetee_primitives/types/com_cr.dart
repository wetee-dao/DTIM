// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class ComCr {
  const ComCr({
    required this.cpu,
    required this.mem,
    required this.cvmCpu,
    required this.cvmMem,
    required this.disk,
    required this.gpu,
  });

  factory ComCr.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int cpu;

  /// u32
  final int mem;

  /// u32
  final int cvmCpu;

  /// u32
  final int cvmMem;

  /// u32
  final int disk;

  /// u32
  final int gpu;

  static const $ComCrCodec codec = $ComCrCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, int> toJson() => {
        'cpu': cpu,
        'mem': mem,
        'cvmCpu': cvmCpu,
        'cvmMem': cvmMem,
        'disk': disk,
        'gpu': gpu,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ComCr &&
          other.cpu == cpu &&
          other.mem == mem &&
          other.cvmCpu == cvmCpu &&
          other.cvmMem == cvmMem &&
          other.disk == disk &&
          other.gpu == gpu;

  @override
  int get hashCode => Object.hash(
        cpu,
        mem,
        cvmCpu,
        cvmMem,
        disk,
        gpu,
      );
}

class $ComCrCodec with _i1.Codec<ComCr> {
  const $ComCrCodec();

  @override
  void encodeTo(
    ComCr obj,
    _i1.Output output,
  ) {
    _i1.U32Codec.codec.encodeTo(
      obj.cpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.mem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmCpu,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.cvmMem,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.disk,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.gpu,
      output,
    );
  }

  @override
  ComCr decode(_i1.Input input) {
    return ComCr(
      cpu: _i1.U32Codec.codec.decode(input),
      mem: _i1.U32Codec.codec.decode(input),
      cvmCpu: _i1.U32Codec.codec.decode(input),
      cvmMem: _i1.U32Codec.codec.decode(input),
      disk: _i1.U32Codec.codec.decode(input),
      gpu: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(ComCr obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.cpu);
    size = size + _i1.U32Codec.codec.sizeHint(obj.mem);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmCpu);
    size = size + _i1.U32Codec.codec.sizeHint(obj.cvmMem);
    size = size + _i1.U32Codec.codec.sizeHint(obj.disk);
    size = size + _i1.U32Codec.codec.sizeHint(obj.gpu);
    return size;
  }
}
