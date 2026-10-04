import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';

class const StickerActionButton({
  super.key,
  required final String label,
  required final IconData icon,
  required final VoidCallback? onPressed,
  final ButtonStyle? style,
  final double discSize = 24,
}) extends StatelessWidget {
  final enabled = onPressed != null;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(width: discSize),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: AppTextStyles.bodyBold,
              ),
            ),
          ),
          CircleAvatar(
            radius: discSize / 2,
            backgroundColor: enabled ? AppColors.ink : AppColors.borderStrong,
            child: Icon(
              icon,
              size: 14,
              color: enabled ? AppColors.yellow : AppColors.grayText,
            ),
          ),
        ],
      ),
    );
  }
}
