import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix/matrix.dart' as link;

import '../../utils/screen/screen.dart';
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
  // int _page = 0;
  bool publicGroup = false;
  late final AppCubit im;
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
    im = context.read<AppCubit>();
    // me = im.me!;
    if (im.currentState != null) {
      client = im.currentState!.client;
    }
    pageController = PageController();
  }

  void onPageChanged(int page) {
    // _page = page;
  }

  onSelect(index) {
    pageController.jumpToPage(index);
    setState(() {
      currentId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.sidebarBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "首选项",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "首选项",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ),
      body: Row(
        children: [
          Container(
            width: 180.w,
            height: double.maxFinite,
            padding: EdgeInsets.only(top: 15.w),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: settingNavs.length,
              itemBuilder: (context, index) {
                return HoverListItem(
                  subkey: settingNavs[index].name,
                  color: currentId == index ? constTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
                  hoverColor: constTheme.sidebarText.withOpacity(0.08),
                  onPressed: () async {
                    onSelect(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 2.w,
                          color: currentId == index ? constTheme.sidebarTextActiveBorder : Colors.transparent,
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
                          color: constTheme.sidebarText.withAlpha(155),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          settingNavs[index].name,
                          style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.normal,
                            color: constTheme.sidebarText.withAlpha(155),
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
