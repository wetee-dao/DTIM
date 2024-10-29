// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef PalletId = List<int>;

class PalletIdCodec with _i1.Codec<PalletId> {
  const PalletIdCodec();

  @override
  PalletId decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(8).decode(input);
  }

  @override
  void encodeTo(
    PalletId value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(8).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(PalletId value) {
    return const _i1.U8ArrayCodec(8).sizeHint(value);
  }
}
