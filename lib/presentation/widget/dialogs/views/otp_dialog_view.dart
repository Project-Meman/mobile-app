import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/presentation/viewmodel/auth_viewmodel.dart';
import 'package:meman/presentation/widget/buttons/rounded_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPDialogView extends HookConsumerWidget {
  const OTPDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider.notifier);
    final size = MediaQuery.of(context).size;
    final otp = useState("");

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade800)
      ),
      width: size.width,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Verify your phone number.",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Heya, you're almost there, enter the six(6) digit code you received via SMS.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          OTPTextField(
            length: 6,
            width: size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 50,
            fieldStyle: FieldStyle.box,
            otpFieldStyle: OtpFieldStyle(
              borderColor: Colors.white24,
              enabledBorderColor: Colors.white24,
              focusBorderColor: Colors.white24,
            ),
            outlineBorderRadius: 10,
            style: const TextStyle(fontSize: 25),
            contentPadding: const EdgeInsets.all(10),
            onChanged: (code) => otp.value = code,
            onCompleted: print,
          ),
          const SizedBox(height: 50),
          AppButton(
            text: "Verify me",
            onPressed: () => authViewModel.verifyOtp(otp.value),
          ),
        ],
      ),
    );
  }
}
