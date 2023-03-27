import 'dart:async';

import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
// import 'package:themed/themed.dart';

import '../apis/apis.dart';

// 主题列表
const themes = [
  {
    //0
    "type": 'light',
    "sidebarBg": "#2f2c2f",
    "sidebarText": "#dedede",
    "sidebarUnreadText": "#dedede",
    "sidebarTextHoverBg": "#5c6380",
    "sidebarTextActiveBorder": "#a36b31",
    "sidebarTextActiveColor": "#d2d6d6",
    "sidebarHeaderBg": "#252525",
    "sidebarHeaderTextColor": "#dedede",
    "onlineIndicator": "#adba4e",
    "mentionBg": "#db6668",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Afterglow",
    "sidebarOrgBarBg": "#1d1d1d"
  },
  {
    // 1
    "type": 'light',
    "sidebarBg": "#cf7c44",
    "sidebarText": "#fffafc",
    "sidebarUnreadText": "#fffafc",
    "sidebarTextHoverBg": "#fbedd4",
    "sidebarTextActiveBorder": "#e89a6b",
    "sidebarTextActiveColor": "#f7db72",
    "sidebarHeaderBg": "#c46524",
    "sidebarHeaderTextColor": "#fffafc",
    "onlineIndicator": "#92406a",
    "mentionBg": "#92406a",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Bourbon",
    "sidebarOrgBarBg": "#a56336"
  },
  {
    // 2
    "type": 'light',
    "sidebarBg": "#4f2f4c",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#3e313c",
    "sidebarTextActiveBorder": "#8c5888",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#452842",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#00ffb7",
    "mentionBg": "#de4c0d",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Brinjal",
    "sidebarOrgBarBg": "#372034"
  },
  {
    // 3
    "type": 'light',
    "sidebarBg": "#014a83",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#053354",
    "sidebarTextActiveBorder": "#dd661e",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#053354",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#dd661e",
    "mentionBg": "#dd661e",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Blue",
    "sidebarOrgBarBg": "#042843"
  },
  {
    // 4
    "type": 'light',
    "sidebarBg": "#751c01",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#ad2a02",
    "sidebarTextActiveBorder": "#ffffff",
    "sidebarTextActiveColor": "#751c01",
    "sidebarHeaderBg": "#5c1500",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#ffffff",
    "mentionBg": "#ad2a02",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Red",
    "sidebarOrgBarBg": "#491000"
  },
  {
    //5
    "type": "light",
    "sidebarBg": "#245b61",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#b0c1c4",
    "sidebarTextActiveBorder": "#72d4c0",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#1c484d",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#bef200",
    "mentionBg": "#f15340",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Thoroughcare",
    "sidebarOrgBarBg": "#1c484d"
  },
  {
    //6
    "type": "light",
    "sidebarBg": "#fdf6e3",
    "sidebarText": "#837e65",
    "sidebarUnreadText": "#657b83",
    "sidebarTextHoverBg": "#eee8d5",
    "sidebarTextActiveBorder": "#d3cdb9",
    "sidebarTextActiveColor": "#fdf6e3",
    "sidebarHeaderBg": "#eee8d5",
    "sidebarHeaderTextColor": "#838165",
    "onlineIndicator": "#2aa198",
    "mentionBg": "#dc322f",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#fffff9",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Solarized",
    "sidebarOrgBarBg": "#eee8d5"
  },
  {
    //7
    "type": "light",
    "sidebarBg": "#86a34e",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#94af63",
    "sidebarTextActiveBorder": "#ffffff",
    "sidebarTextActiveColor": "#6d8b42",
    "sidebarHeaderBg": "#94af63",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#ffb10a",
    "mentionBg": "#dfa044",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "JuiceBar",
    "sidebarOrgBarBg": "#768c4f"
  },
  {
    //8
    "type": "light",
    "sidebarBg": "#003554",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#006494",
    "sidebarTextActiveBorder": "#006494",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#073c57",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#00a6fb",
    "mentionBg": "#eb4d5c",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "SQOOL",
    "sidebarOrgBarBg": "#053045"
  },
  {
    //9
    "type": 'light',
    "sidebarBg": "#544538",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#4a3c30",
    "sidebarTextActiveBorder": "#5db09d",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#42362b",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#ffffff",
    "mentionBg": "#5db09d",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Choco Mint",
    "sidebarOrgBarBg": "#342b22"
  },
  {
    //10
    "type": 'light',
    "sidebarBg": "#373d48",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#4a5664",
    "sidebarTextActiveBorder": "#5294e2",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#303641",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#5294e2",
    "mentionBg": "#5294e2",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "quartz",
    "sidebarOrgBarBg": "#262b34",
  },
  {
    //11
    "type": 'light',
    "sidebarBg": "#fafafa",
    "sidebarText": "#564f4d",
    "sidebarUnreadText": "#564f4d",
    "sidebarTextHoverBg": "#ededed",
    "sidebarTextActiveBorder": "#e7412a",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#f3f3f3",
    "sidebarHeaderTextColor": "#564f4d",
    "onlineIndicator": "#8da600",
    "mentionBg": "#0ea7b5",
    "awayIndicator": "#ffbc1f",
    "dndIndicator": "#d24b4e",
    "mentionBj": "#ffffff",
    "mentionColor": "#1e325c",
    "centerChannelBg": "#ffffff",
    "centerChannelColor": "#3f4350",
    "newMessageSeparator": "#cc8f00",
    "linkColor": "#386fe5",
    "buttonBg": "#1c58d9",
    "buttonColor": "#ffffff",
    "errorTextColor": "#d24b4e",
    "mentionHighlightBg": "#ffd470",
    "mentionHighlightLink": "#1b1d22",
    "codeTheme": "Dolly Light",
    "sidebarOrgBarBg": "#c2c2c2"
  },
  {
    //12
    "type": 'dark',
    "awayIndicator": "#E0B333",
    "buttonBg": "#859900",
    "buttonColor": "#fdf6e3",
    "centerChannelBg": "#0e4351",
    "centerChannelColor": "#93a1a1",
    "codeTheme": "Solarized Dark Theme",
    "linkColor": "#268bd2",
    "mentionBg": "#dc322f",
    "mentionColor": "#ffffff",
    "mentionHighlightBg": "#d33682",
    "mentionHighlightLink": "#268bd2",
    "newMessageSeparator": "#cb4b16",
    "onlineIndicator": "#2AA198",
    "sidebarBg": "#073642",
    "sidebarHeaderBg": "#002B36",
    "sidebarHeaderTextColor": "#FDF6E3",
    "sidebarText": "#FDF6E3",
    "sidebarTextActiveBorder": "#d33682",
    "sidebarTextActiveColor": "#FDF6E3",
    "sidebarTextHoverBg": "#CB4B16",
    "sidebarUnreadText": "#FDF6E3",
    "errorTextColor": "#dc322f",
    "dndIndicator": "#be5046",
  },
  {
    //13
    "type": "dark",
    "awayIndicator": "#fabd2f",
    "buttonBg": "#689d6a",
    "buttonColor": "#ebdbb2",
    "centerChannelBg": "#3c3836",
    "centerChannelColor": "#ebdbb2",
    "errorTextColor": "#fb4934",
    "linkColor": "#83a598",
    "mentionBg": "#b16286",
    "mentionColor": "#fbf1c7",
    "mentionHighlightBg": "#d65d0e",
    "mentionHighlightLink": "#fbf1c7",
    "newMessageSeparator": "#d65d0e",
    "onlineIndicator": "#b8bb26",
    "dndIndicator": "#be5046",
    "sidebarBg": "#282828",
    "sidebarHeaderBg": "#1d2021",
    "sidebarHeaderTextColor": "#ebdbb2",
    "sidebarText": "#ebdbb2",
    "sidebarTextActiveBorder": "#d65d0e",
    "sidebarTextActiveColor": "#fbf1c7",
    "sidebarTextHoverBg": "#d65d0e",
    "sidebarUnreadText": "#fe8019",
    "codeTheme": "Gruvbox Dark Theme",
  },
  {
    //14
    "type": "dark",
    "sidebarBg": "#21252b",
    "sidebarText": "#abb2bf",
    "sidebarUnreadText": "#abb2bf",
    "sidebarTextHoverBg": "#3a3f4b",
    "sidebarTextActiveBorder": "#4d78cc",
    "sidebarTextActiveColor": "#d7dae0",
    "sidebarHeaderBg": "#1c1f24",
    "sidebarHeaderTextColor": "#abb2bf",
    "onlineIndicator": "#98c379",
    "awayIndicator": "#d19a66",
    "dndIndicator": "#be5046",
    "mentionBg": "#98c379",
    "mentionColor": "#ffffff",
    "centerChannelBg": "#282c34",
    "centerChannelColor": "#abb2bf",
    "newMessageSeparator": "#c67add",
    "linkColor": "#61afef",
    "buttonBg": "#4d78cc",
    "buttonColor": "#ffffff",
    "errorTextColor": "#f44747",
    "mentionHighlightBg": "#525a69",
    "mentionHighlightLink": "#61afef",
    "codeTheme": "One Dark Theme"
  },
  {
    //15
    "type": "dark",
    "sidebarBg": "#2f3136",
    "sidebarText": "#ffffff",
    "sidebarUnreadText": "#ffffff",
    "sidebarTextHoverBg": "#33363c",
    "sidebarTextActiveBorder": "#66cfa0",
    "sidebarTextActiveColor": "#ffffff",
    "sidebarHeaderBg": "#27292c",
    "sidebarHeaderTextColor": "#ffffff",
    "onlineIndicator": "#43b581",
    "awayIndicator": "#faa61a",
    "dndIndicator": "#f04747",
    "mentionBg": "#6e84d2",
    "mentionColor": "#ffffff",
    "centerChannelBg": "#36393f",
    "centerChannelColor": "#dddddd",
    "newMessageSeparator": "#6e84d2",
    "linkColor": "#2095e8",
    "buttonBg": "#43b581",
    "buttonColor": "#ffffff",
    "errorTextColor": "#ff6461",
    "mentionHighlightBg": "#3d414f",
    "mentionHighlightLink": "#6e84d2",
    "codeTheme": "Discord Dark Theme"
  },
  {
    //16
    "type": "dark",
    "sidebarBg": "#011627",
    "sidebarText": "#d6deeb",
    "sidebarUnreadText": "#d6deeb",
    "sidebarTextHoverBg": "#1d3b53",
    "sidebarTextActiveBorder": "#ff2c83",
    "sidebarTextActiveColor": "#82aaff",
    "sidebarHeaderBg": "#011220",
    "sidebarHeaderTextColor": "#d6deeb",
    "onlineIndicator": "#addb67",
    "awayIndicator": "#ffbc42",
    "dndIndicator": "#f74343",
    "mentionBg": "#d6deeb",
    "mentionColor": "#145dbf",
    "centerChannelBg": "#05192b",
    "centerChannelColor": "#d6deeb",
    "newMessageSeparator": "#ff8800",
    "linkColor": "#2389d7",
    "buttonBg": "#166de0",
    "buttonColor": "#011627",
    "errorTextColor": "#fd5960",
    "mentionHighlightBg": "#0b2942",
    "mentionHighlightLink": "#82aaff",
    "codeTheme": "Night Owl Dark Theme",
  },
];

