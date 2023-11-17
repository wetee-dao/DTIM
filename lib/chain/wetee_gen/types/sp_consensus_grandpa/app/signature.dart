// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../../sp_core/ed25519/signature.dart' as _i1;

typedef Signature = _i1.Signature;

class SignatureCodec with _i2.Codec<Signature> {
  const SignatureCodec();

  @override
  Signature decode(_i2.Input input) {
    return const _i2.U8ArrayCodec(64).decode(input);
  }

  @override
  void encodeTo(
    Signature value,
    _i2.Output output,
  ) {
    const _i2.U8ArrayCodec(64).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Signature value) {
    return const _i1.SignatureCodec().sizeHint(value);
  }
}
