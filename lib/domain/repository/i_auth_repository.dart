import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meman/data/model/userprofile/user_profile.dart';
import 'package:meman/domain/error/failure.dart';

abstract class IAuthRepository {
  UserProfile? get currentUser;

  Stream<User?> get authStateChange;

  Future<void> signInWithPhoneNumber(
    String phoneNumber, {
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(String, int?) onCodeSent,
    required Function(String) onError,
  });

  Future<Either<Failure, String>> verifyPhoneWithOTP(
    String code,
    String verificationId,
  );

  Future<Either<Failure, UserProfile?>> getUserProfile(String id);

  Future<Either<Failure, UserProfile>> createUserProfile(
      UserProfile userProfile);

  Future<Either<Failure, String>> signOut();
}