int currentTheme = 16;

ThemeData setTheme(String name) {
  currentTheme = themes.indexWhere((t) => t["codeTheme"] == name);

  SystemApi.create().saveTheme(name);
  return theme();
}

ThemeData theme() {
  final t = themes[currentTheme];

  return ThemeData(
    useMaterial3: true,
    brightness: t["type"] != null && t["type"] == "dark" ? Brightness.dark : Brightness.light,

    // colorScheme: const ColorScheme.light().copyWith(
    //   brightness: t["type"] != null && t["type"] == "dark" ? Brightness.dark : Brightness.light,
    //   primary: hexToColor(t["centerChannelColor,"]!),
    //   secondary: hexToColor(t["centerChannelColor"]!).withAlpha(155),
    //   error: hexToColor(t["errorTextColor"]!),
    //   background: hexToColor(t["centerChannelBg"]!),
    // ),
    // dialogTheme: DialogTheme(
    //   backgroundColor: hexToColor(t["sidebarBg"]!),
    //   titleTextStyle: TextStyle(color: hexToColor(t["sidebarText"]!), fontSize: 16.w),
    //   contentTextStyle: TextStyle(color: hexToColor(t["sidebarText"]!), fontSize: 13.w),
    //   surfaceTintColor: Colors.transparent,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(3.w),
    //   ),
    // ),
    // textTheme: TextTheme(
    //   titleMedium: TextStyle(color: hexToColor(t["centerChannelColor)"]!)),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   labelStyle: TextStyle(height: 1.5, color: hexToColor(t["centerChannelColor)"]!)),
    //   hintStyle: TextStyle(height: 1.5, color: hexToColor(t["centerChannelColor)"]!)),
    // ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: hexToColor(t["sidebarHeaderBg"]!),
    //   foregroundColor: hexToColor(t["sidebarHeaderTextColor"]!),
    // ),
    extensions: [getExtTheme(currentTheme)],
  );
}

