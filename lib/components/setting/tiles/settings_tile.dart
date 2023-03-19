import 'package:flutter/material.dart';
import 'package:themed/themed.dart';
import '../../../store/theme.dart';
import '../settings_ui.dart';
import '../../../utils/screen.dart';

enum SettingsTileType { simpleTile, switchTile, navigationTile }

class SettingsTile extends AbstractSettingsTile {
  SettingsTile({
    required this.tileType,
    required this.leading,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.onToggle,
    required this.value,
    required this.initialValue,
    required this.activeSwitchColor,
    required this.enabled,
    required this.trailing,
    Key? key,
  }) : super(key: key) {}

  SettingsTileType tileType = SettingsTileType.simpleTile;
  final Widget? leading;
  final Widget? title;
  final Widget? description;
  final Function(BuildContext context)? onPressed;
  Function(bool value)? onToggle;
  Widget? value;
  bool? initialValue;
  final bool enabled;
  Color? activeSwitchColor;
  final Widget? trailing;

  SettingsTile.navigation({
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
    activeSwitchColor = null;
    tileType = SettingsTileType.navigationTile;
  }

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;

    final cantShowAnimation =
        tileType == SettingsTileType.switchTile ? onToggle == null && onPressed == null : onPressed == null;

    return IgnorePointer(
      ignoring: !enabled,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: cantShowAnimation
              ? null
              : () {
                  if (tileType == SettingsTileType.switchTile) {
                    onToggle?.call(initialValue!);
                  } else {
                    onPressed?.call(context);
                  }
                },
          highlightColor: ConstTheme.centerChannelColor.lighter(),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24),
                  child: IconTheme(
                    data: IconTheme.of(context).copyWith(
                      color: enabled ? ConstTheme.centerChannelColor : ConstTheme.centerChannelColor.darker(2),
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
                          color: enabled ? ConstTheme.centerChannelColor : ConstTheme.centerChannelColor.darker(2),
                          fontSize: 13.w,
                          fontWeight: FontWeight.w400,
                        ),
                        child: title ?? Container(),
                      ),
                      if (value != null)
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: enabled ? ConstTheme.centerChannelColor : ConstTheme.centerChannelColor.darker(2),
                            ),
                            child: value!,
                          ),
                        )
                      else if (description != null)
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: enabled ? ConstTheme.centerChannelColor : ConstTheme.centerChannelColor.darker(2),
                            ),
                            child: description!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (trailing != null && tileType == SettingsTileType.switchTile)
                Row(
                  children: [
                    trailing!,
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: Switch(
                        value: initialValue!,
                        onChanged: onToggle,
                        activeColor: enabled ? activeSwitchColor : ConstTheme.centerChannelColor.darker(2),
                      ),
                    ),
                  ],
                )
              else if (tileType == SettingsTileType.switchTile)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
                  child: Switch(
                    value: initialValue!,
                    onChanged: onToggle,
                    activeColor: enabled ? activeSwitchColor : ConstTheme.centerChannelColor.darker(2),
                  ),
                )
              else if (trailing != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: trailing!,
                )
            ],
          ),
        ),
      ),
    );
  }

  static switchTile(
      {required bool initialValue,
      required Null Function(dynamic _) onToggle,
      required Text title,
      required Text description}) {}
}
