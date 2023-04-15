import 'dart:async';

import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/data/model/userprofile/user_profile.dart';
import 'package:meman/data/repository/auth_repository.dart';
import 'package:meman/domain/repository/i_auth_repository.dart';
import 'package:meman/presentation/screens/main/main_wrapper.dart';
import 'package:meman/presentation/widget/dialogs/app_dialogs.dart';

class AuthViewModel extends StateNotifier<UserProfile?> {
  final IAuthRepository _authRepository;

  // StreamSubscription<User?>? _authStateChangesSub;

  AuthViewModel(this._authRepository) : super(null) {
    // _authStateChangesSub?.cancel();
    // _authStateChangesSub = _authRepository.authStateChange.listen(
    //   (user) => state = user,
    // );
  }

  String? verificationId;
  int? resendToken;

  Future<void> init() async {
    final user = _authRepository.currentUser;
    print("User: $user");
    if (user != null) state = user;
  }

  Future<void> requestOtp(phoneNumber) async {
    AppDialogs.loader();
    await _authRepository.signInWithPhoneNumber(
      phoneNumber,
      onVerificationCompleted: (credentials) {},
      onCodeSent: (id, forceResendingToken) {
        verificationId = id;
        resendToken = forceResendingToken;
        Get.back();
        AppDialogs.showOtpDialog();
      },
      onError: (errorMessage) {
        Get.back();
        AppDialogs.error(errorMessage);
      },
    );
  }

  Future<void> verifyOtp(code) async {
    AppDialogs.loader();
    final response = await _authRepository.verifyPhoneWithOTP(
      code,
      verificationId!,
    );
    Get.back();

    response.fold(
      (failure) => AppDialogs.error(failure.message),
      (authId) async {
        // Try get user profile
        final userResult = await _authRepository.getUserProfile(authId);
        userResult.fold(
          (failure) => AppDialogs.error(failure.message),
          (user) async {
            if (user != null) {
              Get.offAllNamed(MainWrapper.id);
              return;
            }

            // Create user profile if not exist
            final newUser = UserProfile(
              id: authId,
              name: "anon-$authId@toli.app",
            );
            final newUserResult = await _authRepository.createUserProfile(
              newUser,
            );
            newUserResult.fold(
              (failure) => AppDialogs.error(failure.message),
              (user) async {
                Get.offAllNamed(MainWrapper.id);
              },
            );
          },
        );
      },
    );
  }

  static final provider = StateNotifierProvider<AuthViewModel, UserProfile?>((ref) {
    return AuthViewModel(ref.watch(AuthRepository.provider))..init();
  });
}
