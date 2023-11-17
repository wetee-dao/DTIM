// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i21;

import 'package:polkadart/polkadart.dart' as _i1;

import 'pallets/aura.dart' as _i4;
import 'pallets/balances.dart' as _i6;
import 'pallets/grandpa.dart' as _i5;
import 'pallets/message_queue.dart' as _i11;
import 'pallets/randomness_collective_flip.dart' as _i10;
import 'pallets/sudo.dart' as _i8;
import 'pallets/system.dart' as _i2;
import 'pallets/timestamp.dart' as _i3;
import 'pallets/tokens.dart' as _i9;
import 'pallets/transaction_payment.dart' as _i7;
import 'pallets/wetee_app.dart' as _i17;
import 'pallets/wetee_asset.dart' as _i13;
import 'pallets/wetee_gov.dart' as _i16;
import 'pallets/wetee_guild.dart' as _i19;
import 'pallets/wetee_org.dart' as _i12;
import 'pallets/wetee_project.dart' as _i15;
import 'pallets/wetee_sudo.dart' as _i14;
import 'pallets/wetee_treasury.dart' as _i20;
import 'pallets/wetee_worker.dart' as _i18;

class Queries {
  Queries(_i1.StateApi api)
      : system = _i2.Queries(api),
        timestamp = _i3.Queries(api),
        aura = _i4.Queries(api),
        grandpa = _i5.Queries(api),
        balances = _i6.Queries(api),
        transactionPayment = _i7.Queries(api),
        sudo = _i8.Queries(api),
        tokens = _i9.Queries(api),
        randomnessCollectiveFlip = _i10.Queries(api),
        messageQueue = _i11.Queries(api),
        weteeOrg = _i12.Queries(api),
        weteeAsset = _i13.Queries(api),
        weteeSudo = _i14.Queries(api),
        weteeProject = _i15.Queries(api),
        weteeGov = _i16.Queries(api),
        weteeApp = _i17.Queries(api),
        weteeWorker = _i18.Queries(api);

  final _i2.Queries system;

  final _i3.Queries timestamp;

  final _i4.Queries aura;

  final _i5.Queries grandpa;

  final _i6.Queries balances;

  final _i7.Queries transactionPayment;

  final _i8.Queries sudo;

  final _i9.Queries tokens;

  final _i10.Queries randomnessCollectiveFlip;

  final _i11.Queries messageQueue;

  final _i12.Queries weteeOrg;

  final _i13.Queries weteeAsset;

  final _i14.Queries weteeSudo;

  final _i15.Queries weteeProject;

  final _i16.Queries weteeGov;

  final _i17.Queries weteeApp;

  final _i18.Queries weteeWorker;
}

class Extrinsics {
  Extrinsics();

  final _i2.Txs system = _i2.Txs();

  final _i3.Txs timestamp = _i3.Txs();

  final _i5.Txs grandpa = _i5.Txs();

  final _i6.Txs balances = _i6.Txs();

  final _i8.Txs sudo = _i8.Txs();

  final _i9.Txs tokens = _i9.Txs();

  final _i11.Txs messageQueue = _i11.Txs();

  final _i12.Txs weteeOrg = _i12.Txs();

  final _i13.Txs weteeAsset = _i13.Txs();

  final _i14.Txs weteeSudo = _i14.Txs();

  final _i19.Txs weteeGuild = _i19.Txs();

  final _i15.Txs weteeProject = _i15.Txs();

  final _i16.Txs weteeGov = _i16.Txs();

  final _i20.Txs weteeTreasury = _i20.Txs();

  final _i17.Txs weteeApp = _i17.Txs();

  final _i18.Txs weteeWorker = _i18.Txs();
}

class Constants {
  Constants();

  final _i2.Constants system = _i2.Constants();

  final _i3.Constants timestamp = _i3.Constants();

  final _i5.Constants grandpa = _i5.Constants();

  final _i6.Constants balances = _i6.Constants();

  final _i7.Constants transactionPayment = _i7.Constants();

  final _i9.Constants tokens = _i9.Constants();

  final _i11.Constants messageQueue = _i11.Constants();

  final _i12.Constants weteeOrg = _i12.Constants();
}

class Rpc {
  const Rpc({
    required this.state,
    required this.system,
  });

  final _i1.StateApi state;

  final _i1.SystemApi system;
}

class Registry {
  Registry();

  final int extrinsicVersion = 4;

  List getSignedExtensionTypes() {
    return ['CheckMortality', 'CheckNonce', 'ChargeTransactionPayment'];
  }

  List getSignedExtensionExtra() {
    return [
      'CheckSpecVersion',
      'CheckTxVersion',
      'CheckGenesis',
      'CheckMortality'
    ];
  }
}

class WeteeGen {
  WeteeGen._(
    this._provider,
    this.rpc,
  )   : query = Queries(rpc.state),
        constant = Constants(),
        tx = Extrinsics(),
        registry = Registry();

  factory WeteeGen(_i1.Provider provider) {
    final rpc = Rpc(
      state: _i1.StateApi(provider),
      system: _i1.SystemApi(provider),
    );
    return WeteeGen._(
      provider,
      rpc,
    );
  }

  factory WeteeGen.url(Uri url) {
    final provider = _i1.Provider.fromUri(url);
    return WeteeGen(provider);
  }

  final _i1.Provider _provider;

  final Queries query;

  final Constants constant;

  final Rpc rpc;

  final Extrinsics tx;

  final Registry registry;

  _i21.Future connect() async {
    return await _provider.connect();
  }

  _i21.Future disconnect() async {
    return await _provider.disconnect();
  }
}
