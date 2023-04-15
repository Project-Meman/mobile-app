import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/utils/theme/app_colors.dart';
import 'package:meman/gen/assets.gen.dart';
import 'package:meman/presentation/screens/main/main_wrapper.dart';
import 'package:meman/presentation/screens/onboarding/intro_screen.dart';
import 'package:meman/presentation/viewmodel/auth_viewmodel.dart';

class SplashScreen extends HookConsumerWidget {
  static const id = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(AuthViewModel.provider);
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        if (authUser != null) {
          Get.offAllNamed(MainWrapper.id);
          return;
        }

        Get.offAllNamed(IntroScreen.id);
      });

      return;
    }, const []);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Assets.images.coloredLogoWithText.image(),
        ),
      ),
    );
  }
}
