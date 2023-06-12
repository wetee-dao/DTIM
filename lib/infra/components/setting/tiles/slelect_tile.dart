import 'package:asyou_app/application/store/theme.dart';
import 'package:flutter/material.dart';
import 'abstract_settings_tile.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'theme_prew.dart';

class SelectTile extends AbstractSettingsTile {
  /// The widget at the beginning of the tile
  final Widget? leading;

  /// The Widget at the end of the tile
  final Widget? trailing;

  /// The widget at the center of the tile
  final Widget title;

  /// The widget at the bottom of the [title]
  final Widget? description;

  late final Widget? value;

  /// A function that is called by tap on a tile
  final Function(BuildContext context)? onPressed;
  late final Function(String value)? onToggle;
  late final String? initialValue;
  late final bool enabled;

  SelectTile({
    this.leading,
    this.trailing,
    this.value,
    required this.title,
    this.description,
    this.onPressed,
    this.enabled = true,
    Key? key,
  }) : super(key: key) {
    onToggle = null;
    initialValue = null;
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
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
                      itemCount: themes.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (_, index) => ThemePrew(
                        theme: themes[index],
                        selected: "111",
                        onTap: (name) {
                          setTheme(name);
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
