// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i2;

import 'tuples.dart' as _i1;

typedef Cow = List<_i1.Tuple2<List<int>, int>>;

class CowCodec with _i2.Codec<Cow> {
  const CowCodec();

  @override
  Cow decode(_i2.Input input) {
    return const _i2.SequenceCodec<_i1.Tuple2<List<int>, int>>(
        _i1.Tuple2Codec<List<int>, int>(
      _i2.U8ArrayCodec(8),
      _i2.U32Codec.codec,
    )).decode(input);
  }

  @override
  void encodeTo(
    Cow value,
    _i2.Output output,
  ) {
    const _i2.SequenceCodec<_i1.Tuple2<List<int>, int>>(
        _i1.Tuple2Codec<List<int>, int>(
      _i2.U8ArrayCodec(8),
      _i2.U32Codec.codec,
    )).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Cow value) {
    return const _i2.SequenceCodec<_i1.Tuple2<List<int>, int>>(
        _i1.Tuple2Codec<List<int>, int>(
      _i2.U8ArrayCodec(8),
      _i2.U32Codec.codec,
    )).sizeHint(value);
  }
}
