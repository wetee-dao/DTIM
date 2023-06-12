import 'package:flutter/material.dart';
import 'abstract_settings_tile.dart';

class CustomSettingsTile extends AbstractSettingsTile {
  const CustomSettingsTile({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
