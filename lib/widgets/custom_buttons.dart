import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/size_config.dart';

class CustomButtonsClass {
  static Widget blackButton({
    required double height,
    required String title,
    required TextStyle titleStyle,
    required void Function() onPressed,
    double? radius,
    double? leftMargin,
    double? rightMargin,
    Color? color,
  }) {
    return Container(
        height: SizeConfig.heightMultiplier * height,
        width: SizeConfig.fullWidth,
        margin: EdgeInsets.only(
          left: leftMargin ?? 20,
          right: rightMargin ?? 20,
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color ?? ColorPalette.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 30.0),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              title,
              style: titleStyle,
            )));
  }

  static Widget skipButton({
    required double height,
    required double widthDividedBy,
    required String title,
    required TextStyle titleStyle,
    required void Function() onPressed,
    double? leftMargin,
    double? rightMargin,
  }) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * height,
      width: SizeConfig.fullWidth / widthDividedBy,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: titleStyle,
          )),
    );
  }
}
