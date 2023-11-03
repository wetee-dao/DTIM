// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i5;

import '../../sp_core/crypto/account_id32.dart' as _i3;
import '../../sp_runtime/dispatch_error.dart' as _i4;

/// The `Event` enum of this pallet
abstract class Event {
  const Event();

  factory Event.decode(_i1.Input input) {
    return codec.decode(input);
  }

  static const $EventCodec codec = $EventCodec();

  static const $Event values = $Event();

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

class $Event {
  const $Event();

  SudoDone sudoDone({
    required _i3.AccountId32 sudo,
    required _i1.Result<dynamic, _i4.DispatchError> sudoResult,
  }) {
    return SudoDone(
      sudo: sudo,
      sudoResult: sudoResult,
    );
  }

  SetSudo setSudo({
    required BigInt daoId,
    required _i3.AccountId32 sudoAccount,
  }) {
    return SetSudo(
      daoId: daoId,
      sudoAccount: sudoAccount,
    );
  }

  CloseSudo closeSudo({required BigInt daoId}) {
    return CloseSudo(daoId: daoId);
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return SudoDone._decode(input);
      case 1:
        return SetSudo._decode(input);
      case 2:
        return CloseSudo._decode(input);
      default:
        throw Exception('Event: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Event value,
    _i1.Output output,
  ) {
    switch (value.runtimeType) {
      case SudoDone:
        (value as SudoDone).encodeTo(output);
        break;
      case SetSudo:
        (value as SetSudo).encodeTo(output);
        break;
      case CloseSudo:
        (value as CloseSudo).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case SudoDone:
        return (value as SudoDone)._sizeHint();
      case SetSudo:
        return (value as SetSudo)._sizeHint();
      case CloseSudo:
        return (value as CloseSudo)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// root executes external transaction successfully.
class SudoDone extends Event {
  const SudoDone({
    required this.sudo,
    required this.sudoResult,
  });

  factory SudoDone._decode(_i1.Input input) {
    return SudoDone(
      sudo: const _i1.U8ArrayCodec(32).decode(input),
      sudoResult: const _i1.ResultCodec<dynamic, _i4.DispatchError>(
        _i1.NullCodec.codec,
        _i4.DispatchError.codec,
      ).decode(input),
    );
  }

  /// T::AccountId
  final _i3.AccountId32 sudo;

  /// DispatchResult
  final _i1.Result<dynamic, _i4.DispatchError> sudoResult;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SudoDone': {
          'sudo': sudo.toList(),
          'sudoResult': sudoResult.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i3.AccountId32Codec().sizeHint(sudo);
    size = size +
        const _i1.ResultCodec<dynamic, _i4.DispatchError>(
          _i1.NullCodec.codec,
          _i4.DispatchError.codec,
        ).sizeHint(sudoResult);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      sudo,
      output,
    );
    const _i1.ResultCodec<dynamic, _i4.DispatchError>(
      _i1.NullCodec.codec,
      _i4.DispatchError.codec,
    ).encodeTo(
      sudoResult,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is SudoDone &&
          _i5.listsEqual(
            other.sudo,
            sudo,
          ) &&
          other.sudoResult == sudoResult;

  @override
  int get hashCode => Object.hash(
        sudo,
        sudoResult,
      );
}

/// Set root account or reopen sudo.
class SetSudo extends Event {
  const SetSudo({
    required this.daoId,
    required this.sudoAccount,
  });

  factory SetSudo._decode(_i1.Input input) {
    return SetSudo(
      daoId: _i1.U64Codec.codec.decode(input),
      sudoAccount: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// DaoAssetId
  final BigInt daoId;

  /// T::AccountId
  final _i3.AccountId32 sudoAccount;

  @override
  Map<String, Map<String, dynamic>> toJson() => {
        'SetSudo': {
          'daoId': daoId,
          'sudoAccount': sudoAccount.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
    size = size + const _i3.AccountId32Codec().sizeHint(sudoAccount);
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
      other is SetSudo &&
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

/// close root account.
class CloseSudo extends Event {
  const CloseSudo({required this.daoId});

  factory CloseSudo._decode(_i1.Input input) {
    return CloseSudo(daoId: _i1.U64Codec.codec.decode(input));
  }

  /// DaoAssetId
  final BigInt daoId;

  @override
  Map<String, Map<String, BigInt>> toJson() => {
        'CloseSudo': {'daoId': daoId}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i1.U64Codec.codec.sizeHint(daoId);
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
