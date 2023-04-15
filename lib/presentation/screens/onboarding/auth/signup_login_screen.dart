import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/presentation/viewmodel/auth_viewmodel.dart';
import 'package:meman/presentation/widget/buttons/rounded_button.dart';

class SignUpLoginScreen extends HookConsumerWidget {
  static const id = "/signup_login";

  const SignUpLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthViewModel.provider.notifier);
    final countryCode = useState("+233");
    final phone = useState("");

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "What's your number?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Don't worry, we will know if you are already in the community.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    onChanged: (value) => phone.value = value,
                    decoration: InputDecoration(
                      prefixIcon: CountryCodePicker(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        // onInit: (value) => countryCode.value = value!.code!,
                        onChanged: (value) =>
                            countryCode.value = value.dialCode!,
                        initialSelection: 'GH',
                        countryFilter: const ['GH', 'NG'],
                        showFlag: false,
                        showFlagDialog: true,
                        padding: EdgeInsets.zero,
                        closeIcon: const Icon(Icons.close, color: Colors.white),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "A six(6) digits code will be sent to the phone number you have entered.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: "Yes, send me a code!",
                  onPressed: () => authViewModel
                      .requestOtp("${countryCode.value}${phone.value}"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
