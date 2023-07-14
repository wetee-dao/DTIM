import 'package:flutter/material.dart';
import 'package:dtim/application/store/theme.dart';
import '../tiles/abstract_settings_tile.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'abstract_settings_section.dart';

class SettingsSection extends AbstractSettingsSection {
  const SettingsSection({
    required this.tiles,
    this.margin,
    this.title,
    Key? key,
  }) : super(key: key);

  final List<AbstractSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return buildSectionBody(context);
  }

  Widget buildSectionBody(BuildContext context) {
    final tileList = buildTileList();
    final constTheme = Theme.of(context).extension<ExtColors>()!;

    if (title == null) {
      return tileList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          color: constTheme.centerChannelBg,
          padding: EdgeInsetsDirectional.only(
            top: 24.w,
            bottom: 10.w,
            start: 24.w,
            end: 24.w,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: constTheme.centerChannelColor,
              fontSize: 16.w,
            ),
            child: title!,
          ),
        ),
        Container(
          color: constTheme.centerChannelBg,
          child: tileList,
        ),
      ],
    );
  }

  Widget buildTileList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tiles.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return tiles[index];
      },
    );
  }
}
