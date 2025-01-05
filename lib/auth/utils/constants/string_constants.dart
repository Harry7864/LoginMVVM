abstract class StringConstants
{
  static String appName  = 'Base Provider Structure';

  ///Validation Messages
  static const String firstNameRequired = 'First Name is required.';
  static const String lastNameRequired = 'Last Name is required.';
  static const String emailRequired = "Email address is required";
  static const String passRequired = "Password is Required.";
  static const String newPassRequired = 'New password is required';
  static const String confirmPassRequired = 'Confirm password is required';
  static const String oldPassRequired = "Old password is required";
  static const String repeatPassRequired = "Repeat password is required";
  static const String emailValidRequired = "Enter a valid email address";
  static const String passValidationRequired =
      "Password must be greater than 8 characters";
  static const String confirmPasswordNotMatch = 'Password can\'t be same';
  static const String passwordPatternNotMatch =
      'Include both upper and lower case latter.\nInclude at least one number and symbol.';
  static const String codeRequired = 'Confirmation code is required';
  static const String phoneNumberRequired = 'Enter a cellphone number';
  static var pleaseReadTerms = 'Please read and agree to terms and conditions';


  ///Register screen validation
  static const invalid = 'Invalid';
  static const invalidFirstName = 'Enter a first name';
  static const invalidLastName = 'Enter a last name';
  static const invalidUsername = 'Invalid Username';
  static const invalidPassword =
      'Maximum 16 characters including 1 Uppercase, 1 Lowercase, 1 Number and 1 Special Character';
  static const passwordDidNotMatched = 'Passwords do not match';
  static const invalidPhoneNumber =
      'Invalid Phone Number (remember country code for example +47)';
  static const shortPhoneNumber = 'Phone number must be at least 10 numbers';
  static const invalidEmail = 'Invalid E-mail';
  static const enterAGroupCode = 'Enter a group code';
  static const groupCodeLength = 'Group code length must be more than 2 digits';
  static const fillAllFields = 'Please correct fill all required fields';
  static const invalidCode = 'Invalid confirmation code';

  static const String successMessageProfileUpdate =
      'Profile data information saved successfully';

  ///Error Message
  static const somethingWentWrongError =
      'Oops, something went wrong..! Try again after sometime';

  /// REGEX
  static const passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!.@#\$&*~]).{8,16}$';
  static const email = r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const password = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$';
  static const phone =  r'^\+(?:[0-9]●?){6,14}[0-9]$';
}