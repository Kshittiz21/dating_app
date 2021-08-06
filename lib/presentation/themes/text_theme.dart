import 'package:dating_app/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get headline6 => _poppinsTextTheme.headline6!.copyWith(
      fontSize: Sizes.dimen_20,
      fontWeight: FontWeight.w600,
      wordSpacing: 0.15,
      color: Colors.black);

  static TextStyle get headline5 => _poppinsTextTheme.headline5!.copyWith(
      fontSize: Sizes.dimen_24,
      fontWeight: FontWeight.w600,
      wordSpacing: 0.0,
      color: Colors.black);

  static TextStyle get headline4 => _poppinsTextTheme.headline4!.copyWith(
      fontSize: Sizes.dimen_30,
      fontWeight: FontWeight.w500,
      wordSpacing: 0.25,
      color: Colors.black);

  static TextStyle get headline3 => _poppinsTextTheme.headline3!.copyWith(
      fontSize: Sizes.dimen_48,
      fontWeight: FontWeight.w400,
      wordSpacing: 0.0,
      color: Colors.black);

  // static TextStyle get headline3w => _poppinsTextTheme.headline3.copyWith(
  //     fontSize: Sizes.dimen_48,
  //     fontWeight: FontWeight.w400,
  //     wordSpacing: 0.0,
  //     color: Colors.white);

  static TextStyle get headline2 => _poppinsTextTheme.headline2!.copyWith(
      fontSize: Sizes.dimen_60,
      fontWeight: FontWeight.w300,
      wordSpacing: -0.5,
      color: Colors.black);

  static TextStyle get headline1 => _poppinsTextTheme.headline1!.copyWith(
      fontSize: Sizes.dimen_96,
      fontWeight: FontWeight.w300,
      wordSpacing: -1.5,
      color: Colors.black);

  static TextStyle get subtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
      fontSize: Sizes.dimen_16,
      fontWeight: FontWeight.w300,
      wordSpacing: 0.15,
      color: Colors.grey);

  static TextStyle get subtitle2 => _poppinsTextTheme.subtitle2!.copyWith(
      fontSize: Sizes.dimen_14,
      fontWeight: FontWeight.w400,
      wordSpacing: 0.1,
      color: Colors.grey);

  static TextStyle get bodyText1 => _poppinsTextTheme.bodyText1!.copyWith(
      fontSize: Sizes.dimen_16,
      fontWeight: FontWeight.w300,
      wordSpacing: 0.5,
      color: Colors.black);

  static TextStyle get bodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
      fontSize: Sizes.dimen_14,
      fontWeight: FontWeight.w300,
      wordSpacing: 0.25,
      color: Colors.black);

  static TextStyle get button => _poppinsTextTheme.button!.copyWith(
      fontSize: Sizes.dimen_14, fontWeight: FontWeight.w400, wordSpacing: 1.25);

  static TextStyle get caption => _poppinsTextTheme.caption!.copyWith(
      fontSize: Sizes.dimen_12, fontWeight: FontWeight.w300, wordSpacing: 0.4);

  static TextStyle get overline => _poppinsTextTheme.overline!.copyWith(
      fontSize: Sizes.dimen_10, fontWeight: FontWeight.w300, wordSpacing: 1.5);

  static getTextTheme() => TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
        button: button,
        caption: caption,
        overline: overline,
      );
}
