// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef Slot = BigInt;

class SlotCodec with _i1.Codec<Slot> {
  const SlotCodec();

  @override
  Slot decode(_i1.Input input) {
    return _i1.U64Codec.codec.decode(input);
  }

  @override
  void encodeTo(
    Slot value,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(Slot value) {
    return _i1.U64Codec.codec.sizeHint(value);
  }
}
