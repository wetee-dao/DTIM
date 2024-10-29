// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i4;

import 'api.dart' as _i2;

class ApiMeta {
  const ApiMeta({
    required this.port,
    required this.apis,
  });

  factory ApiMeta.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// u16
  final int port;

  /// Vec<Api>
  final List<_i2.Api> apis;

  static const $ApiMetaCodec codec = $ApiMetaCodec();

  _i3.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'port': port,
        'apis': apis.map((value) => value.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ApiMeta &&
          other.port == port &&
          _i4.listsEqual(
            other.apis,
            apis,
          );

  @override
  int get hashCode => Object.hash(
        port,
        apis,
      );
}

class $ApiMetaCodec with _i1.Codec<ApiMeta> {
  const $ApiMetaCodec();

  @override
  void encodeTo(
    ApiMeta obj,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      obj.port,
      output,
    );
    const _i1.SequenceCodec<_i2.Api>(_i2.Api.codec).encodeTo(
      obj.apis,
      output,
    );
  }

  @override
  ApiMeta decode(_i1.Input input) {
    return ApiMeta(
      port: _i1.U16Codec.codec.decode(input),
      apis: const _i1.SequenceCodec<_i2.Api>(_i2.Api.codec).decode(input),
    );
  }

  @override
  int sizeHint(ApiMeta obj) {
    int size = 0;
    size = size + _i1.U16Codec.codec.sizeHint(obj.port);
    size = size +
        const _i1.SequenceCodec<_i2.Api>(_i2.Api.codec).sizeHint(obj.apis);
    return size;
  }
}
