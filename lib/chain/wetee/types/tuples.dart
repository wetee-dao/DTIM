// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

class Tuple2<T0, T1> {
  const Tuple2(
    this.value0,
    this.value1,
  );

  final T0 value0;

  final T1 value1;
}

class Tuple2Codec<T0, T1> with _i1.Codec<Tuple2<T0, T1>> {
  const Tuple2Codec(
    this.codec0,
    this.codec1,
  );

  final _i1.Codec<T0> codec0;

  final _i1.Codec<T1> codec1;

  @override
  void encodeTo(
    Tuple2<T0, T1> tuple,
    _i1.Output output,
  ) {
    codec0.encodeTo(tuple.value0, output);
    codec1.encodeTo(tuple.value1, output);
  }

  @override
  Tuple2<T0, T1> decode(_i1.Input input) {
    return Tuple2(
      codec0.decode(input),
      codec1.decode(input),
    );
  }

  @override
  int sizeHint(Tuple2<T0, T1> tuple) {
    int size = 0;
    size += codec0.sizeHint(tuple.value0);
    size += codec1.sizeHint(tuple.value1);
    return size;
  }
}
