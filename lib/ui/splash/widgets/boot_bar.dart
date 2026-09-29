import 'package:material_ui/material_ui.dart';

import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';

class const BootBar({
  super.key,
  required final double progress,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.ink,
        borderRadius: AppDimens.borderRadiusMd,
      ),
      child: Column(
        mainAxisAlignment: .center,
        spacing: 15,
        children: [
          Padding(
            padding: .symmetric(
              horizontal: 45,
            ),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              borderRadius: .circular(3),
              backgroundColor: AppColors.white,
              color: AppColors.yellow,
            ),
          ),
          Text(
            'PREPARANDO SEU ÁLBUM',
            style: AppTextStyles.overline.copyWith(
              color: AppColors.cream,
            ),
          ),
        ],
      ),
    );
  }
}
