// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef CheckGenesis = dynamic;

class CheckGenesisCodec with _i1.Codec<CheckGenesis> {
  const CheckGenesisCodec();

  @override
  CheckGenesis decode(_i1.Input input) {
    return _i1.NullCodec.codec.decode(input);
  }

  @override
  void encodeTo(
    CheckGenesis value,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(CheckGenesis value) {
    return _i1.NullCodec.codec.sizeHint(value);
  }
}
