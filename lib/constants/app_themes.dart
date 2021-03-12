import 'package:flutter/material.dart';
import './app_font_family.dart';

class AppThemes {
  AppThemes._();
  //constants color range for light theme
  static const Color _lightPrimaryColor = Color(0xffa21942);
  static const Color _lightPrimaryVariantColor = Color(0xff610f28);
  static const Color _lightWhiteColor = Colors.white;
  static const Color _lightBlackColor = Colors.black;
  static const Color _lightBlackHighColor = Colors.black87;
  // ignore: unused_field
  static const Color _lightBlackMediumColor = Colors.black54;
  static const Color _lightButtonPrimaryColor = Color(0xffa21942);
  static const Color _lightAppBarColor = Colors.white;
  static const Color _lightSnackBarBackgroundErrorColor = Colors.red;

  //text theme for light theme
  static final TextStyle _lightScreenHeadingTextStyle =
      TextStyle(fontSize: 20.0, color: _lightBlackColor);
  static final TextStyle _lightScreenHeading2TextStyle =
      TextStyle(fontSize: 16, color: _lightBlackHighColor);
  static final TextStyle _lightScreenAppBarTextStyle =
      TextStyle(color: _lightPrimaryVariantColor);

  static final TextTheme _lightTextTheme = TextTheme(
      headline1: _lightScreenHeadingTextStyle,
      headline2: _lightScreenHeading2TextStyle,
      headline6: _lightScreenAppBarTextStyle);

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimaryColor,
    accentColor: _lightPrimaryColor,
    primaryColorDark: _lightPrimaryVariantColor,
    fontFamily: AppFontFamily.raleway,
    scaffoldBackgroundColor: _lightWhiteColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightButtonPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightAppBarColor,
      iconTheme: IconThemeData(color: _lightPrimaryColor),
      textTheme: _lightTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
    ),
    snackBarTheme:
        SnackBarThemeData(backgroundColor: _lightSnackBarBackgroundErrorColor),
    iconTheme: IconThemeData(
      color: _lightPrimaryColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _lightAppBarColor),
    textTheme: _lightTextTheme,
  );
}
