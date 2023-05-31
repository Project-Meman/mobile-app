import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';
import 'package:meman/gen/assets.gen.dart';
import 'package:meman/presentation/screens/onboarding/auth/signup_login_screen.dart';
import 'package:meman/presentation/widget/buttons/rounded_button.dart';

class IntroScreen extends HookWidget {
  static const id = "/intro";

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.introBg.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height / 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.3),
                    Colors.black.withOpacity(.5),
                    Colors.black.withOpacity(.8),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Explore",
                        style: AppTextStyles.headline
                            .copyWith(color: AppColors.light),
                      ),
                      Text(
                        "and discover new places.",
                        style: AppTextStyles.headline.copyWith(
                          color: AppColors.primaryLight,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Discover places you never knew existed. "
                        "Just sit tight as we bring you closer to your dream vacation.",
                        style: AppTextStyles.bodyOne
                            .copyWith(color: AppColors.light),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                AppButton(
                  text: "Get Started",
                  onPressed: () => Get.toNamed(SignUpLoginScreen.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
