import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

CommonUtils commonUtils = CommonUtils();

class CommonUtils {
  static final CommonUtils _constants = CommonUtils._i();

  factory CommonUtils() {
    return _constants;
  }

  CommonUtils._i();

  bool isKeyboardOpened(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  showSneakBarWithMessage(
      {required String msg,
      Color color = ColorConstants.gray,
      required BuildContext context}) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
