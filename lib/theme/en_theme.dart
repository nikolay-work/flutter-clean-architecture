import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phones_market/theme/color_palette.dart';


class EnTheme {
  get getTheme => _lightTheme;

  final _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorPalette.greyE5E5E5,

    // AppBar Styles
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.greyE5E5E5,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),

    ),



    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: ColorPalette.black010035,
      ),
      headline2: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: ColorPalette.black010035,
      ),
      headline3: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorPalette.black010035,
      ),
      headline4: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: ColorPalette.black010035,
      ),
      headline5: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: ColorPalette.orangeFF6E4E,
      ),
      headline6: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ColorPalette.black010035,
      ),
      subtitle1: TextStyle(
        fontFamily: 'SFPro',
        fontWeight: FontWeight.w400,
        fontSize: 11,
        color: ColorPalette.whiteFFFFFF,
      ),
      subtitle2: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: ColorPalette.black010035,
      ),
      bodyText1: TextStyle(
        fontFamily: 'MarkPro',
        fontWeight: FontWeight.w400,
        fontSize: 11,
        color: ColorPalette.greyB7B7B7,
      ),
      bodyText2: TextStyle(
          fontFamily: 'MarkPro',
          fontWeight: FontWeight.w700,
          fontSize: 13,
          color: ColorPalette.grey8D8D8D,
          letterSpacing: -0.33
      ),
      button: TextStyle(
        fontFamily: 'SFPro',
        fontWeight: FontWeight.w700,
        fontSize: 11,
        color: ColorPalette.black010035,
      ),
      caption: TextStyle(
        fontFamily: 'SFPro',
        fontWeight: FontWeight.w700,
        fontSize: 10,
        color: ColorPalette.whiteFFFFFF,
      ),
    ),

  );
}
