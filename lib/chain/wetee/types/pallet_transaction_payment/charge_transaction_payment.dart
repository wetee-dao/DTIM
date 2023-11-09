// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef ChargeTransactionPayment = BigInt;

class ChargeTransactionPaymentCodec with _i1.Codec<ChargeTransactionPayment> {
  const ChargeTransactionPaymentCodec();

  @override
  ChargeTransactionPayment decode(_i1.Input input) {
    return _i1.CompactBigIntCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    ChargeTransactionPayment value,
    _i1.Output output,
  ) {
    _i1.CompactBigIntCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(ChargeTransactionPayment value) {
    return _i1.CompactBigIntCodec.codec.sizeHint(value);
  }
}
