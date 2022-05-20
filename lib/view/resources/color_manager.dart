import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xffFF6600);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);
  static Color black = const Color(0xff000000);

  // new colors
  static Color darkPrimary = const Color(0xffd17d11);
  static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color


  static MaterialColor color = const MaterialColor(
    0xff07919C,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffFF6600), //10%
      100: Color(0xffFF6600), //20%
      200: Color(0xffFF6600), //30%
      300: Color(0xffFF6600), //40%
      400: Color(0xffFF6600), //50%
      500: Color(0xffFF6600), //60%
      600: Color(0xffFF6600), //70%
      700: Color(0xffFF6600), //80%
      800: Color(0xffFF6600), //90%
      900: Color(0xffFF6600), //100%
    },
  );
}
