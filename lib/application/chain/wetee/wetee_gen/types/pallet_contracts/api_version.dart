// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef ApiVersion = int;

class ApiVersionCodec with _i1.Codec<ApiVersion> {
  const ApiVersionCodec();

  @override
  ApiVersion decode(_i1.Input input) {
    return _i1.U16Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    ApiVersion value,
    _i1.Output output,
  ) {
    _i1.U16Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(ApiVersion value) {
    return _i1.U16Codec.codec.sizeHint(value);
  }
}
