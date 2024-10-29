// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i5;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i6;

import 'command.dart' as _i2;
import 'cr.dart' as _i4;
import 'service.dart' as _i3;

class Container {
  const Container({
    required this.image,
    required this.command,
    required this.port,
    required this.cr,
  });

  factory Container.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> image;

  /// Command
  final _i2.Command command;

  /// Vec<Service>
  final List<_i3.Service> port;

  /// Cr
  final _i4.Cr cr;

  static const $ContainerCodec codec = $ContainerCodec();

  _i5.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'command': command.toJson(),
        'port': port.map((value) => value.toJson()).toList(),
        'cr': cr.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Container &&
          _i6.listsEqual(
            other.image,
            image,
          ) &&
          other.command == command &&
          _i6.listsEqual(
            other.port,
            port,
          ) &&
          other.cr == cr;

  @override
  int get hashCode => Object.hash(
        image,
        command,
        port,
        cr,
      );
}

class $ContainerCodec with _i1.Codec<Container> {
  const $ContainerCodec();

  @override
  void encodeTo(
    Container obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.image,
      output,
    );
    _i2.Command.codec.encodeTo(
      obj.command,
      output,
    );
    const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec).encodeTo(
      obj.port,
      output,
    );
    _i4.Cr.codec.encodeTo(
      obj.cr,
      output,
    );
  }

  @override
  Container decode(_i1.Input input) {
    return Container(
      image: _i1.U8SequenceCodec.codec.decode(input),
      command: _i2.Command.codec.decode(input),
      port:
          const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec).decode(input),
      cr: _i4.Cr.codec.decode(input),
    );
  }

  @override
  int sizeHint(Container obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.image);
    size = size + _i2.Command.codec.sizeHint(obj.command);
    size = size +
        const _i1.SequenceCodec<_i3.Service>(_i3.Service.codec)
            .sizeHint(obj.port);
    size = size + _i4.Cr.codec.sizeHint(obj.cr);
    return size;
  }
}
