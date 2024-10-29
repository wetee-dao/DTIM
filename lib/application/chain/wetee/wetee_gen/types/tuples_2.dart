// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

class Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> {
  const Tuple8(
    this.value0,
    this.value1,
    this.value2,
    this.value3,
    this.value4,
    this.value5,
    this.value6,
    this.value7,
  );

  final T0 value0;

  final T1 value1;

  final T2 value2;

  final T3 value3;

  final T4 value4;

  final T5 value5;

  final T6 value6;

  final T7 value7;
}

class Tuple8Codec<T0, T1, T2, T3, T4, T5, T6, T7>
    with _i1.Codec<Tuple8<T0, T1, T2, T3, T4, T5, T6, T7>> {
  const Tuple8Codec(
    this.codec0,
    this.codec1,
    this.codec2,
    this.codec3,
    this.codec4,
    this.codec5,
    this.codec6,
    this.codec7,
  );

  final _i1.Codec<T0> codec0;

  final _i1.Codec<T1> codec1;

  final _i1.Codec<T2> codec2;

  final _i1.Codec<T3> codec3;

  final _i1.Codec<T4> codec4;

  final _i1.Codec<T5> codec5;

  final _i1.Codec<T6> codec6;

  final _i1.Codec<T7> codec7;

  @override
  void encodeTo(
    Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> tuple,
    _i1.Output output,
  ) {
    codec0.encodeTo(tuple.value0, output);
    codec1.encodeTo(tuple.value1, output);
    codec2.encodeTo(tuple.value2, output);
    codec3.encodeTo(tuple.value3, output);
    codec4.encodeTo(tuple.value4, output);
    codec5.encodeTo(tuple.value5, output);
    codec6.encodeTo(tuple.value6, output);
    codec7.encodeTo(tuple.value7, output);
  }

  @override
  Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> decode(_i1.Input input) {
    return Tuple8(
      codec0.decode(input),
      codec1.decode(input),
      codec2.decode(input),
      codec3.decode(input),
      codec4.decode(input),
      codec5.decode(input),
      codec6.decode(input),
      codec7.decode(input),
    );
  }

  @override
  int sizeHint(Tuple8<T0, T1, T2, T3, T4, T5, T6, T7> tuple) {
    int size = 0;
    size += codec0.sizeHint(tuple.value0);
    size += codec1.sizeHint(tuple.value1);
    size += codec2.sizeHint(tuple.value2);
    size += codec3.sizeHint(tuple.value3);
    size += codec4.sizeHint(tuple.value4);
    size += codec5.sizeHint(tuple.value5);
    size += codec6.sizeHint(tuple.value6);
    size += codec7.sizeHint(tuple.value7);
    return size;
  }
}
