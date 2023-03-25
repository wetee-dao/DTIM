import 'package:flutter/material.dart';
import '../../../store/theme.dart';
import '../settings_ui.dart';
import '../../../utils/screen.dart';

class Switchtile extends AbstractSettingsTile {
  final Widget? leading;
  final Widget? title;
  final Widget? description;
  Function(bool value)? onToggle;
  Widget? value;
  bool? initialValue;
  final bool enabled;
  final Widget? trailing;

  Switchtile({
    this.leading,
    this.trailing,
    this.initialValue,
    required this.title,
    this.description,
    this.onToggle,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    Color activeSwitchColor = constTheme.mentionHighlightLink;

    return IgnorePointer(
      ignoring: !enabled,
      child: InkWell(
        onTap: () {
          onToggle?.call(initialValue!);
        },
        highlightColor: constTheme.centerChannelColor.lighter(),
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
                      child: title ?? Container(),
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
                  ],
                ),
              ),
            ),
            if (trailing != null)
              Row(
                children: [
                  trailing!,
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 8.w),
                    child: Switch(
                      value: initialValue!,
                      onChanged: onToggle,
                      inactiveTrackColor: constTheme.centerChannelColor,
                      activeColor: enabled ? activeSwitchColor : constTheme.centerChannelColor.darker(2),
                    ),
                  ),
                ],
              ),
            if (trailing == null)
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
                child: Switch(
                  value: initialValue!,
                  onChanged: onToggle,
                  inactiveTrackColor: constTheme.centerChannelColor,
                  activeColor: enabled ? activeSwitchColor : constTheme.centerChannelColor.darker(2),
                ),
              )
          ],
        ),
      ),
    );
  }
}
