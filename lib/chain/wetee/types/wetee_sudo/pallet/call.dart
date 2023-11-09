// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i4;
import '../../wetee_runtime/runtime_call.dart' as _i3;

/// Contains a variant per dispatchable extrinsic that this pallet has.
abstract class Call {
  const Call();

  factory Call.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $CallCodec codec = $CallCodec();

  static const $Call values = $Call();

  _i2.Uint8List encode() {
    final output = _i1.ByteOutput(codec.sizeHint(this));
    codec.encodeTo(this, output);
    return output.toBytes();
  }

  int sizeHint() {
    return codec.sizeHint(this);
  }

  Map<String, Map<String, dynamic>> toJson();
}

class $Call {
  const $Call();

  Sudo sudo({
    required BigInt daoId,
    required _i3.RuntimeCall call,
  }) {
    return Sudo(
      daoId: daoId,
      call: call,
    );
  }

  SetSudoAccount setSudoAccount({
    required BigInt daoId,
    required _i4.AccountId32 sudoAccount,
  }) {
    return SetSudoAccount(
      daoId: daoId,
      sudoAccount: sudoAccount,
    );
  }

  CloseSudo closeSudo({required BigInt daoId}) {
    return CloseSudo(daoId: daoId);
  }
}

class $CallCodec with _i1.Codec<Call> {
  const $CallCodec();

  @override
  Call decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 1:
        return Sudo._decode(input);
      case 2:
        return SetSudoAccount._decode(input);
      case 3:
        return CloseSudo._decode(input);
      default:
        throw Exception('Call: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Call value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case Sudo:
        (value as Sudo).encodeTo(output);
        break;
      case SetSudoAccount:
        (value as SetSudoAccount).encodeTo(output);
        break;
      case CloseSudo:
        (value as CloseSudo).encodeTo(output);
        break;
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Call value) {
    switch (value.runtimeType) {
      case Sudo:
        return (value as Sudo)._sizeHint();
      case SetSudoAccount:
        return (value as SetSudoAccount)._sizeHint();
      case CloseSudo:
        return (value as CloseSudo)._sizeHint();
      default:
        throw Exception(
            'Call: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// See [`Pallet::sudo`].
class Sudo extends Call {
  const Sudo({
    required this.daoId,
    required this.call,
  });

  factory Sudo._decode(_i1.Input input) {
    return Sudo(
      daoId: _i1.U64Codec.codec.decode(input),
      call: _i3.RuntimeCall.codec.decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// Box<<T as wetee_org::Config>::RuntimeCall>
  final _i3.RuntimeCall call;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'sudo': {
          'daoId': daoId,
          'call': call.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + _i3.RuntimeCall.codec.sizeHint(call);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    _i3.RuntimeCall.codec.encodeTo(
      call,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Sudo && other.daoId == daoId && other.call == call;

  @override
  int get hashCode => Object.hash(
        daoId,
        call,
      );
}

/// See [`Pallet::set_sudo_account`].
class SetSudoAccount extends Call {
  const SetSudoAccount({
    required this.daoId,
    required this.sudoAccount,
  });

  factory SetSudoAccount._decode(_i1.Input input) {
    return SetSudoAccount(
      daoId: _i1.U64Codec.codec.decode(input),
      sudoAccount: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// T::AccountId
  final _i4.AccountId32 sudoAccount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'set_sudo_account': {
          'daoId': daoId,
          'sudoAccount': sudoAccount.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + const _i4.AccountId32Codec().sizeHint(sudoAccount);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      sudoAccount,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SetSudoAccount &&
          other.daoId == daoId &&
          _i5.listsEqual(
            other.sudoAccount,
            sudoAccount,
          );

  @override
  int get hashCode => Object.hash(
        daoId,
        sudoAccount,
      );
}

/// See [`Pallet::close_sudo`].
class CloseSudo extends Call {
  const CloseSudo({required this.daoId});

  factory CloseSudo._decode(_i1.Input input) {
    return CloseSudo(daoId: _i1.U64Codec.codec.decode(input));
  }

  /// DaoAssetId
  final BigInt daoId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'close_sudo': {'daoId': daoId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    _i1.U64Codec.codec.encodeTo(
      daoId,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is CloseSudo && other.daoId == daoId;

  @override
  int get hashCode => daoId.hashCode;
}
