// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:polkadart/scale_codec.dart' as _i1;

typedef AccountId32 = List<int>;

class AccountId32Codec with _i1.Codec<AccountId32> {
  const AccountId32Codec();

  @override
  AccountId32 decode(_i1.Input input) {
    return const _i1.U8ArrayCodec(32).decode(input);
  }

  @override
  void encodeTo(
    AccountId32 value,
    _i1.Output output,
  ) {
    const _i1.U8ArrayCodec(32).encodeTo(
      value,
      output,
    );
  }

  @override
  int sizeHint(AccountId32 value) {
    return const _i1.U8ArrayCodec(32).sizeHint(value);
  }
}
