import 'package:material_ui/material_ui.dart';

import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const RepeatedStrip({
  super.key,
  required final int count,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repeatedText = count != 1 ? 'REPETIDAS' : 'REPETIDA';

    return Material(
      child: ListTile(
        onTap: onTap,
        tileColor: AppColors.ink,
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimens.borderRadiusMd,
        ),
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.yellow.withValues(alpha: .18),
          child: Icon(
            Icons.swap_horiz_rounded,
            size: 18,
            color: AppColors.yellow,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_rounded,
          size: 18,
          color: AppColors.yellow,
        ),
        title: Text('$count $repeatedText'),
        titleTextStyle: AppTextStyles.subhead.copyWith(
          color: AppColors.white,
        ),
        subtitle: Text('Toque para trocar com amigos'),
        subtitleTextStyle: AppTextStyles.footnote.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
