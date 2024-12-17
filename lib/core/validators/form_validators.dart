import 'package:track_it/presentation/widget/general_widgets.dart';

class FormValidators {
  static bool isEmailValid(String email) {
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      GeneralWidgets.toast('Please enter a valid email');
      return false;
    } else if (email.isEmpty) {
      GeneralWidgets.toast('Please enter a email');
      return false;
    }
    return true;
  }

  static bool isPasswordValid(String password) {
    if (password.length < 8) {
      GeneralWidgets.toast('Password must be at least 8 characters');
      return false;
    }
    return true;
  }

  static bool isNameValid(String name) {
    if (name.isEmpty) {
      GeneralWidgets.toast('Please enter your name');
      return false;
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      GeneralWidgets.toast('Please enter a valid name');
      return false;
    }
    return true;
  }

  static bool isMobileNumberValid(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      GeneralWidgets.toast('Please enter your mobile number');
      return false;
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      GeneralWidgets.toast('Please enter a valid mobile number');
      return false;
    }
    return true;
  }

  static bool isWeightValid(num weight) {
    if (weight <= 0 || weight > 300) {
      GeneralWidgets.toast('Please enter a valid weight');
      return false;
    }
    return true;
  }

  static bool isHeightValid(num height) {
    if (height <= 3.0 || height > 20) {
      GeneralWidgets.toast('Please enter a valid height');
      return false;
    }
    return true;
  }

  static bool isGenderValid(String gender) {
    if (gender.isEmpty) {
      GeneralWidgets.toast('Please select a gender');
      return false;
    }
    return true;
  }

  static bool isDobValid(String dob) {
    if (dob.isEmpty) {
      GeneralWidgets.toast('Please enter your date of birth');
      return false;
    } else if (DateTime.parse(dob).isAfter(DateTime.now())) {
      GeneralWidgets.toast('Please enter a valid date of birth');
      return false;
    }
    return true;
  }
}
