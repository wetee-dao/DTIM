// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:polkadart/scale_codec.dart' as _i1;

/// The `Error` enum of this pallet.
enum Error {
  /// Invalid schedule supplied, e.g. with zero weight of a basic operation.
  invalidSchedule('InvalidSchedule', 0),

  /// Invalid combination of flags supplied to `seal_call` or `seal_delegate_call`.
  invalidCallFlags('InvalidCallFlags', 1),

  /// The executed contract exhausted its gas limit.
  outOfGas('OutOfGas', 2),

  /// The output buffer supplied to a contract API call was too small.
  outputBufferTooSmall('OutputBufferTooSmall', 3),

  /// Performing the requested transfer failed. Probably because there isn't enough
  /// free balance in the sender's account.
  transferFailed('TransferFailed', 4),

  /// Performing a call was denied because the calling depth reached the limit
  /// of what is specified in the schedule.
  maxCallDepthReached('MaxCallDepthReached', 5),

  /// No contract was found at the specified address.
  contractNotFound('ContractNotFound', 6),

  /// The code supplied to `instantiate_with_code` exceeds the limit specified in the
  /// current schedule.
  codeTooLarge('CodeTooLarge', 7),

  /// No code could be found at the supplied code hash.
  codeNotFound('CodeNotFound', 8),

  /// No code info could be found at the supplied code hash.
  codeInfoNotFound('CodeInfoNotFound', 9),

  /// A buffer outside of sandbox memory was passed to a contract API function.
  outOfBounds('OutOfBounds', 10),

  /// Input passed to a contract API function failed to decode as expected type.
  decodingFailed('DecodingFailed', 11),

  /// Contract trapped during execution.
  contractTrapped('ContractTrapped', 12),

  /// The size defined in `T::MaxValueSize` was exceeded.
  valueTooLarge('ValueTooLarge', 13),

  /// Termination of a contract is not allowed while the contract is already
  /// on the call stack. Can be triggered by `seal_terminate`.
  terminatedWhileReentrant('TerminatedWhileReentrant', 14),

  /// `seal_call` forwarded this contracts input. It therefore is no longer available.
  inputForwarded('InputForwarded', 15),

  /// The subject passed to `seal_random` exceeds the limit.
  randomSubjectTooLong('RandomSubjectTooLong', 16),

  /// The amount of topics passed to `seal_deposit_events` exceeds the limit.
  tooManyTopics('TooManyTopics', 17),

  /// The chain does not provide a chain extension. Calling the chain extension results
  /// in this error. Note that this usually  shouldn't happen as deploying such contracts
  /// is rejected.
  noChainExtension('NoChainExtension', 18),

  /// Failed to decode the XCM program.
  xCMDecodeFailed('XCMDecodeFailed', 19),

  /// A contract with the same AccountId already exists.
  duplicateContract('DuplicateContract', 20),

  /// A contract self destructed in its constructor.
  ///
  /// This can be triggered by a call to `seal_terminate`.
  terminatedInConstructor('TerminatedInConstructor', 21),

  /// A call tried to invoke a contract that is flagged as non-reentrant.
  /// The only other cause is that a call from a contract into the runtime tried to call back
  /// into `pallet-contracts`. This would make the whole pallet reentrant with regard to
  /// contract code execution which is not supported.
  reentranceDenied('ReentranceDenied', 22),

  /// A contract attempted to invoke a state modifying API while being in read-only mode.
  stateChangeDenied('StateChangeDenied', 23),

  /// Origin doesn't have enough balance to pay the required storage deposits.
  storageDepositNotEnoughFunds('StorageDepositNotEnoughFunds', 24),

  /// More storage was created than allowed by the storage deposit limit.
  storageDepositLimitExhausted('StorageDepositLimitExhausted', 25),

  /// Code removal was denied because the code is still in use by at least one contract.
  codeInUse('CodeInUse', 26),

  /// The contract ran to completion but decided to revert its storage changes.
  /// Please note that this error is only returned from extrinsics. When called directly
  /// or via RPC an `Ok` will be returned. In this case the caller needs to inspect the flags
  /// to determine whether a reversion has taken place.
  contractReverted('ContractReverted', 27),

