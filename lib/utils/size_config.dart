import 'dart:developer';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVerticle = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  static double fullHeight = 0;
  static double fullWidth = 0;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;
    } else {
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;
    }
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVerticle = _screenHeight / 100;

    textMultiplier = _blockSizeVerticle;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = (_blockSizeVerticle / 10);
    widthMultiplier = (_blockSizeHorizontal / 10);
    fullHeight = _screenHeight;
    fullWidth = _screenWidth;

    log(_blockSizeHorizontal.toString());
    log(_blockSizeVerticle.toString());
    log(textMultiplier.toString());
    log(imageSizeMultiplier.toString());
    log(heightMultiplier.toString());
    log(widthMultiplier.toString());
    log(fullHeight.toString());
    log(fullWidth.toString());
  }
}
