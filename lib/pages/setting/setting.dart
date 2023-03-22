import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart' as link;

import '../../utils/screen.dart';
import '../../components/components.dart';
import '../../components/hover_list_item.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import 'notice.dart';
import 'theme.dart';

class SettingPage extends StatefulWidget {
  final Function? closeModel;
  const SettingPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

final settingPages = [
  const NoticePage(),
  const ThemePage(),
];

class _SettingPageState extends State<SettingPage> {
  int _page = 0;
  bool publicGroup = false;
  late final IMProvider im;
  late link.Client? client;
  late PageController pageController;
  int currentId = 0;

  final settingNavs = [
    SettingNav("通知", Icons.notifications),
    SettingNav("主题", Icons.notifications),
    // SettingNav("语言和地区", Icons.notifications),
    // SettingNav("音频和视频", Icons.notifications),
    // SettingNav("隐私和可见性", Icons.notifications),
    // SettingNav("高级", Icons.notifications),
  ];

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    // me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
    }
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  onSelect(index) {
    pageController.jumpToPage(index);
    setState(() {
      currentId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.sidebarBg,
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
                right: BorderSide(color: ConstTheme.centerChannelColor.withOpacity(0.08)),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: settingNavs.length,
              itemBuilder: (context, index) {
                return HoverListItem(
                  color: currentId == index ? ConstTheme.centerChannelColor.withOpacity(0.08) : Colors.transparent,
                  hoverColor: ConstTheme.sidebarTextActiveBorder.withOpacity(0.08),
                  onPressed: () async {
                    onSelect(index);
                  },
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
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: settingPages,
            ),
          )
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
