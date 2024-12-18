import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_it/core/cosntants.dart';
import 'package:track_it/core/validators/form_validators.dart';
import 'package:track_it/presentation/auth/data/data_provider/auth_db.dart';
import 'package:track_it/presentation/auth/data/exceptions/custom_exceptions.dart';
import 'package:track_it/presentation/auth/data/repo/auth_repo_impl.dart';
import 'package:track_it/presentation/auth/data/models/signin_requested.dart';
import 'package:track_it/presentation/auth/data/models/singup_requested.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:track_it/presentation/auth/data/models/user.dart' as userModel;
import 'package:track_it/presentation/auth/presentation/widgets/bottomsheets.dart';
import 'package:track_it/presentation/widget/general_widgets.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({
    required this.authRepo,
    required this.authDb,
  }) : super(AuthCubitInitial());

  final IAuthRepo authRepo;
  final AuthDb authDb;

  String gender = '';
  String dob = "";
  ConfirmationResult? verificationId;

  Future<void> login({
    required SignInRequested signInRequested,
    required BuildContext context,
  }) async {
    emit(const AuthCubitLoading(message: 'Logging in...'));
    try {
      if (!_isLoginFormValid(signInRequested: signInRequested)) {
        emit(const AuthCubitFailure(message: ''));
      } else {
        final userModel.User user =
            await authRepo.login(signInRequested: signInRequested);

        await authRepo.sendOtp(
          mobileNumber: user.mobileNumber.toString(),
          context: context,
          user: user,
        );
        // authDb.storeUserDetails(user);
      }
    } catch (e) {
      log('error: $e');
      emit(AuthCubitFailure(message: e.toString()));
    }
  }

  Future<void> signUp({required SignUpRequested signUpRequested}) async {
    emit(const AuthCubitLoading(message: 'Signing up...'));
    try {
      if (!_isSignUpFormValid(signUpRequested: signUpRequested)) {
        emit(const AuthCubitFailure(message: ''));
      } else {
        await authRepo.signUp(signUpRequested: signUpRequested);
      }
    } catch (e) {
      if (e is ShowException) {
        GeneralWidgets.toast(e.message);
      } else {
        GeneralWidgets.toast("Somthing went wrong, try again");
      }
      emit(AuthCubitFailure(message: e.toString()));
    }
  }

  Future<void> verifyOtp(
      {required String otp, required String verificationId}) async {
    if (otp.length != 4) {
      emit(const AuthCubitFailure(message: 'Please enter a valid OTP'));
    } else {
      try {
        await authRepo
            .verifyOtp(otp: otp, verificationId: verificationId)
            .then((val) {
          emit(AuthCubitSuccess(message: 'OTP verified successfully'));
        });
      } catch (e) {
        emit(AuthCubitFailure(message: e.toString()));
      }
    }
  }

  void setGender(String gender) {
    this.gender = gender;
  }

  void setDob(DateTime dob) {
    this.dob = dob.toString();
  }

  bool _isSignUpFormValid({required SignUpRequested signUpRequested}) {
    return FormValidators.isEmailValid(signUpRequested.email) &&
        FormValidators.isPasswordValid(signUpRequested.password) &&
        FormValidators.isNameValid(signUpRequested.name) &&
        FormValidators.isMobileNumberValid(
            signUpRequested.mobileNumber.toString()) &&
        FormValidators.isWeightValid(signUpRequested.targetWeight) &&
        FormValidators.isWeightValid(signUpRequested.currentWeight) &&
        FormValidators.isHeightValid(signUpRequested.height) &&
        FormValidators.isGenderValid(signUpRequested.gender) &&
        FormValidators.isDobValid(signUpRequested.age);
  }

  bool _isLoginFormValid({required SignInRequested signInRequested}) {
    return FormValidators.isEmailValid(signInRequested.email) &&
        FormValidators.isPasswordValid(signInRequested.password);
  }
}
