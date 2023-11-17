// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;
import 'package:quiver/collection.dart' as _i7;

import '../../frame_support/dispatch/dispatch_info.dart' as _i3;
import '../../primitive_types/h256.dart' as _i6;
import '../../sp_core/crypto/account_id32.dart' as _i5;
import '../../sp_runtime/dispatch_error.dart' as _i4;

/// Event for the System pallet.
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

  Map<String, dynamic> toJson();
}

class $Event {
  const $Event();

  ExtrinsicSuccess extrinsicSuccess({required _i3.DispatchInfo dispatchInfo}) {
    return ExtrinsicSuccess(dispatchInfo: dispatchInfo);
  }

  ExtrinsicFailed extrinsicFailed({
    required _i4.DispatchError dispatchError,
    required _i3.DispatchInfo dispatchInfo,
  }) {
    return ExtrinsicFailed(
      dispatchError: dispatchError,
      dispatchInfo: dispatchInfo,
    );
  }

  CodeUpdated codeUpdated() {
    return CodeUpdated();
  }

  NewAccount newAccount({required _i5.AccountId32 account}) {
    return NewAccount(account: account);
  }

  KilledAccount killedAccount({required _i5.AccountId32 account}) {
    return KilledAccount(account: account);
  }

  Remarked remarked({
    required _i5.AccountId32 sender,
    required _i6.H256 hash,
  }) {
    return Remarked(
      sender: sender,
      hash: hash,
    );
  }
}

class $EventCodec with _i1.Codec<Event> {
  const $EventCodec();

  @override
  Event decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return ExtrinsicSuccess._decode(input);
      case 1:
        return ExtrinsicFailed._decode(input);
      case 2:
        return const CodeUpdated();
      case 3:
        return NewAccount._decode(input);
      case 4:
        return KilledAccount._decode(input);
      case 5:
        return Remarked._decode(input);
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
      case ExtrinsicSuccess:
        (value as ExtrinsicSuccess).encodeTo(output);
        break;
      case ExtrinsicFailed:
        (value as ExtrinsicFailed).encodeTo(output);
        break;
      case CodeUpdated:
        (value as CodeUpdated).encodeTo(output);
        break;
      case NewAccount:
        (value as NewAccount).encodeTo(output);
        break;
      case KilledAccount:
        (value as KilledAccount).encodeTo(output);
        break;
      case Remarked:
        (value as Remarked).encodeTo(output);
        break;
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }

  @override
  int sizeHint(Event value) {
    switch (value.runtimeType) {
      case ExtrinsicSuccess:
        return (value as ExtrinsicSuccess)._sizeHint();
      case ExtrinsicFailed:
        return (value as ExtrinsicFailed)._sizeHint();
      case CodeUpdated:
        return 1;
      case NewAccount:
        return (value as NewAccount)._sizeHint();
      case KilledAccount:
        return (value as KilledAccount)._sizeHint();
      case Remarked:
        return (value as Remarked)._sizeHint();
      default:
        throw Exception(
            'Event: Unsupported "$value" of type "${value.runtimeType}"');
    }
  }
}

/// An extrinsic completed successfully.
class ExtrinsicSuccess extends Event {
  const ExtrinsicSuccess({required this.dispatchInfo});

  factory ExtrinsicSuccess._decode(_i1.Input input) {
    return ExtrinsicSuccess(dispatchInfo: _i3.DispatchInfo.codec.decode(input));
  }

  /// DispatchInfo
  final _i3.DispatchInfo dispatchInfo;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'ExtrinsicSuccess': {'dispatchInfo': dispatchInfo.toJson()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i3.DispatchInfo.codec.sizeHint(dispatchInfo);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      0,
      output,
    );
    _i3.DispatchInfo.codec.encodeTo(
      dispatchInfo,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ExtrinsicSuccess && other.dispatchInfo == dispatchInfo;

  @override
  int get hashCode => dispatchInfo.hashCode;
}

/// An extrinsic failed.
class ExtrinsicFailed extends Event {
  const ExtrinsicFailed({
    required this.dispatchError,
    required this.dispatchInfo,
  });

