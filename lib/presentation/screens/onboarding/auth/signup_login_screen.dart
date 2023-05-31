import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';
import 'package:meman/presentation/screens/onboarding/auth/confirm_phone_screen.dart';
import 'package:meman/presentation/viewmodel/auth_viewmodel.dart';

class SignUpLoginScreen extends HookConsumerWidget {
  static const id = "/signup_login";

  const SignUpLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider.notifier);
    final countryCode = useState("+233");
    final phone = useState("");

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
                    "What is your phone number?",
                    style: AppTextStyles.headingOne.copyWith(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "This should be an active phone number which is able to "
                    "make and receive phone calls as well as sending "
                    "and receiving text messages.",
                    style: AppTextStyles.bodyOne.copyWith(
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    onChanged: (value) => phone.value = value,
                    decoration: InputDecoration(
                      prefixIcon: CountryCodePicker(
                        textStyle: AppTextStyles.bodyOne.copyWith(
                          color: AppColors.primaryDark,
                        ),
                        onChanged: (value) =>
                            countryCode.value = value.dialCode!,
                        initialSelection: 'GH',
                        countryFilter: const ['GH', 'NG'],
                        showFlag: false,
                        showFlagDialog: true,
                        padding: EdgeInsets.zero,
                        boxDecoration: const BoxDecoration(boxShadow: []),
                        searchDecoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ),
                    ),
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
                  onPressed: () => Get.toNamed(ConfirmPhoneScreen.id),
                  child: const Icon(Icons.arrow_forward, size: 30),
                  elevation: 0,
                ),
              ),
            )
            // AppButton(
            //   text: "Yes, send me a code!",
            //   onPressed: () => authViewModel
            //       .requestOtp("${countryCode.value}${phone.value}"),
            // )
          ],
        ),
      ),
    );
  }
}
