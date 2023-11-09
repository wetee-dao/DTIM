// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef CheckNonce = BigInt;

class CheckNonceCodec with _i1.Codec<CheckNonce> {
  const CheckNonceCodec();

  @override
  CheckNonce decode(_i1.Input input) {
    return _i1.CompactBigIntCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    CheckNonce value,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(CheckNonce value) {
    return _i1.CompactBigIntCodec.codec.sizeHint(value);
  }
}
