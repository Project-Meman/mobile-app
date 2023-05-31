import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';
import 'package:meman/presentation/screens/main/main_wrapper.dart';
import 'package:meman/presentation/viewmodel/auth_viewmodel.dart';

class ConfirmPhoneScreen extends HookConsumerWidget {
  static const id = "/confirm_phone_screen";

  const ConfirmPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider.notifier);
    final size = MediaQuery.of(context).size;
    final otpController = useTextEditingController(text: "");
    final focusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Verify your phone number.",
                    style: AppTextStyles.headingOne.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enter the six (6) digits code you "
                    "received via SMS on +2335678290342 ",
                    style: AppTextStyles.bodyOne.copyWith(
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 30),
                  IntrinsicWidth(
                    child: Center(
                      child: TextField(
                        controller: otpController,
                        focusNode: focusNode,
                        textAlign: TextAlign.center,
                        autofocus: true,
                        style: AppTextStyles.headline.copyWith(
                          letterSpacing: 25,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: "******",
                          hintStyle: AppTextStyles.headline.copyWith(
                            color: AppColors.muted,
                          ),
                        ),
                        onChanged: (val) {
                          if (val.length == 6) focusNode.unfocus();
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          LengthLimitingTextInputFormatter(6),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text.rich(
                    TextSpan(
                      text: "Didn’t receive the OTP?\n\n",
                      children: [
                        TextSpan(
                          text: "Resend Code",
                          style: AppTextStyles.bodyOne.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => {},
                        ),
                      ],
                    ),
                    style: AppTextStyles.bodyOne.copyWith(
                      color: AppColors.muted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 65,
                height: 65,
                child: FloatingActionButton(
                  onPressed: () => Get.offAllNamed(MainWrapper.id),
                  child: const Icon(Icons.arrow_forward, size: 30),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
