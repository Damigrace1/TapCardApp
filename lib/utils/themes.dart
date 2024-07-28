import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';


ThemeData get currentTheme =>  HomeController.it.themeMode == ThemeMode.light ?
TapCardThemes.lightTheme : TapCardThemes.darkTheme;

class TapCardThemes {
  static final lightTheme = ThemeData(

      fontFamily: 'SFPRODISPLAYBOLD',
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  color: Colors.green.shade800
              )
          )
      ) ,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Color(0xff8E60DD),
          surface: Colors.white,
          error: Colors.red,
          onTertiary: Colors.orange));

  static final darkTheme = ThemeData(

    fontFamily: 'Spotify',
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: TextStyle(
                color: Color(0xff283618)
            )
        )
    ) ,
    colorScheme: ColorScheme.fromSeed(

        brightness: Brightness.dark,
        seedColor: Color(0xff8E60DD),
         surface: Colors.black,
        error: Colors.red,
        // secondary: ,
        onTertiary: Colors.orange.withOpacity(0.8)),
  );
}