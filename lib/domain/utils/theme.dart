import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/router.dart';

loadThemeFromOrg(org) async {
  // 设置全局设置
  if (org.theme != null && org.theme!.isNotEmpty) {
    print("loadThemeFromOrg ${org.theme}");
    final t = await setTheme(org.theme!);
    AdaptiveTheme.of(globalCtx()).setTheme(
      light: t,
    );
  } else {
    final t = await getDefaultTheme();
    AdaptiveTheme.of(globalCtx()).setTheme(
      light: t,
    );
  }
}
