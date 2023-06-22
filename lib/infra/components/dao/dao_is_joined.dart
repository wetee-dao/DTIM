import 'package:dtim/infra/router/pop_router.dart';
import 'package:dtim/application/store/dao_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';

class DaoIsJoined extends StatelessWidget {
  final Widget child;
  final bool isJoined;

  const DaoIsJoined({
    Key? key,
    required this.child,
    required this.isJoined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isJoined) {
      return child;
    }
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Stack(
      children: [
        child,
        Positioned(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: constTheme.centerChannelColor.withOpacity(0.15),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: Container(
                width: 180.w,
                height: 230.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: constTheme.centerChannelBg.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.w),
                    Icon(
                      Icons.lock,
                      size: 38.w,
                      color: constTheme.errorTextColor,
                    ),
                    SizedBox(height: 10.w),
                    Text(
                      'You are not a member of this Work',
                      style: TextStyle(
                        color: constTheme.centerChannelColor,
                        fontSize: 15.w,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.w),
                    ElevatedButton(
                      key: const Key('joinDao'),
                      onPressed: () {
                        if (workCtx.nativeAmount.free < 100) {
                          BotToast.showText(
                              text: "The user's balance is not enough to pay the handling fee",
                              duration: const Duration(seconds: 2));
                          return;
                        }
                        showModelOrPage(context, "/join_dao");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => constTheme.buttonBg),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.w, horizontal: 30.w)),
                        shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                      ),
                      child: Text(
                        'Join',
                        style: TextStyle(
                          color: constTheme.buttonColor,
                          fontSize: 16.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.w),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
