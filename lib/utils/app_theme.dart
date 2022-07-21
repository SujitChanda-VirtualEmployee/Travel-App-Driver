import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';

class AppTheme {
  AppTheme._();

  static const Color iconColor = ColorPalette.black;

  static const Color lightPrimaryColor = ColorPalette.white;
  static const Color darkPrimaryColor = Colors.grey;
  static const Color lightPrimaryVarientColor = ColorPalette.green;
  static const Color darkPrimaryVarientColor = ColorPalette.green;

  static const Color lightSecondaryColor = ColorPalette.dark;
  static const Color darkSecondaryColor = ColorPalette.dark;
  static const Color lightOnPrimaryColor = ColorPalette.black;
  static const Color darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black, // button text color
      ),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: lightPrimaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightOnPrimaryColor,
      selectionColor: lightSecondaryColor.withOpacity(0.5),
      selectionHandleColor: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      color: lightPrimaryColor,
      iconTheme: IconThemeData(color: lightOnPrimaryColor),
    ),
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      primaryContainer: lightPrimaryVarientColor,
      secondary: lightSecondaryColor,
      onPrimary: lightOnPrimaryColor,
      onSurface: Colors.black,
    ),
    iconTheme: const IconThemeData(color: iconColor, size: 25),
    textTheme: _lightTextTheme,
    primaryColor: lightPrimaryColor,

    //accentColor: Colors.white.withOpacity(0.1),
    // timePickerTheme: TimePickerThemeData(
    //   backgroundColor: Colors.amberAccent,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   hourMinuteShape: CircleBorder(),
    // ),
  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: darkPrimaryColor,
      appBarTheme: const AppBarTheme(
        color: darkPrimaryVarientColor,
        iconTheme: IconThemeData(color: darkOnPrimaryColor),
      ),
      colorScheme: const ColorScheme.light(
        primary: darkPrimaryColor,
        primaryContainer: darkPrimaryVarientColor,
        secondary: darkSecondaryColor,
        onPrimary: darkOnPrimaryColor,
      ),
      iconTheme: const IconThemeData(color: iconColor),
      textTheme: _darkTextTheme,
     // accentColor: Color(0XFFfbc984).withOpacity(0.5)
      );

  static const TextTheme _lightTextTheme = TextTheme(
    headline5: lightScreenHeading5TextStyle,
    headline6: lightScreenHeading6TextStyle,
    bodyText1: lightScreenTaskNameTextStyle,
    bodyText2: lightScreenTaskDurationTextStyle,
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headline5: darkScreenHeading5TextStyle,
    headline6: darkScreenHeading6TextStyle,
    bodyText1: darkScreenTaskNameTextStyle,
    bodyText2: darkScreenTaskDurationTextStyle,
  );

  static const TextStyle lightScreenHeading5TextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 26.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.bold);
  static const TextStyle lightScreenHeading6TextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 20.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.bold);
  static const TextStyle lightScreenTaskNameTextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.normal);
  static const TextStyle lightScreenTaskDurationTextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 13.0,
      color: lightSecondaryColor,
      fontWeight: FontWeight.normal);

  static const TextStyle darkScreenHeading5TextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 20.0,
      color: Color(0XFF997042),
      fontWeight: FontWeight.bold);
  static const TextStyle darkScreenHeading6TextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 20.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.bold);
  static const TextStyle darkScreenTaskNameTextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 16.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.normal);
  static const TextStyle darkScreenTaskDurationTextStyle = TextStyle(
      fontFamily: "Roboto",
      fontSize: 13.0,
      color: lightOnPrimaryColor,
      fontWeight: FontWeight.normal);
}

List<BoxShadow> customShadow = [
  //  BoxShadow(

  //    color: Colors.white.withOpacity(0.3),
  //    blurRadius: 30,
  //    offset: Offset(-5,-5),
  //    spreadRadius: -5),

  BoxShadow(
    //color: Colors.blue.withOpacity(0.3),
    color: Colors.grey.shade400,
    blurRadius: 3,
    spreadRadius: 2,
    offset: const Offset(0.7, 0.7),
  )
];

List<BoxShadow> customShadow2 = [
  BoxShadow(
      color: Colors.grey[300]!,
      blurRadius: 2,
      offset: const Offset(-2, -2),
      spreadRadius: -2),
  BoxShadow(
    // color: Colors.blue.withOpacity(0.3),
    color: Colors.grey[300]!,
    blurRadius: 3,
    spreadRadius: 2,
    offset: const Offset(0.2, 0.2),
  )
];

List<BoxShadow> customGreenShadow = [
  BoxShadow(
      color: const Color(0XFF23b574).withOpacity(0.1),
      blurRadius: 30,
      offset: const Offset(-5, -5),
      spreadRadius: -5),
  BoxShadow(
      //color: Colors.blue.withOpacity(0.3),
      color: Colors.lightGreen.withOpacity(0.1),
      spreadRadius: 2,
      offset: const Offset(7, 7),
      blurRadius: 20)
];
