// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

class ContractState {
  const ContractState({
    required this.blockNumber,
    required this.minted,
    required this.withdrawal,
  });

  factory ContractState.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// BlockNumber
  final BigInt blockNumber;

  /// Balance
  final BigInt minted;

  /// Balance
  final BigInt withdrawal;

  static const $ContractStateCodec codec = $ContractStateCodec();

  _i2.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, BigInt> toJson() => {
        'blockNumber': blockNumber,
        'minted': minted,
        'withdrawal': withdrawal,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ContractState &&
          other.blockNumber == blockNumber &&
          other.minted == minted &&
          other.withdrawal == withdrawal;

  @override
  int get hashCode => Object.hash(
        blockNumber,
        minted,
        withdrawal,
      );
}

class $ContractStateCodec with _i1.Codec<ContractState> {
  const $ContractStateCodec();

  @override
  void encodeTo(
    ContractState obj,
    _i1.Output output,
  ) {
    _i1.U64Codec.codec.encodeTo(
      obj.blockNumber,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.minted,
      output,
    );
    _i1.U128Codec.codec.encodeTo(
      obj.withdrawal,
      output,
    );
  }

  @override
  ContractState decode(_i1.Input input) {
    return ContractState(
      blockNumber: _i1.U64Codec.codec.decode(input),
      minted: _i1.U128Codec.codec.decode(input),
      withdrawal: _i1.U128Codec.codec.decode(input),
    );
  }

  @override
  int sizeHint(ContractState obj) {
    int size = 0;
    size = size + _i1.U64Codec.codec.sizeHint(obj.blockNumber);
    size = size + _i1.U128Codec.codec.sizeHint(obj.minted);
    size = size + _i1.U128Codec.codec.sizeHint(obj.withdrawal);
    return size;
  }
}
