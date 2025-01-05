import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class BasicButtonTheme {
  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding:
            const EdgeInsets.all(8) + const EdgeInsets.symmetric(horizontal: 8),
        backgroundColor: ColorConstants.green),
  );
}
