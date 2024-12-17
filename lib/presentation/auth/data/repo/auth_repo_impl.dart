import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:track_it/presentation/auth/data/repo/auth_repo.dart';
import 'package:track_it/presentation/auth/data/exceptions/custom_exceptions.dart';
import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';
import 'package:track_it/presentation/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;

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
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: signInRequested.email,
        password: signInRequested.password,
      )
          .then((userCredential) {
        dbRef
            .child(userCredential.user!.uid)
            .get()
            .then((DataSnapshot user) async {
          if (user.value == null) {
            throw ShowException(
                "User not found ${userCredential.toString()} ${user.value.toString()}");
          }
          final userMap = Map<String, dynamic>.from(user.value as Map);
          return userModel.User.fromJson(userMap);
        });
      }).catchError((error) {
        log('error: $error');
        throw ShowException(error.toString());
      });
      throw const UnKnownException("Something went wrong !");
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
      log('Entered signUp: ');
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: signUpRequested.email,
        password: signUpRequested.password,
      )
          .then((userCredential) async {
        log('user auth signUp: ${userCredential.user!.uid}');
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
}