  factory ExtrinsicFailed._decode(_i1.Input input) {
    return ExtrinsicFailed(
      dispatchError: _i4.DispatchError.codec.decode(input),
      dispatchInfo: _i3.DispatchInfo.codec.decode(input),
    );
  }

  /// DispatchError
  final _i4.DispatchError dispatchError;

  /// DispatchInfo
  final _i3.DispatchInfo dispatchInfo;

  @override
  Map<String, Map<String, Map<String, dynamic>>> toJson() => {
        'ExtrinsicFailed': {
          'dispatchError': dispatchError.toJson(),
          'dispatchInfo': dispatchInfo.toJson(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + _i4.DispatchError.codec.sizeHint(dispatchError);
    size = size + _i3.DispatchInfo.codec.sizeHint(dispatchInfo);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      1,
      output,
    );
    _i4.DispatchError.codec.encodeTo(
      dispatchError,
      output,
    );
    _i3.DispatchInfo.codec.encodeTo(
      dispatchInfo,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is ExtrinsicFailed &&
          other.dispatchError == dispatchError &&
          other.dispatchInfo == dispatchInfo;

  @override
  int get hashCode => Object.hash(
        dispatchError,
        dispatchInfo,
      );
}

/// `:code` was updated.
class CodeUpdated extends Event {
  const CodeUpdated();

  @override
  Map<String, dynamic> toJson() => {'CodeUpdated': null};

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      2,
      output,
    );
  }

  @override
  bool operator ==(Object other) => other is CodeUpdated;

  @override
  int get hashCode => runtimeType.hashCode;
}

/// A new account was created.
class NewAccount extends Event {
  const NewAccount({required this.account});

  factory NewAccount._decode(_i1.Input input) {
    return NewAccount(account: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i5.AccountId32 account;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'NewAccount': {'account': account.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(account);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      3,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      account,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is NewAccount &&
          _i7.listsEqual(
            other.account,
            account,
          );

  @override
  int get hashCode => account.hashCode;
}

/// An account was reaped.
class KilledAccount extends Event {
  const KilledAccount({required this.account});

  factory KilledAccount._decode(_i1.Input input) {
    return KilledAccount(account: const _i1.U8ArrayCodec(32).decode(input));
  }

  /// T::AccountId
  final _i5.AccountId32 account;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'KilledAccount': {'account': account.toList()}
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(account);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      4,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      account,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is KilledAccount &&
          _i7.listsEqual(
            other.account,
            account,
          );

  @override
  int get hashCode => account.hashCode;
}

/// On on-chain remark happened.
class Remarked extends Event {
  const Remarked({
    required this.sender,
    required this.hash,
  });

  factory Remarked._decode(_i1.Input input) {
    return Remarked(
      sender: const _i1.U8ArrayCodec(32).decode(input),
      hash: const _i1.U8ArrayCodec(32).decode(input),
    );
  }

  /// T::AccountId
  final _i5.AccountId32 sender;

  /// T::Hash
  final _i6.H256 hash;

  @override
  Map<String, Map<String, List<int>>> toJson() => {
        'Remarked': {
          'sender': sender.toList(),
          'hash': hash.toList(),
        }
      };

  int _sizeHint() {
    int size = 1;
    size = size + const _i5.AccountId32Codec().sizeHint(sender);
    size = size + const _i6.H256Codec().sizeHint(hash);
    return size;
  }

  void encodeTo(_i1.Output output) {
    _i1.U8Codec.codec.encodeTo(
      5,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      sender,
      output,
    );
    const _i1.U8ArrayCodec(32).encodeTo(
      hash,
      output,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(
        this,
        other,
      ) ||
      other is Remarked &&
          _i7.listsEqual(
            other.sender,
            sender,
          ) &&
          _i7.listsEqual(
            other.hash,
            hash,
          );

  @override
  int get hashCode => Object.hash(
        sender,
        hash,
      );
}
