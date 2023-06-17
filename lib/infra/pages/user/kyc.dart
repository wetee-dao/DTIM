import 'package:asyou_app/application/store/app/app.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:auto_route/auto_route.dart';

import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KycPage extends StatefulWidget {
  final Function? closeModel;
  const KycPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
  late AppCubit im;

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final url = "https://zkSBT.wetee.app?address=${im.me!.address}";
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "zkSBT authentication",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "zkSBT authentication",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.w),
            Text(
              "You have not yet completed the real-name authentication. To complete the zkSBT certification in Chrome, please click the button below to redirect to the Chrome authentication page and install Manta Wallet for completing the real-name authentication.",
              style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
            ),
            SizedBox(height: 30.w),
            Text(
              "Setp1: Copy the link below",
              style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
            ),
            SizedBox(height: 10.w),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: constTheme.centerChannelColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      url,
                      style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                        text: url,
                      )).then((value) {
                        BotToast.showText(text: '验证地址复制成功', duration: const Duration(seconds: 2));
                      });
                    },
                    icon: Icon(Icons.copy, size: 20.w, color: constTheme.sidebarHeaderTextColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.w),
            Text(
              "Setp2: Open desktop chrome and paste it into the address bar.",
              style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
            ),
            const Spacer(),
            InkWell(
              key: const Key('joinDaoSubmit'),
              onTap: () async {
                await launchUrl(Uri.parse(url));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 30.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: constTheme.buttonBg,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Open browser',
                          style: TextStyle(
                            color: constTheme.buttonColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.w,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: constTheme.buttonColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.w)
          ],
        ),
      ),
    );
  }
}
