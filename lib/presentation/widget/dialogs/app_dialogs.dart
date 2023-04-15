import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meman/presentation/widget/dialogs/views/otp_dialog_view.dart';

class AppDialogs {
  static Future<dynamic> showOtpDialog() async {
    return Get.bottomSheet(
      Wrap(
        children: const [OTPDialogView()],
      ),
    );
  }

  static loader({String message = "Please wait..."}) => Get.dialog(
        AlertDialog(
          content: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 10),
              Text(message),
            ],
          ),
        ),
      );

  static error(String message) => Get.dialog(
        AlertDialog(content: Text(message)),
      );

  static success(String message) => Get.dialog(
        AlertDialog(content: Text(message)),
      );
}