  /// The contract's code was found to be invalid during validation.
  ///
  /// The most likely cause of this is that an API was used which is not supported by the
  /// node. This happens if an older node is used with a new version of ink!. Try updating
  /// your node to the newest available version.
  ///
  /// A more detailed error can be found on the node console if debug messages are enabled
  /// by supplying `-lruntime::contracts=debug`.
  codeRejected('CodeRejected', 28),

  /// An indeterministic code was used in a context where this is not permitted.
  indeterministic('Indeterministic', 29),

  /// A pending migration needs to complete before the extrinsic can be called.
  migrationInProgress('MigrationInProgress', 30),

  /// Migrate dispatch call was attempted but no migration was performed.
  noMigrationPerformed('NoMigrationPerformed', 31),

  /// The contract has reached its maximum number of delegate dependencies.
  maxDelegateDependenciesReached('MaxDelegateDependenciesReached', 32),

  /// The dependency was not found in the contract's delegate dependencies.
  delegateDependencyNotFound('DelegateDependencyNotFound', 33),

  /// The contract already depends on the given delegate dependency.
  delegateDependencyAlreadyExists('DelegateDependencyAlreadyExists', 34),

  /// Can not add a delegate dependency to the code hash of the contract itself.
  cannotAddSelfAsDelegateDependency('CannotAddSelfAsDelegateDependency', 35);

  const Error(
    this.variantName,
    this.codecIndex,
  );

  factory Error.decode(_i1.Input input) {
    return codec.decode(input);
  }

  final String variantName;

  final int codecIndex;

  static const $ErrorCodec codec = $ErrorCodec();

  String toJson() => variantName;
  _i2.Uint8List encode() {
    return codec.encode(this);
  }
}

class $ErrorCodec with _i1.Codec<Error> {
  const $ErrorCodec();

  @override
  Error decode(_i1.Input input) {
    final index = _i1.U8Codec.codec.decode(input);
    switch (index) {
      case 0:
        return Error.invalidSchedule;
      case 1:
        return Error.invalidCallFlags;
      case 2:
        return Error.outOfGas;
      case 3:
        return Error.outputBufferTooSmall;
      case 4:
        return Error.transferFailed;
      case 5:
        return Error.maxCallDepthReached;
      case 6:
        return Error.contractNotFound;
      case 7:
        return Error.codeTooLarge;
      case 8:
        return Error.codeNotFound;
      case 9:
        return Error.codeInfoNotFound;
      case 10:
        return Error.outOfBounds;
      case 11:
        return Error.decodingFailed;
      case 12:
        return Error.contractTrapped;
      case 13:
        return Error.valueTooLarge;
      case 14:
        return Error.terminatedWhileReentrant;
      case 15:
        return Error.inputForwarded;
      case 16:
        return Error.randomSubjectTooLong;
      case 17:
        return Error.tooManyTopics;
      case 18:
        return Error.noChainExtension;
      case 19:
        return Error.xCMDecodeFailed;
      case 20:
        return Error.duplicateContract;
      case 21:
        return Error.terminatedInConstructor;
      case 22:
        return Error.reentranceDenied;
      case 23:
        return Error.stateChangeDenied;
      case 24:
        return Error.storageDepositNotEnoughFunds;
      case 25:
        return Error.storageDepositLimitExhausted;
      case 26:
        return Error.codeInUse;
      case 27:
        return Error.contractReverted;
      case 28:
        return Error.codeRejected;
      case 29:
        return Error.indeterministic;
      case 30:
        return Error.migrationInProgress;
      case 31:
        return Error.noMigrationPerformed;
      case 32:
        return Error.maxDelegateDependenciesReached;
      case 33:
        return Error.delegateDependencyNotFound;
      case 34:
        return Error.delegateDependencyAlreadyExists;
      case 35:
        return Error.cannotAddSelfAsDelegateDependency;
      default:
        throw Exception('Error: Invalid variant index: "$index"');
    }
  }

  @override
  void encodeTo(
    Error value,
    _i1.Output output,
  ) {
    _i1.U8Codec.codec.encodeTo(
      value.codecIndex,
      output,
    );
  }
}
