import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_login_user_case.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_view_model.dart';

class const LoginBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthLoginUserCase(
            authRepository: context.read(),
            authSessionRepository: context.read(),
          ),
        ),

        ChangeNotifierProvider(
          create: (context) => LoginViewModel(
            sessionNotifier: context.read(),
            loginUserCase: context.read(),
          ),
        ),
      ],
      builder: (context, _) => screenBuilder(context),
    );
  }
}
