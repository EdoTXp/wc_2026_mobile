import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_view_model.dart';

class const LoginBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(
            authRepository: context.read(),
          ),
        ),
      ],
      builder: (context, _) => screenBuilder(context),
    );
  }
}
