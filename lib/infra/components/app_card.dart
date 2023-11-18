import 'package:bot_toast/bot_toast.dart';
import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/store/chain_ctx.dart';
import 'package:dtim/chain/wetee_gen/types/wetee_gov/member_data.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/gov_pop.dart';
import 'package:dtim/router.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dao/text.dart';
import 'loading_dialog.dart';

class AppCard extends StatelessWidget {
  final BigInt id;
  final String icon;
  final bool disable;
  final bool isActive;
  final Color? background;
  final String? label;
  final String? amount;
  final double width;
  const AppCard({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
    this.background,
    required this.id,
    required this.disable,
    required this.isActive,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return InkWell(
        onTap: () async {
          if (isActive) {
            BotToast.showText(text: "应用已集成，无法重新集成");
            return;
          }
          if (disable) return;
          // final ctx = globalCtx();
          final im = context.read<AppCubit>();
          // if (id == 0) {
          // final input = await showTextInputDialog(
          //   useRootNavigator: false,
          //   context: ctx,
          //   title: "引入 Gov 前必须初始化组织资产，请确认您是这个组织的创建者",
          //   okLabel: L10n.of(ctx)!.ok,
          //   cancelLabel: L10n.of(ctx)!.cancel,
          //   textFields: [
          //     DialogTextField(
          //       obscureText: false,
          //       hintText: "资产名称",
          //       initialText: "",
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return '不能为空';
          //         }
          //         return null;
          //       },
          //     ),
          //     DialogTextField(
          //       obscureText: false,
          //       hintText: "资产符号",
          //       initialText: "",
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return '不能为空';
          //         }
          //         return null;
          //       },
          //     ),
          //     DialogTextField(
          //       obscureText: false,
          //       hintText: "初始化资产",
          //       keyboardType: TextInputType.number,
          //       initialText: "",
          //       validator: (value) {
          //         final reg = RegExp(r"^[0-9_]+$");
          //         if (!reg.hasMatch(value ?? "")) {
          //           return '请输入数字';
          //         }
          //         if (value == null || value.isEmpty) {
          //           return '初始化资产不能为空';
          //         }
          //         if (int.parse(value) < 1000) {
          //           return '初始化资产不能少于1000';
          //         }
          //         return null;
          //       },
          //     ),
          //     DialogTextField(
          //       obscureText: false,
          //       hintText: "初始化股权",
          //       keyboardType: TextInputType.number,
          //       initialText: "",
          //       validator: (value) {
          //         final reg = RegExp(r"^[0-9_]+$");
          //         if (!reg.hasMatch(value ?? "")) {
          //           return '请输入数字';
          //         }
          //         if (value == null || value.isEmpty) {
          //           return '初始化股权不能为空';
          //         }
          //         return null;
          //       },
          //     ),
          //   ],
          // );
          // if (input == null) return;
          // if (!await inputPasswordg(im.me!)) {
          //   return;
          // }
          // globalCtx().router.pop();
          // await waitFutureLoading(
          //   context: globalCtx(),
          //   future: () async {
          // await rustApi.createAsset(
          //   client: weteeCtx.chainClient,
          //   from: im.me!.address,
          //   daoId: im.currentState!.org.daoId,
          //   name: input[0],
          //   decimals: int.parse(input[3]),
          //   totalSupply: int.parse(input[2]),
          //   symbol: input[1],
          // );
          //     await rustApi.orgIntegrateApp(
          //       client: weteeCtx.chainClient,
          //       from: im.me!.address,
          //       orgId: im.currentState!.org.daoId,
          //       appId: id,
          //       ext: const WithGovPs(
          //         runType: 2,
          //         amount: 0,
          //         member: MemberGroup(
          //           scope: 1,
          //           id: 0,
          //         ),
          //         // TODO
          //         periodIndex: 0,
          //       ),
          //     );
          //     BotToast.showText(text: "应用集成成功");
          //   },
          // );
          // } else {
          // var gov = await showGovPop(const MemberGroup(
          //   scope: 1,
          //   id: 0,
          // ));
          var gov = await showGovPop(const Global());
          if (gov == null) {
            BotToast.showText(text: "取消操作");
            return;
          }
          if (!await inputPasswordg(im.me!)) {
            return;
          }
          await waitFutureLoading(
            context: globalCtx(),
            future: () async {
              final call = weteeCtx.client.tx.weteeOrg.orgIntegrateApp(
                daoId: BigInt.tryParse(weteeCtx.org.daoId)!,
                appId: id,
              );
              await weteeCtx.client.signAndSubmit(call, weteeCtx.user.address, gov: gov);
              BotToast.showText(text: gov.runType == 2 ? "应用集成成功" : "应用集成提案将显示在治理中，请到治理插件中开启投票");
            },
          );
          //}
        },
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: width, maxWidth: width, minHeight: 99.w, maxHeight: 99.w),
              padding: EdgeInsets.fromLTRB(15.w, 10.w, 15.w, 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: constTheme.centerChannelColor.withOpacity(0.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    child: Container(
                      width: 75.w,
                      height: 75.w,
                      color: background ?? constTheme.buttonBg,
                      child: Center(
                        child: Image.network(
                          icon,
                          height: 37.5.w,
                          fit: BoxFit.fitWidth,
                          // color: constTheme.centerChannelColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.w),
                        Row(
                          children: [
                            PrimaryText(
                              text: label!,
                              size: 15.w,
                              fontWeight: FontWeight.w800,
                            ),
                            if (disable) SizedBox(width: 10.w),
                            if (disable)
                              Container(
                                decoration: BoxDecoration(
                                  color: constTheme.buttonBg,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 4.w),
                                child: Text(
                                  "即将开放",
                                  style: TextStyle(color: constTheme.buttonColor, fontSize: 11.w),
                                ),
                              ),
                            if (isActive) SizedBox(width: 10.w),
                            if (isActive)
                              Container(
                                decoration: BoxDecoration(
                                  color: constTheme.buttonBg,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 4.w),
                                child: Text(
                                  "已集成",
                                  style: TextStyle(color: constTheme.buttonColor, fontSize: 11.w),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 2.w),
                        Expanded(
                          child: PrimaryText(
                            text: amount!,
                            size: 12.w,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0.w,
              top: 0.w,
              child: Container(
                height: 30.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(71, 54, 244, 108),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.w),
                    bottomLeft: Radius.circular(10.w),
                  ),
                ),
                child: const Text("DAPP"),
              ),
            ),
          ],
        ));
  }
}
