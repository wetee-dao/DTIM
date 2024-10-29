// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i3;

class Api {
  const Api({
    required this.url,
    required this.method,
  });

  factory Api.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// Vec<u8>
  final List<int> url;

  /// u8
  final int method;

  static const $ApiCodec codec = $ApiCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'method': method,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Api &&
          _i3.listsEqual(
            other.url,
            url,
          ) &&
          other.method == method;

  @override
  int get hashCode => Object.hash(
        url,
        method,
      );
}

class $ApiCodec with _i1.Codec<Api> {
  const $ApiCodec();

  @override
  void encodeTo(
    Api obj,
    _i1.Output output,
  ) {
    _i1.U8SequenceCodec.codec.encodeTo(
      obj.url,
      output,
    );
    _i1.U8Codec.codec.encodeTo(
      obj.method,
      output,
    );
  }

  @override
  Api decode(_i1.Input input) {
    return Api(
      url: _i1.U8SequenceCodec.codec.decode(input),
      method: _i1.U8Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Api obj) {
    int size = 0;
    size = size + _i1.U8SequenceCodec.codec.sizeHint(obj.url);
    size = size + _i1.U8Codec.codec.sizeHint(obj.method);
    return size;
  }
}
