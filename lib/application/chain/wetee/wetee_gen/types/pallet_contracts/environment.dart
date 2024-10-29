// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i7;

import 'package:polkadart/scale_codec.dart' as _i1;

import 'environment_type_1.dart' as _i2;
import 'environment_type_2.dart' as _i3;
import 'environment_type_3.dart' as _i4;
import 'environment_type_4.dart' as _i5;
import 'environment_type_5.dart' as _i6;

class Environment {
  const Environment({
    required this.accountId,
    required this.balance,
    required this.hash,
    required this.hasher,
    required this.timestamp,
    required this.blockNumber,
  });

  factory Environment.decode(_i1.Input input) {
    return codec.decode(input);
  }

  /// EnvironmentType<AccountIdOf<T>>
  final _i2.EnvironmentType accountId;

  /// EnvironmentType<BalanceOf<T>>
  final _i3.EnvironmentType balance;

  /// EnvironmentType<<T as frame_system::Config>::Hash>
  final _i4.EnvironmentType hash;

  /// EnvironmentType<<T as frame_system::Config>::Hashing>
  final _i5.EnvironmentType hasher;

  /// EnvironmentType<MomentOf<T>>
  final _i6.EnvironmentType timestamp;

  /// EnvironmentType<BlockNumberFor<T>>
  final _i6.EnvironmentType blockNumber;

  static const $EnvironmentCodec codec = $EnvironmentCodec();

  _i7.Uint8List encode() {
    return codec.encode(this);
  }

  Map<String, dynamic> toJson() => {
        'accountId': null,
        'balance': null,
        'hash': null,
        'hasher': null,
        'timestamp': null,
        'blockNumber': null,
      };

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Environment &&
          other.accountId == accountId &&
          other.balance == balance &&
          other.hash == hash &&
          other.hasher == hasher &&
          other.timestamp == timestamp &&
          other.blockNumber == blockNumber;

  @override
  int get hashCode => Object.hash(
        accountId,
        balance,
        hash,
        hasher,
        timestamp,
        blockNumber,
      );
}

class $EnvironmentCodec with _i1.Codec<Environment> {
  const $EnvironmentCodec();

  @override
  void encodeTo(
    Environment obj,
    _i1.Output output,
  ) {
    _i1.NullCodec.codec.encodeTo(
      obj.accountId,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      obj.balance,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      obj.hash,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      obj.hasher,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      obj.timestamp,
      output,
    );
    _i1.NullCodec.codec.encodeTo(
      obj.blockNumber,
      output,
    );
  }

  @override
  Environment decode(_i1.Input input) {
    return Environment(
      accountId: _i1.NullCodec.codec.decode(input),
      balance: _i1.NullCodec.codec.decode(input),
      hash: _i1.NullCodec.codec.decode(input),
      hasher: _i1.NullCodec.codec.decode(input),
      timestamp: _i1.NullCodec.codec.decode(input),
      blockNumber: _i1.NullCodec.codec.decode(input),
    );
  }

  @override
  int sizeHint(Environment obj) {
    int size = 0;
    size = size + const _i2.EnvironmentTypeCodec().sizeHint(obj.accountId);
    size = size + const _i3.EnvironmentTypeCodec().sizeHint(obj.balance);
    size = size + const _i4.EnvironmentTypeCodec().sizeHint(obj.hash);
    size = size + const _i5.EnvironmentTypeCodec().sizeHint(obj.hasher);
    size = size + const _i6.EnvironmentTypeCodec().sizeHint(obj.timestamp);
    size = size + const _i6.EnvironmentTypeCodec().sizeHint(obj.blockNumber);
    return size;
  }
}
