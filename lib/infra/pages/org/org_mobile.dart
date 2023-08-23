import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'org_view.dart';

@RoutePage(name: "orgMobileRoute")
class OrgMobilePage extends StatefulWidget {
  const OrgMobilePage({Key? key}) : super(key: key);

  @override
  State<OrgMobilePage> createState() => _OrgMobilePageState();
}

class _OrgMobilePageState extends State<OrgMobilePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double q = MediaQuery.of(context).size.width;
    return OrgViewPage(key: const Key("OrgViewPage"), width: q);
  }
}
