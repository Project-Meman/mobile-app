import 'package:get/get.dart';
import 'package:meman/presentation/screens/main/home/places/place_details_screen.dart';
import 'package:meman/presentation/screens/main/main_wrapper.dart';
import 'package:meman/presentation/screens/onboarding/auth/confirm_phone_screen.dart';
import 'package:meman/presentation/screens/onboarding/auth/signup_login_screen.dart';
import 'package:meman/presentation/screens/onboarding/intro_screen.dart';
import 'package:meman/presentation/screens/onboarding/splash_screen.dart';

class BaseRouting {
  static String get defaultRoute => pages.first.name;

  static List<GetPage> get pages => [
        GetPage(
          name: SplashScreen.id,
          page: () => const SplashScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: IntroScreen.id,
          page: () => const IntroScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: SignUpLoginScreen.id,
          page: () => const SignUpLoginScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: ConfirmPhoneScreen.id,
          page: () => const ConfirmPhoneScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: MainWrapper.id,
          page: () => const MainWrapper(),
          children: [
            GetPage(
              name: PlaceDetailsScreen.id,
              page: () => const PlaceDetailsScreen(),
            ),
          ],
        ),
      ];
}
