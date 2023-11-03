// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:polkadart/polkadart.dart' as _i1;
import 'package:polkadart/scale_codec.dart' as _i5;

import '../types/pallet_message_queue/book_state.dart' as _i3;
import '../types/pallet_message_queue/page.dart' as _i4;
import '../types/pallet_message_queue/pallet/call.dart' as _i8;
import '../types/sp_weights/weight_v2/weight.dart' as _i9;
import '../types/wetee_primitives/traits/message_origin.dart' as _i2;
import '../types/wetee_runtime/runtime_call.dart' as _i7;

class Queries {
  const Queries(this.__api);

  final _i1.StateApi __api;

  final _i1.StorageMap<_i2.MessageOrigin, _i3.BookState> _bookStateFor =
      const _i1.StorageMap<_i2.MessageOrigin, _i3.BookState>(
    prefix: 'MessageQueue',
    storage: 'BookStateFor',
    valueCodec: _i3.BookState.codec,
    hasher: _i1.StorageHasher.twoxx64Concat(_i2.MessageOrigin.codec),
  );

  final _i1.StorageValue<_i2.MessageOrigin> _serviceHead =
      const _i1.StorageValue<_i2.MessageOrigin>(
    prefix: 'MessageQueue',
    storage: 'ServiceHead',
    valueCodec: _i2.MessageOrigin.codec,
  );

  final _i1.StorageDoubleMap<_i2.MessageOrigin, int, _i4.Page> _pages =
      const _i1.StorageDoubleMap<_i2.MessageOrigin, int, _i4.Page>(
    prefix: 'MessageQueue',
    storage: 'Pages',
    valueCodec: _i4.Page.codec,
    hasher1: _i1.StorageHasher.twoxx64Concat(_i2.MessageOrigin.codec),
    hasher2: _i1.StorageHasher.twoxx64Concat(_i5.U32Codec.codec),
  );

  /// The index of the first and last (non-empty) pages.
  _i6.Future<_i3.BookState> bookStateFor(
    _i2.MessageOrigin key1, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _bookStateFor.hashedKeyFor(key1);
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _bookStateFor.decodeValue(bytes);
    }
    return _i3.BookState(
      begin: 0,
      end: 0,
      count: 0,
      readyNeighbours: null,
      messageCount: BigInt.zero,
      size: BigInt.zero,
    ); /* Default */
  }

  /// The origin at which we should begin servicing.
  _i6.Future<_i2.MessageOrigin?> serviceHead({_i1.BlockHash? at}) async {
    final hashedKey = _serviceHead.hashedKey();
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _serviceHead.decodeValue(bytes);
    }
    return null; /* Nullable */
  }

  /// The map of page indices to pages.
  _i6.Future<_i4.Page?> pages(
    _i2.MessageOrigin key1,
    int key2, {
    _i1.BlockHash? at,
  }) async {
    final hashedKey = _pages.hashedKeyFor(
      key1,
      key2,
    );
    final bytes = await __api.getStorage(
      hashedKey,
      at: at,
    );
    if (bytes != null) {
      return _pages.decodeValue(bytes);
    }
    return null; /* Nullable */
  }
}

class Txs {
  const Txs();

  /// See [`Pallet::reap_page`].
  _i7.RuntimeCall reapPage({
    required messageOrigin,
    required pageIndex,
  }) {
    final _call = _i8.Call.values.reapPage(
      messageOrigin: messageOrigin,
      pageIndex: pageIndex,
    );
    return _i7.RuntimeCall.values.messageQueue(_call);
  }

  /// See [`Pallet::execute_overweight`].
  _i7.RuntimeCall executeOverweight({
    required messageOrigin,
    required page,
    required index,
    required weightLimit,
  }) {
    final _call = _i8.Call.values.executeOverweight(
      messageOrigin: messageOrigin,
      page: page,
      index: index,
      weightLimit: weightLimit,
    );
    return _i7.RuntimeCall.values.messageQueue(_call);
  }
}

class Constants {
  Constants();

  /// The size of the page; this implies the maximum message size which can be sent.
  ///
  /// A good value depends on the expected message sizes, their weights, the weight that is
  /// available for processing them and the maximal needed message size. The maximal message
  /// size is slightly lower than this as defined by [`MaxMessageLenOf`].
  final int heapSize = 65536;

  /// The maximum number of stale pages (i.e. of overweight messages) allowed before culling
  /// can happen. Once there are more stale pages than this, then historical pages may be
  /// dropped, even if they contain unprocessed overweight messages.
  final int maxStale = 128;

  /// The amount of weight (if any) which should be provided to the message queue for
  /// servicing enqueued items.
  ///
  /// This may be legitimately `None` in the case that you will call
  /// `ServiceQueues::service_queues` manually.
  final _i9.Weight? serviceWeight = _i9.Weight(
    refTime: BigInt.from(400000000000),
    proofSize: BigInt.parse(
      '3689348814741910323',
      radix: 10,
    ),
  );
}
