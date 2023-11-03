// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef FixedU128 = BigInt;

class FixedU128Codec with _i1.Codec<FixedU128> {
  const FixedU128Codec();

  @override
  FixedU128 decode(_i1.Input input) {
    return _i1.U128Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    FixedU128 value,
    _i1.Output output,
  ) {
    _i1.U128Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(FixedU128 value) {
    return _i1.U128Codec.codec.sizeHint(value);
  }
}
