import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';

class IconText extends HookWidget {
  final String label;
  final IconData icon;

  const IconText({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(child: Icon(icon, size: 15, color: AppColors.muted)),
          TextSpan(text: " $label")
        ],
        style: AppTextStyles.bodyTwo.copyWith(
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
