import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

class ConfirmDialog {
  static showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Image.asset(
                  AssetImageClass.shieldIcon,
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Booking Successful",
                    style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                        color: ColorPalette.black,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.textMultiplier * 2.5),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your booking has been confirmed.\nDriver will pickup you in 2 minutes.",
                    style: CustomStyleClass.onboardingBodyTextStyle
                        .copyWith(fontSize: SizeConfig.textMultiplier * 1.9),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 40,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButtonsClass.blackButton(
                            rightMargin: 5,
                            height: 72,
                            title: "CANCEL",
                            color: ColorPalette.dark,
                            titleStyle: CustomStyleClass
                                .onboardingSkipButtonStyle
                                .copyWith(
                                    color: ColorPalette.black,
                                    fontWeight: FontWeight.normal),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            })),
                    Expanded(
                        child: CustomButtonsClass.blackButton(
                            leftMargin: 5,
                            height: 72,
                            title: "DONE",
                            titleStyle:
                                CustomStyleClass.onboardingSkipButtonStyle,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }))
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 30,
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 0.8), end: const Offset(0, 0))
              .animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    ).whenComplete(() {
      // Navigator.of(context).pop();
    });
  }
}
