// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import '../../../sp_core/sr25519/public.dart' as _i1;

typedef Public = _i1.Public;

class PublicCodec with _i2.Codec<Public> {
  const PublicCodec();

  @override
  Public decode(_i2.Input input) {
    return const _i2.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    Public value,
    _i2.Output output,
  ) {
    const _i2.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Public value) {
    return const _i1.PublicCodec().sizeHint(value);
  }
}