ExtColors getExtTheme(i) {
  final t = themes[i];
  return ExtColors(
    sidebarBg: hexToColor(t["sidebarBg"]!),
    sidebarText: hexToColor(t["sidebarText"]!),
    sidebarUnreadText: hexToColor(t["sidebarUnreadText"]!),
    sidebarTextHoverBg: hexToColor(t["sidebarTextHoverBg"]!),
    sidebarTextActiveBorder: hexToColor(t["sidebarTextActiveBorder"]!),
    sidebarTextActiveColor: hexToColor(t["sidebarTextActiveColor"]!),
    sidebarHeaderBg: hexToColor(t["sidebarHeaderBg"]!),
    sidebarHeaderTextColor: hexToColor(t["sidebarHeaderTextColor"]!),
    onlineIndicator: hexToColor(t["onlineIndicator"]!),
    awayIndicator: hexToColor(t["awayIndicator"]!),
    dndIndicator: hexToColor(t["dndIndicator"]!),
    mentionBg: hexToColor(t["mentionBg"]!),
    mentionColor: hexToColor(t["mentionColor"]!),
    centerChannelBg: hexToColor(t["centerChannelBg"]!),
    centerChannelColor: hexToColor(t["centerChannelColor"]!),
    newMessageSeparator: hexToColor(t["newMessageSeparator"]!),
    linkColor: hexToColor(t["linkColor"]!),
    buttonBg: hexToColor(t["buttonBg"]!),
    buttonColor: hexToColor(t["buttonColor"]!),
    errorTextColor: hexToColor(t["errorTextColor"]!),
    mentionHighlightBg: hexToColor(t["mentionHighlightBg"]!),
    mentionHighlightLink: hexToColor(t["mentionHighlightLink"]!),
  );
}

