import 'package:asyou_app/store/theme.dart';
import 'package:flutter/material.dart';
import '../tiles/abstract_settings_tile.dart';
import '../../../utils/screen.dart';
import 'theme_prew.dart';

class ThemeSettingsTile extends AbstractSettingsTile {
  /// The widget at the beginning of the tile
  final Widget? leading;

  /// The Widget at the end of the tile
  final Widget? trailing;

  /// The widget at the center of the tile
  final Widget title;

  /// The widget at the bottom of the [title]
  final Widget? description;

  final Widget? value;

  final Function(String value) onToggle;
  final String? initialValue;
  final bool enabled;
  final String type;

  const ThemeSettingsTile({
    required this.title,
    required this.onToggle,
    this.leading,
    this.trailing,
    this.value,
    this.description,
    this.enabled = true,
    this.type = "light",
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final themesCurr = themes.where((t) => t["type"] == type).toList();
    return IgnorePointer(
      ignoring: !enabled,
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 24),
                child: IconTheme(
                  data: IconTheme.of(context).copyWith(
                    color: enabled ? constTheme.centerChannelColor : constTheme.centerChannelColor.darker(2),
                  ),
                  child: leading!,
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 24.w,
                  end: 10.w,
                  bottom: 10.w,
                  top: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(
                        color: enabled ? constTheme.centerChannelColor : constTheme.centerChannelColor.darker(2),
                        fontSize: 13.w,
                        fontWeight: FontWeight.w400,
                      ),
                      child: title,
                    ),
                    if (value != null)
                      Padding(
                        padding: EdgeInsets.only(top: 4.w),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: enabled ? constTheme.centerChannelColor : constTheme.centerChannelColor.darker(2),
                          ),
                          child: value!,
                        ),
                      )
                    else if (description != null)
                      Padding(
                        padding: EdgeInsets.only(top: 4.w),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: enabled ? constTheme.centerChannelColor : constTheme.centerChannelColor.darker(2),
                          ),
                          child: description!,
                        ),
                      ),
                    SizedBox(height: 10.w),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: themesCurr.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.35,
                      ),
                      itemBuilder: (_, index) => ThemePrew(
                        theme: themesCurr[index],
                        selected: initialValue ?? "",
                        onTap: (name) {
                          onToggle(name);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: trailing!,
              )
          ],
        ),
      ),
    );
  }
}

class CurrThemeSettingsTile extends AbstractSettingsTile {
  final String theme;

  const CurrThemeSettingsTile({
    required this.theme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themesCurr = themes.where((t) => t["codeTheme"] == theme).toList();
    return Row(
      children: [
        SizedBox(width: 24.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemePrew(
              theme: themesCurr[0],
              selected: theme,
              onTap: (name) {},
            )
          ],
        )
      ],
    );
  }
}
