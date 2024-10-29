// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'disk.dart' as _i2;

class Cr {
  const Cr({
    required this.cpu,
    required this.mem,
    required this.disk,
    required this.gpu,
  });

  factory Cr.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u32
  final int cpu;

  /// u32
  final int mem;

  /// Vec<Disk>
  final List<_i2.Disk> disk;

  /// u32
  final int gpu;

  static const $CrCodec codec = $CrCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'cpu': cpu,
        'mem': mem,
        'disk': disk.map((value) => value.toJson()).toList(),
        'gpu': gpu,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Cr &&
          other.cpu == cpu &&
          other.mem == mem &&
          _i4.listsEqual(
            other.disk,
            disk,
          ) &&
          other.gpu == gpu;

  @override
  int get hashCode => Object.hash(
        cpu,
        mem,
        disk,
        gpu,
      );
}

class $CrCodec with _i1.Codec<Cr> {
  const $CrCodec();

  @override
  void encodeTo(
    Cr obj,
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
    const _i1.SequenceCodec<_i2.Disk>(_i2.Disk.codec).encodeTo(
      obj.disk,
      output,
    );
    _i1.U32Codec.codec.encodeTo(
      obj.gpu,
      output,
    );
  }

  @override
  Cr decode(_i1.Input input) {
    return Cr(
      cpu: _i1.U32Codec.codec.decode(input),
      mem: _i1.U32Codec.codec.decode(input),
      disk: const _i1.SequenceCodec<_i2.Disk>(_i2.Disk.codec).decode(input),
      gpu: _i1.U32Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Cr obj) {
    int size = 0;
    size = size + _i1.U32Codec.codec.sizeHint(obj.cpu);
    size = size + _i1.U32Codec.codec.sizeHint(obj.mem);
    size = size +
        const _i1.SequenceCodec<_i2.Disk>(_i2.Disk.codec).sizeHint(obj.disk);
    size = size + _i1.U32Codec.codec.sizeHint(obj.gpu);
    return size;
  }
}
