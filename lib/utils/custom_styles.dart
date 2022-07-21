import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/size_config.dart';

class CustomStyleClass {
  static final TextStyle onboardingHeadingStyle = TextStyle(
      color: ColorPalette.black,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.textMultiplier * 4);

  static final TextStyle onboardingBodyTextStyle = TextStyle(
      
      color: ColorPalette.dark,
      fontSize: SizeConfig.textMultiplier * 2.3);

  static final TextStyle onboardingSkipButtonStyle = TextStyle(
      color: ColorPalette.green,
      fontSize: SizeConfig.textMultiplier * 2.3,
      fontWeight: FontWeight.bold);
}
