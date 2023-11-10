import 'package:auto_route/auto_route.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/models/org.dart';
import 'package:dtim/infra/components/app_card.dart';
// import 'package:dtim/infra/components/dao/info_card.dart';
// import 'package:dtim/infra/components/dao/text.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:dtim/application/store/im.dart';
import 'package:dtim/application/store/theme.dart';

@RoutePage(name: "integrateRoute")
class IntegratePage extends StatefulWidget {
  const IntegratePage({Key? key}) : super(key: key);

  @override
  State<IntegratePage> createState() => _IntegratePageState();
}

class _IntegratePageState extends State<IntegratePage> {
  TextEditingController searchController = TextEditingController();
  late final AppCubit im;
  List<native.App> apps = [];
  List<OrgApp> oapps = [];
  bool loding = true;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    workCtx.setOrg(im.currentState!.org, im.me!);
    workCtx.connectChain(() {
      getData();
    });
  }

  getData() async {
    apps = await rustApi.appHubs(client: workCtx.chainClient);
    oapps = trans(await rustApi.orgApps(client: workCtx.chainClient, orgId: im.currentState!.org.daoId));
    loding = false;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final fapps = searchText == ""
        ? apps.reversed.toList()
        : apps.reversed
            .toList()
            .where((a) =>
                a.name.toLowerCase().contains(searchText.toLowerCase()) ||
                a.desc.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: SideBarAppBar(
        height: 45.w,
        title: "Integrate application",
        showMacosTop: false,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(
            AppIcons.shujujicheng,
            color: constTheme.sidebarHeaderTextColor,
            size: 20.w,
          ),
        ),
        tools: CloseBar(color: constTheme.sidebarText),
      ),
      body: loding
          ? Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w))
          : SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.w,
                    padding: EdgeInsets.only(bottom: 3.w),
                    decoration:
                        BoxDecoration(color: constTheme.sidebarHeaderBg, borderRadius: BorderRadius.circular(4.w)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
                        Icon(AppIcons.search, color: constTheme.sidebarHeaderTextColor, size: 18.w),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "按名称，类别搜索应用",
                              contentPadding: const EdgeInsets.all(0),
                              hintStyle: TextStyle(height: 1, color: constTheme.sidebarHeaderTextColor, fontSize: 14.w),
                              border: InputBorder.none,
                            ),
                            onChanged: (String v) {
                              setState(() {
                                searchText = v;
                              });
                            },
                            style: TextStyle(color: constTheme.sidebarHeaderTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.w),
                  SizedBox(
                      width: double.maxFinite,
                      child: LayoutBuilder(builder: (context, constraints) {
                        var row = (constraints.maxWidth + 20.w - (constraints.maxWidth + 20.w) % 350.w) ~/ 350.w;
                        return Wrap(
                          runSpacing: 20.w,
                          spacing: 20.w,
                          alignment: WrapAlignment.start,
                          children: [
                            for (var app in fapps)
                              AppCard(
                                id: app.id,
                                icon: app.icon,
                                disable: false,
                                isActive: getActive(app),
                                width: ((constraints.maxWidth + 20.w) / row) - 20.w,
                                background: const Color.fromARGB(255, 4, 18, 53),
                                label: app.name,
                                amount: app.desc,
                              ),
                            // AppCard(
                            //   icon: "https://wetee.app/icons/sxgl.png",
                            //   background: Color.fromARGB(255, 1, 18, 57),
                            //   label: "Gov&Asset",
                            //   amount: 'Implementing more democratic, transparent and inclusive decision making processes through smart contracts',
                            // ),
                            // dtim:///gov
                            // AppCard(
                            //   icon: "https://wetee.app/icons/kanban.png",
                            //   background: Color.fromARGB(255, 48, 1, 57),
                            //   label: "Kanban",
                            //   amount: 'The decentralization characteristic of blockchains and the real-time mind mapping function of collaborative whiteboards can realize a more trustworthy, open and intelligent way of team collaboration by mapping thoughts in real time.',
                            // ),
                            // dtim:///work
                            AppCard(
                              id: 5000,
                              disable: true,
                              isActive: false,
                              width: ((constraints.maxWidth + 20.w) / row) - 20.w,
                              icon: "https://wetee.app/icons/bifrost.png",
                              background: Colors.black,
                              label: "Bifrost",
                              amount:
                                  'Provide LSD for 9+ blockchains and beyond, dedicated layer-1 built on Substrate with XCM for cross-chain staking',
                            ),
                            AppCard(
                              id: 5000,
                              disable: true,
                              isActive: false,
                              width: ((constraints.maxWidth + 20.w) / row) - 20.w,
                              icon: "https://wetee.app/icons/54881907.png",
                              background: Colors.black,
                              label: "Acala",
                              amount: 'Cross-chain DeFi Hub for Polkadot, Kusama and beyond',
                            ),
                            AppCard(
                              id: 5000,
                              disable: true,
                              isActive: false,
                              width: ((constraints.maxWidth + 20.w) / row) - 20.w,
                              icon: "https://wetee.app/icons/astar.png",
                              background: Colors.black,
                              label: "Astar",
                              amount: 'The Future of Multichain Smart Contracts',
                            ),
                          ],
                        );
                      })),
                ],
              ),
            ),
    );
  }

  bool getActive(native.App org) {
    return oapps.where((oa) => oa.appId == org.id).toList().isNotEmpty;
  }
}
