// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef ExtraFlags = BigInt;

class ExtraFlagsCodec with _i1.Codec<ExtraFlags> {
  const ExtraFlagsCodec();

  @override
  ExtraFlags decode(_i1.Input input) {
    return _i1.U128Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    ExtraFlags value,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(ExtraFlags value) {
    return _i1.U128Codec.codec.sizeHint(value);
  }
}
