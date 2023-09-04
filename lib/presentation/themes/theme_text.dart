import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/themes/app_color.dart';

class ThemeText {
  const ThemeText._();
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle? get _whiteHeadline6 =>
      _poppinsTextTheme.headlineLarge?.copyWith(
        fontSize: (Sizes.dimen_20.sp) as double,
        color: Colors.white,
      );
  static TextStyle? get whiteSubtitle1 =>
      _poppinsTextTheme.titleMedium?.copyWith(
        fontSize: Sizes.dimen_14.sp as double,
        color: Colors.white,
        wordSpacing: 0.25,
        height: 1.5,
      );
  static getTextTheme() => TextTheme(
        titleLarge: _whiteHeadline6,
        titleMedium: whiteSubtitle1,
        bodyMedium: _whiteHeadline6,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle? get royalblueSubtitle1 => titleMedium?.copyWith(
        color: AppColor.royaBlue,
        fontWeight: FontWeight.w600,
      );
}