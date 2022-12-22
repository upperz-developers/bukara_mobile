// const grandianColor1 = Color(0xFFE600B2);
// const grandianColor2 = Color(0xFF00A3FF);
// const onSecondContainer = Color(0xFF3EBEA8);
// const onContainer = Color(0xFFFFFFFF);
// const fillTextInputColor = Color(0xFFebebeb);

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Style {
  static ThemeData? themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: textTheme,
      fontFamily: "Montserrat",
      scaffoldBackgroundColor: isDarkTheme
          ? const Color.fromARGB(255, 15, 15, 15)
          : AppColors.SCAFFOLD_BACKGROUND_LIGHT,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 31, 30, 29)
          : const Color(0xFFFFFFFF),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      shadowColor: isDarkTheme
          ? const Color.fromARGB(226, 24, 24, 24)
          : const Color.fromARGB(206, 235, 231, 231),
      disabledColor: isDarkTheme
          ? const Color.fromARGB(255, 44, 44, 43)
          : const Color.fromARGB(255, 233, 232, 232),
    );
  }

  static TextTheme textTheme = const TextTheme();
}

class AppColors {
  //Light theme
  static const PRIMARY_COLOR = Color(0xFFF2E205);
  static const BACKGROUND = Color(0xFFFEF9E9);
  static const ACCENT_COLOR = Color.fromARGB(255, 248, 224, 37);
  static const RED_COLOR = Color.fromARGB(255, 230, 59, 11);
  static const WHITE_COLOR = Color(0xFFFFFFFF);
  static const GREY_COLOR = Color(0xFF99A3C5);
  static const BLUE_COLOR = Color(0xFF156BE7);
  static const GREEN_COLOR = Color(0xFF0D8B5F);
  static const BLACK_COLOR = Color(0xFF000000);
  static const SCAFFOLD_BACKGROUND_LIGHT = Color(0xFFF5F5F5);
  static const DISABLE_COLOR = Color(0xFFECECEC);
  static const SECOND_TEXT_COLOR = Colors.black45;

  //Dark theme
  static const YELLOW_COLOR = Colors.amber;
  static const TRANSPARENT = Color(0x00000000);
  static const SCAFFOLD_BACKGROUND_DARK = Color(0xFF000000);
  static const DARK_COLOR = Color.fromARGB(255, 23, 24, 30);
  static const DARK_SCAFFOLD_BACKGROUND = Color(0xFF2C2D4B);
  static const ON_CONTAINER_COLOR = Color(0xFFe8f0f0);
  static const BOXSHADOW = Color(0xFFd0d1ce);

  static const BORDER_COLOR = Color.fromARGB(255, 48, 48, 48);
}
