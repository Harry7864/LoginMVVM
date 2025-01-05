import '../constants/string_constants.dart';

/// Validations
class ValidationUtils {
  // Validation of Email Field
  static String? validateEmail(String? value) {
    RegExp? regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if ((value ?? '').trim().isEmpty) {
      return StringConstants.emailRequired;
    } else if (!regex.hasMatch((value ?? '').trim())) {
      return StringConstants.emailValidRequired;
    }
    return null;
  }

  /// Validation of Password
  static String? validatePassword(String? value) {
    RegExp? regex = RegExp(StringConstants.passwordPattern);
    if ((value ?? '').trim().isEmpty) {
      return StringConstants.passRequired;
    } else if ((value ?? '').trim().length < 8) {
      return StringConstants.passValidationRequired;
    } else if (!regex.hasMatch((value ?? '').trim())) {
      return StringConstants.invalidPassword;
    }

    return null;
  }

  /// Validation of confirm password
  static String? validateRepeatPassword(String value, String createPassword) {
    if (value.trim().isEmpty) {
      return StringConstants.repeatPassRequired;
    } else if (createPassword != value) {
      return StringConstants.confirmPasswordNotMatch;
    }
    return null;
  }

  /// Validation of confirm password
  static String? validateConfirmPassword(String value, String createPassword) {
    if (value.trim().isEmpty) {
      return StringConstants.confirmPassRequired;
    } else if (createPassword != value) {
      return StringConstants.confirmPasswordNotMatch;
    }
    return null;
  }

  /// check whether give url is valid or not
  static String? hasValidUrl(String value, {bool isUrlRequired = true}) {
    String pattern2 =
        r'(([\w]+:)?//)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,63}(:[\d]+)?(/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?';
    //only supports www
    String pattern =
        r'((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+(:[0-9]+)?|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty && isUrlRequired) {
      return 'The input for \'URL\' is required. Please add a url.';
    } else if (!regExp.hasMatch(value) && isUrlRequired) {
      return 'The input for \'URL\' is invalid. Please add valid url.';
    }
    return null;
  }

  /// Validation of empty Field
  static String? validateValue(String value, String errorMessage) {
    if (value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? validateVerificationCode(String value) {
    if (value.trim().isEmpty) {
      return StringConstants.codeRequired;
    } else if (value.length < 6) {
      return StringConstants.invalidCode;
    }
    return null;
  }


  static String? validateGroupCode(String value) {
    if (value.trim().isEmpty) {
      return StringConstants.enterAGroupCode;
    }
    if (value.trim().length <= 2) {
      return StringConstants.groupCodeLength;
    }

    return null;
  }
}
