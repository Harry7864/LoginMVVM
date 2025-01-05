import 'package:demo_task/auth/utils/themes/text_theme.dart';
import 'package:demo_task/auth/utils/themes/textfield_decoration_theme.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import 'button_theme.dart';

class BaseAppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: ColorConstants.primaryColor,
      onPrimary: Colors.white,
      brightness: Brightness.light,
      secondary: ColorConstants.secondaryColor,
      surface: Colors.white,
      onSurface: ColorConstants.primaryColor,
      background: Colors.white, // Use this instead of backgroundColor
      onBackground: ColorConstants.primaryColor,
      onError: ColorConstants.primaryRedColor,
      onSecondary: ColorConstants.primaryRedColor,
      error: ColorConstants.primaryRedColor,
    ),
    brightness: Brightness.light,
    primaryColor: ColorConstants.primaryColor,
    scaffoldBackgroundColor: ColorConstants.whiteColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.lightGray,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorConstants.lightGray,
      foregroundColor: ColorConstants.primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorConstants.gray),
      titleTextStyle: TextStyle(fontSize: 20, color: ColorConstants.primaryColor),
    ),
    textTheme: TextBasicTheme.textTheme,
    iconTheme: const IconThemeData(color: ColorConstants.black),
    elevatedButtonTheme: BasicButtonTheme.buttonTheme,
    inputDecorationTheme: BaseTextFieldDecoration.inputDecoration,
  );
}
