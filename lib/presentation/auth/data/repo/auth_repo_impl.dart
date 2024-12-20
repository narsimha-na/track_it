import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:track_it/presentation/auth/data/repo/auth_repo.dart';
import 'package:track_it/presentation/auth/data/exceptions/custom_exceptions.dart';
import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;
import 'package:track_it/presentation/auth/presentation/widgets/bottomsheets.dart';

class IAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth;
  final DatabaseReference dbRef;

  IAuthRepo({required this.firebaseAuth, required this.dbRef});

  // User(displayName: null, email: pandudtb1@gmail.com, isEmailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2024-12-11 06:12:44.077Z,
  // lastSignInTime: 2024-12-11 06:12:44.077Z), phoneNumber: null, photoURL: null, providerData,
  // [UserInfo(displayName: null, email: pandudtb1@gmail.com, phoneNumber: null, photoURL: null, providerId: password,
  //uid: pandudtb1@gmail.com)],
  //refreshToken: AMf-vBxhyl32THWUV_4h8v-ChTKZC7_tbDJhpS5cJlf3KfPu7jfUo0nDdhGWuCrQFNmFNnawsbgc9wyDSQ1q4KIR1oWV9P6K4Rhb0V01c4eHZeNS1D2ey7o-m_WUUpWXLWpaoDLMusxP56PRKxrnBEeOlG1fEJeAzMMWbA58-hjN7dqQQ_sQ3YuHS-N9cirsD3z4r113vH8F,
  //tenantId: null, uid: IzlZyUypk0avloQRUoUgtQethMx1)

  @override
  Future<userModel.User> login(
      {required SignInRequested signInRequested}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: signInRequested.email,
        password: signInRequested.password,
      );

      final DataSnapshot user =
          await dbRef.child(userCredential.user!.uid).get();

      if (user.value == null) {
        throw const ShowException("User not found");
      }

      final userMap = Map<String, dynamic>.from(user.value as Map);

      return userModel.User.fromJson(userMap);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw const ShowException("Entered Invalid email");
        case 'wrong-password':
          throw const ShowException("Wrong password");
        case 'user-not-found':
          throw const ShowException("User not found");
        case 'email-already-in-use':
          throw const ShowException("Email already in use");
        case 'weak-password':
          throw const ShowException("Weak password");
        default:
          throw const UnKnownException("Something went wrong");
      }
    }
  }

  @override
  Future<userModel.User> signUp(
      {required SignUpRequested signUpRequested}) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: signUpRequested.email,
        password: signUpRequested.password,
      )
          .then((userCredential) async {
        userModel.User user = userModel.User(
          uuid: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          photoUrl: userCredential.user!.photoURL ?? '',
          name: signUpRequested.name,
          mobileNumber: signUpRequested.mobileNumber,
          targetWeight: signUpRequested.targetWeight,
          currentWeight: signUpRequested.currentWeight,
          height: signUpRequested.height,
          gender: signUpRequested.gender,
          age: DateTime.parse(signUpRequested.age),
          password: signUpRequested.password,
          createdAt: DateTime.now(),
        );

        await dbRef
            .child(userCredential.user!.uid)
            .set(
              user.toMap(),
            )
            .catchError((error) {
          throw ShowException(error.toString());
        }).then((val) {
          return user;
        });
      });

      throw const UnKnownException("User not found");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw const ShowException("Entered Invalid email");
        case 'email-already-in-use':
          throw const ShowException("Email already in use");
        case 'weak-password':
          throw const ShowException("Weak password");
        default:
          throw const UnKnownException("Something went wrong");
      }
    }
  }

  @override
  Future<String> sendOtp({
    required String mobileNumber,
    required BuildContext context,
    required userModel.User user,
  }) async {
    final Completer<String> verificationCompleter = Completer<String>();

    try {
      String formattedNumber = mobileNumber;
      if (!mobileNumber.startsWith('+')) {
        formattedNumber = '+91$mobileNumber';
      }

      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: formattedNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          log('Verification failed: ${error.toString()}');
          throw ShowException(error.message ?? 'Phone verification failed');
        },
        codeSent: (String verificationIdVal, int? forceResendingToken) {
          verificationCompleter.complete(verificationIdVal);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
      return await verificationCompleter.future;
    } catch (e) {
      log('SendOtp error: ${e.toString()}');
      throw UnKnownException(e.toString());
    }
  }

  @override
  Future<bool> verifyOtp(
      {required String otp, required String verificationId}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      await firebaseAuth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-verification-code':
          throw const ShowException('The verification code is invalid');
        case 'network-request-failed':
          throw const ShowException(
              'Network error occurred. Please check your connection');
        case 'too-many-requests':
          throw const ShowException(
              'Too many attempts. Please try again later');
        default:
          throw const UnKnownException(
              'Something went wrong during verification');
      }
    } on Exception catch (e) {
      throw UnKnownException(e.toString());
    }
  }
}
