import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/routing/router.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

void main() {
  runApp(MainApp());
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      builder: (context, child) {
        // ignore: deprecated_member_use
        return MaterialUiCompatibilityBridge(child: child!);
      },
      routerConfig: router(),
    );
  }
}
