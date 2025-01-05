import 'package:flutter/material.dart';

import '../../../utils/common_utils.dart';
import '../../../utils/constants/route_constants.dart';

class LoginProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late FocusNode emailFocus;
  late FocusNode pwFocus;
  bool loggingIn = false;
  bool obscurePass = true;

  AutovalidateMode autoValidationMode = AutovalidateMode.disabled;


  initAllBasics() {
    emailFocus = FocusNode();
    pwFocus = FocusNode();
    email.text = "";
    password.text = "";
    email.text = "";
    password.text = "";
  }

  refresh(){
    notifyListeners();
  }

  void changeAutoValidation(){
    autoValidationMode = AutovalidateMode.always;
    notifyListeners();
  }

  void toggleShowPassword() {
    obscurePass = !obscurePass;
    notifyListeners();
  }

  showLoading(bool loading){
    loggingIn = loading;
    notifyListeners();
  }
  void loginAction(BuildContext context) {
    showLoading(true);
    Future.delayed(const Duration(seconds: 1), (){
      showLoading(false);
      CommonUtils().showSneakBarWithMessage(msg: 'Login done', context: context);
      Navigator.pushReplacementNamed(context, RouteConstants.homePage);
    });
  }

}