setThemeIndex(String name) {
  if (name == "") {
    return;
  }
  final index = themes.indexWhere((t) => t["codeTheme"] == name);
  currentTheme = index;
}

Color hexToColor(String code) {
  Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

@immutable
class ExtColors extends ThemeExtension<ExtColors> {
  final Color sidebarBg;
  final Color sidebarText;
  final Color sidebarUnreadText;
  final Color sidebarTextHoverBg;
  final Color sidebarTextActiveBorder;
  final Color sidebarTextActiveColor;
  final Color sidebarHeaderBg;
  final Color sidebarHeaderTextColor;
  final Color onlineIndicator;
  final Color awayIndicator;
  final Color dndIndicator;
  final Color mentionBg;
  final Color mentionColor;
  final Color centerChannelBg;
  final Color centerChannelColor;
  final Color newMessageSeparator;
  final Color linkColor;
  final Color buttonBg;
  final Color buttonColor;
  final Color errorTextColor;
  final Color mentionHighlightBg;
  final Color mentionHighlightLink;
  // final bool dark = themes[currentTheme]["type"] != null && themes[currentTheme]["type"] == "dark";

  const ExtColors({
    required this.sidebarBg,
    required this.sidebarText,
    required this.sidebarUnreadText,
    required this.sidebarTextHoverBg,
    required this.sidebarTextActiveBorder,
    required this.sidebarTextActiveColor,
    required this.sidebarHeaderBg,
    required this.sidebarHeaderTextColor,
    required this.onlineIndicator,
    required this.awayIndicator,
    required this.dndIndicator,
    required this.mentionBg,
    required this.mentionColor,
    required this.centerChannelBg,
    required this.centerChannelColor,
    required this.newMessageSeparator,
    required this.linkColor,
    required this.buttonBg,
    required this.buttonColor,
    required this.errorTextColor,
    required this.mentionHighlightBg,
    required this.mentionHighlightLink,
  });

  @override
  ExtColors copyWith() {
    // 补充默认值
    return this;
  }

  @override
  ExtColors lerp(ThemeExtension<ExtColors>? other, double t) {
    if (other is! ExtColors) {
      return this;
    }
    return this;
  }
}
