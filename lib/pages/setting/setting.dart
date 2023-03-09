import 'package:flutter/material.dart';

import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/components.dart';
import '../../components/form/switch.dart';
import '../../components/hover_list_item.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import 'notice.dart';

class SettingPage extends StatefulWidget {
  final Function? closeModel;
  const SettingPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool publicGroup = false;
  late final IMProvider im;
  late link.Client? client;
  late PageController pageController;
  int currentId = 0;

  final settingNavs = [
    SettingNav("通知", Icons.notifications),
    SettingNav("主题", Icons.notifications),
    SettingNav("语言和地区", Icons.notifications),
    SettingNav("音频和视频", Icons.notifications),
    SettingNav("隐私和可见性", Icons.notifications),
    SettingNav("高级", Icons.notifications),
  ];

  final settingPages = [
    const NoticePage(),
  ];

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    // me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
    }
  }

  onSelect(id) {
    setState(() {
      currentId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "首选项",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "首选项",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Row(
        children: [
          Container(
            width: 180.w,
            height: double.maxFinite,
            padding: EdgeInsets.only(top: 15.w),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08)),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: settingNavs.length,
              itemBuilder: (context, index) {
                return HoverListItem(
                  color: currentId == index ? ConstTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
                  hoverColor: ConstTheme.sidebarTextActiveBorder,
                  onPressed: () async {
                    onSelect(index);
                  },
                  trailing: Container(
                    margin: EdgeInsets.only(right: 12.w),
                    child: Icon(Icons.adaptive.more, size: 17.w, color: ConstTheme.sidebarText.withAlpha(155)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 2.w,
                          color: currentId == index ? ConstTheme.sidebarTextActiveBorder : Colors.transparent,
                        ),
                      ),
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.private_connectivity,
                          size: 24.w,
                          color: ConstTheme.sidebarText.withAlpha(155),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          settingNavs[index].name,
                          style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.normal,
                            color: ConstTheme.sidebarText.withAlpha(155),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingNav {
  final IconData icon;
  final String name;

  SettingNav(this.name, this.icon);
}
