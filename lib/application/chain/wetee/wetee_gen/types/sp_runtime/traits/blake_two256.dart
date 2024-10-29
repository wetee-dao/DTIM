// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef BlakeTwo256 = dynamic;

class BlakeTwo256Codec with _i1.Codec<BlakeTwo256> {
  const BlakeTwo256Codec();

  @override
  BlakeTwo256 decode(_i1.Input input) {
    return _i1.NullCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    BlakeTwo256 value,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(BlakeTwo256 value) {
    return _i1.NullCodec.codec.sizeHint(value);
  }
}
