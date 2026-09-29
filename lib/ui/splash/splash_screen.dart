import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/core/shared/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/shared/licensed_badge.dart';
import 'package:wc_2026_mobile/ui/core/shared/logo_card.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/splash/widgets/boot_bar.dart';

class const SplashScreen({super.key}) extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final _boot = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 2400),
  );

  @override
  void initState() {
    super.initState();
    _boot.forward().then((_) => _exitWhenReady());
  }

  void _exitWhenReady() {
    if (!mounted || !_boot.isCompleted) return;

    context.go(Routes.welcome);
  }

  @override
  void dispose() {
    _boot.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(
            AppAssets.patterns.paniniArcSplashSvg,
            fit: .cover,
          ),
          ColoredBox(
            color: AppColors.cream.withValues(
              alpha: .35,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    LicensedBadge(),
                    SizedBox(
                      height: 40,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 290,
                        maxHeight: 380,
                      ),
                      child: LogoCard(),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      'SEU ÁLBUM',
                      style: AppTextStyles.display,
                    ),
                    Text(
                      'OFICIAL.',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 290,
                      ),
                      child: SizedBox(
                        height: 72,
                        child: AnimatedBuilder(
                          animation: _boot,
                          builder: (_, _) {
                            return BootBar(progress: _boot.value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'V1.0.0  •  FIFA WORLD CUP 26™',
                style: AppTextStyles.overline,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
