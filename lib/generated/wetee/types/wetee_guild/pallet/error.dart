// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
typedef Error = dynamic;

class ErrorCodec with _i1.Codec<Error> {
  const ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    return _i1.NullCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Error value) {
    return _i1.NullCodec.codec.sizeHint(value);
  }
}
