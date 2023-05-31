import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/res/app_colors.dart';

class AppButton extends HookWidget {
  final String text;
  final Function() onPressed;

  const AppButton({Key? key, required this.text, required this.onPressed,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryDark,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}