import 'package:flutter/material.dart';

extension BeautifyStringExtension on String {
  String get beautified {
    var beautifiedStr = '';
    for (var i = 0; i < length; i++) {
      beautifiedStr += substring(i, i + 1);
      if (i % 4 == 3) {
        beautifiedStr += '  ';
      }
      if (i % 16 == 15) {
        beautifiedStr += '\n';
      }
    }
    return beautifiedStr;
  }
}

extension StringColor on String {
  static final _colorCache = <String, Map<double, Color>>{};

  Color _getColorLight(double light) {
    var number = 0.0;
    for (var i = 0; i < length; i++) {
      number += codeUnitAt(i);
    }
    number = (number % 12) * 25.5;
    return HSLColor.fromAHSL(1, number, 1, light).toColor();
  }

  Color get color {
    _colorCache[this] ??= {};
    return _colorCache[this]![0.35] ??= _getColorLight(0.35);
  }

  Color get darkColor {
    _colorCache[this] ??= {};
    return _colorCache[this]![0.2] ??= _getColorLight(0.2);
  }

  Color get lightColorText {
    _colorCache[this] ??= {};
    return _colorCache[this]![0.7] ??= _getColorLight(0.7);
  }

  Color get lightColorAvatar {
    _colorCache[this] ??= {};
    return _colorCache[this]![0.4] ??= _getColorLight(0.4);
  }
}

extension SizeString on num {
  String get sizeString {
    var size = toDouble();
    if (size < 1000000) {
      size = size / 1000;
      size = (size * 10).round() / 10;
      return '${size.toString()} KB';
    } else if (size < 1000000000) {
      size = size / 1000000;
      size = (size * 10).round() / 10;
      return '${size.toString()} MB';
    } else {
      size = size / 1000000000;
      size = (size * 10).round() / 10;
      return '${size.toString()} GB';
    }
  }

  static getSizeString(num i) {
    return i.sizeString;
  }
}
