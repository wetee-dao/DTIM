// import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/application/chain/wetee/wetee_gen/types/wetee_matrix/node_info.dart';
import 'package:dtim/router.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/chain/wetee/wetee.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:polkadart/polkadart.dart';

// final chainUrl = PlatformInfos.isDesktop ? "ws://chain.gc.wetee.app:80" : "wss://chain.gc.wetee.app";
const chainUrl = "wss://xiaobai.asyou.me:30001";

class GlobalCTX with ChangeNotifier {
  late Account user;
  late AccountOrg org;
  late NodeInfo node;

  WeTEE? chainClient;
  Provider? provider;

  int blockNumber = 0;
  int totalIssuance = 0;
  int daoRefreshChannel = 0;
  bool reConnecting = false;
  String ss58Address = "";
  List<Function> callbacks = [];

  setOrg(AccountOrg porg, Account puser) {
    user = puser;
    org = porg;
  }

  connectChain(Function? callback) async {
    if (chainClient != null) {
      if (org.nodeId == "") {
        callback?.call();
        return;
      }
      await getData();
      return;
    }
    if (callback != null) {
      callbacks.add(callback);
    }
    if (reConnecting == true) {
      return;
    }
    final chainPre = WeTEE.url(chainUrl);
    printDebug("准备连接到区块链 ==> $chainUrl");
    chainPre.getBlockNumber().then((clientIndex) async {
      printSuccess("连接到区块链 ==> $chainUrl ===> $clientIndex");

      chainClient = chainPre;
      notifyListeners();

      await getData();
      for (var c in callbacks) {
        c();
      }
      callbacks = [];
    }).catchError((e) {
      chainClient = null;
      printError("连接到区块链 ==> $chainUrl ===> 失败 ===> ${e.toString()}");
      if (reConnecting == true) return;
      reConnecting = true;
      printWarning("等待 5s 后重新链接");
      Timer(const Duration(seconds: 5), () {
        reConnecting = false;
        connectChain(null);
      });
    });
  }

  disconnectChain() async {
    if (chainClient == null) return;
    await chainClient!.disconnect();
    chainClient = null;
    provider = null;
  }

  getData({notify = true}) async {
    // 区块链代码
    blockNumber = await chainClient!.getBlockNumber();

    if (org.nodeId == "") return;
    final nodeId = BigInt.tryParse(org.nodeId)!;
    // final publicKey = hex.decode(user.address);

    // DAO信息
    node = (await chainClient!.query.weTEEMatrix.matrix(nodeId))!;

    if (notify) notifyListeners();
  }

  timeTick() async {
    int newBlockNumber = await chainClient!.getBlockNumber();
    if (newBlockNumber != blockNumber) {
      blockNumber = newBlockNumber;
      if (daoRefreshChannel > 0) {
        daoRefreshChannel--;
        await getData();
      } else {
        if (user.address != '') {
          if (org.nodeId == "0") return;
        }
      }
      notifyListeners();
    }
  }

  Future<bool> inputPassword() async {
    return await inputPasswordg(user);
  }

  WeTEE get client => chainClient!;
}

final chainCtx = GlobalCTX();

Future<bool> inputPasswordg(Account user) async {
  if (!PlatformInfos.isWeb) {
    final ctx = globalCtx();
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: ctx,
      title: L10n.of(ctx)!.userPaypassword,
      okLabel: L10n.of(ctx)!.ok,
      cancelLabel: L10n.of(ctx)!.cancel,
      textFields: [
        DialogTextField(
          obscureText: true,
          hintText: L10n.of(ctx)!.pleaseEnterYourPassword,
          initialText: "",
        )
      ],
    );
    if (input == null) return false;
    final res = await waitFutureLoading<String>(
      context: globalCtx(),
      future: () async {
        final pwd = input[0];
        try {
          await WeTEE.addKeyring(account: ChainAccountData.fromJson(json.decode(user.chainData)), password: pwd);
        } catch (e) {
          return e.toString();
        }
        return "ok";
      },
    );
    if (res.result != "ok") {
      BotToast.showText(text: res.result ?? "error", duration: const Duration(seconds: 2));
      return false;
    }
  }
  return true;
}
