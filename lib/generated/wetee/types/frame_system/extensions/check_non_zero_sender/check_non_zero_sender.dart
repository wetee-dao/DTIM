// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef CheckNonZeroSender = dynamic;

class CheckNonZeroSenderCodec with _i1.Codec<CheckNonZeroSender> {
  const CheckNonZeroSenderCodec();

  @override
  CheckNonZeroSender decode(_i1.Input input) {
    return _i1.NullCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    CheckNonZeroSender value,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(CheckNonZeroSender value) {
    return _i1.NullCodec.codec.sizeHint(value);
  }
}
