// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef H256 = List<int>;

class H256Codec with _i1.Codec<H256> {
  const H256Codec();

  @override
  H256 decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    H256 value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(H256 value) {
    return const _i1.U8ArrayCodec(32).sizeHint(value);
  }
}
