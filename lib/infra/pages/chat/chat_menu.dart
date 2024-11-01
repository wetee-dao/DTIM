// import 'package:adaptive_dialog/adaptive_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/l10n.dart';

// import 'package:dtim/application/store/theme.dart';
// import 'package:dtim/domain/utils/screen/screen.dart';
// import 'package:dtim/application/service/apis/apis.dart';
// import 'package:dtim/application/store/app/app.dart';
// import 'package:dtim/infra/components/loading_dialog.dart';
// import 'package:dtim/router.dart';

// class ItemModel {
//   String title;

//   Function(String id, AppCubit im)? onTap;
//   ItemModel(this.title, {this.onTap});
// }

// List<List<ItemModel>> menuItems = [
//   [
//     // ItemModel('邀请人员'),
//     ItemModel('组织设置', onTap: (id, _) {
//       showModelOrPage(globalCtx(), "/setting", width: 0.7.sw, height: 0.8.sh);
//     }),
//     // ItemModel('成员管理'),
//     ItemModel('离开组织', onTap: (id, im) async {
//       final accountOrgApi = await AccountOrgApi.create();
//       final orgs = await accountOrgApi.listByAccount(im.me!.address);
//       orgs.removeWhere((o) => o.nodeHash == im.currentState!.org.nodeHash);
//       if (OkCancelResult.ok ==
//           await showOkCancelAlertDialog(
//             useRootNavigator: false,
//             title: "提示",
//             message: "确认离开",
//             context: globalCtx(),
//             okLabel: L10n.of(globalCtx())!.next,
//             cancelLabel: L10n.of(globalCtx())!.cancel,
//           )) {
//         waitFutureLoading(
//           title: "处理中...",
//           context: globalCtx(),
//           future: () async {
//             await accountOrgApi.deleteOrg(im.me!.address, im.currentState!.org.nodeHash);
//             await im.logout();
//           },
//         );
//       }
//     }),
//   ],
//   // [
//   //   ItemModel('创建或加入组织', onTap: (id) {
//   //     globalCtx().router.pushNamed("/select_org");
//   //   })
//   // ]
// ];

// orgMenuRender(controller, width, AppCubit im) {
//   final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
//   return Container(
//     width: width,
//     margin: EdgeInsets.all(5.w),
//     decoration: BoxDecoration(
//       border: Border.all(color: constTheme.sidebarText.withOpacity(0.08)),
//       color: constTheme.centerChannelBg,
//       boxShadow: <BoxShadow>[
//         BoxShadow(
//           color: Colors.black.withOpacity(0.2),
//           blurRadius: 6.w,
//         ),
//       ],
//       borderRadius: BorderRadius.circular(3.w),
//     ),
//     child: IntrinsicWidth(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           for (var i = 0; i < menuItems.length; i++)
//             for (var j = 0; j < menuItems[i].length; j++)
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   controller.hideMenu();
//                   if (menuItems[i][j].onTap != null) {
//                     menuItems[i][j].onTap!.call("", im);
//                   }
//                 },
//                 child: Container(
//                   padding: EdgeInsets.only(
//                     left: 20.w,
//                     right: 20.w,
//                     bottom: j == menuItems[i].length - 1 ? 15.w : 8.w,
//                     top: j == 0 ? 15.w : 8.w,
//                   ),
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: i != menuItems.length - 1 && j == menuItems[i].length - 1
//                           ? BorderSide(color: constTheme.centerChannelColor.withOpacity(0.08))
//                           : BorderSide.none,
//                     ),
//                   ),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Text(
//                           menuItems[i][j].title,
//                           style: TextStyle(
//                             color: constTheme.centerChannelColor,
//                             fontSize: 13.w,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//         ],
//       ),
//     ),
//   );
// }
