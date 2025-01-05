import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';
import '../constants/font_constants.dart';

class BaseTextFieldDecoration {
  static InputDecorationTheme inputDecoration = InputDecorationTheme(
  hintStyle: GoogleFonts.openSans(color: Colors.grey),
  filled: true,
  isDense: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: ColorConstants.whiteTextColor,
  focusColor: ColorConstants.whiteTextColor,
  errorMaxLines: 3,
  labelStyle: GoogleFonts.openSans(color: Colors.black),
  helperStyle: GoogleFonts.openSans(color: Colors.black),
  contentPadding: const EdgeInsets.all(18.0),
  border: UnderlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide:
  const BorderSide(color: ColorConstants.black, width: 0.5)),
  focusedBorder: UnderlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide:
  const BorderSide(color: ColorConstants.black, width: 0.5)),
  focusedErrorBorder: UnderlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide:
  const BorderSide(color: ColorConstants.darkRed, width: 2)),
  errorStyle: const TextStyle(
  color: ColorConstants.darkRed,
  fontFamily: FontConstants.sfPro,
  fontSize: 14),
  errorBorder: const UnderlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)),
  borderSide: BorderSide(color: ColorConstants.darkRed, width: 2)),
  disabledBorder: const UnderlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(6)),
  borderSide: BorderSide(color: Colors.grey, width: 0.5)),
  enabledBorder: UnderlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide:
  const BorderSide(color: ColorConstants.black, width: 0.5)));
}