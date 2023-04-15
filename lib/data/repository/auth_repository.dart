import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/core_providers.dart';
import 'package:meman/data/datasource/local/auth_local_data_source.dart';
import 'package:meman/data/model/userprofile/user_profile.dart';
import 'package:meman/domain/error/failure.dart';
import 'package:meman/domain/repository/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepository(
    this._firebaseAuth,
    this._firestore,
    this._authLocalDataSource,
  );

  @override
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  @override
  UserProfile? get currentUser => _authLocalDataSource.getUserProfile();

  @override
  Future<void> signInWithPhoneNumber(
    String phoneNumber, {
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(String, int?) onCodeSent,
    required Function(String) onError,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: onVerificationCompleted,
        verificationFailed: (error){
          debugPrint("Verification failed: $error ====  ${error.stackTrace} ");
          onError("${error.message}");
        },
        codeSent: onCodeSent,
        codeAutoRetrievalTimeout: (_) {},
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException, $e");
      onError("Authentication failed, please try again!");
    } catch (e) {
      debugPrint("Exception, $e");
      onError("An unexpected error occurred!");
    }
  }

  @override
  Future<Either<Failure, String>> verifyPhoneWithOTP(
    String code,
    String verificationId,
  ) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );
      final response = await _firebaseAuth.signInWithCredential(credential);
      return Right("${response.user?.uid}");
    } on FirebaseAuthException catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("Authentication failed, please try again!"));
    } catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("An unexpected error occurred!"));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> createUserProfile(
      UserProfile userProfile) async {
    try {
      await _firestore
          .collection("users")
          .doc(userProfile.id)
          .set(userProfile.toJson());

      _authLocalDataSource.saveUserProfile(userProfile);

      return Right(userProfile);
    } catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("An unexpected error occurred!"));
    }
  }

  @override
  Future<Either<Failure, UserProfile?>> getUserProfile(String id) async {
    try {
      final snapshot = await _firestore.collection("users").doc(id).get();
      if (snapshot.exists) return Right(UserProfile.fromJson(snapshot.data()!));

      return const Right(null);
    } catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("An unexpected error occurred!"));
    }
  }

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right("Sign out successful");
    } on FirebaseAuthException catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("Failed signing out, please try again!"));
    } catch (e) {
      debugPrint("Exception, $e");
      return Left(Failure("An unexpected error occurred!"));
    }
  }

  static final provider = Provider(
    (ref) => AuthRepository(
      ref.watch(firebaseAuthProvider),
      ref.watch(firestoreProvider),
      ref.watch(AuthLocalDataSource.provider),
    ),
  );
}
