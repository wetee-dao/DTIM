import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router.dart';
import '../../store/dao_ctx.dart';
import '../../store/theme.dart';

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
    final dao = context.watch<DAOCTX>();
    return Stack(
      children: [
        child,
        Positioned(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: constTheme.errorTextColor.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: Container(
                width: 180.w,
                height: 230.w,
                decoration: BoxDecoration(
                  color: constTheme.centerChannelBg,
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
                      'You are not a member of this DAO',
                      style: TextStyle(
                        color: constTheme.centerChannelColor,
                        fontSize: 20.w,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.w),
                    ElevatedButton(
                      onPressed: () {
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
                          fontSize: 20.w,
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
