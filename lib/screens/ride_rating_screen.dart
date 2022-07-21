import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/screens/home_screen/home_screen.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../utils/asset_images_strings.dart';
import '../utils/color_palette.dart';

class RideRatingScreen extends StatefulWidget {
  static const String id = 'rideRating-screen';
  const RideRatingScreen({Key? key}) : super(key: key);

  @override
  State<RideRatingScreen> createState() => _RideRatingScreenState();
}

class _RideRatingScreenState extends State<RideRatingScreen> {
  List startList = [
    AssetImageClass.starOffIcon,
    AssetImageClass.starOffIcon,
    AssetImageClass.starOffIcon,
    AssetImageClass.starOffIcon,
    AssetImageClass.starOffIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Rating",
          style: CustomStyleClass.onboardingBodyTextStyle
              .copyWith(color: Colors.white, letterSpacing: 1),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.white,
            )),
        elevation: 0,
        backgroundColor: ColorPalette.black,
      ),
      body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: body()),
    );
  }

  Widget body() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
        width: SizeConfig.fullWidth,
        decoration: BoxDecoration(
            color: ColorPalette.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 80,
                ),
                Text(
                  "John Doe",
                  textAlign: TextAlign.center,
                  style: CustomStyleClass.onboardingHeadingStyle
                      .copyWith(fontSize: SizeConfig.textMultiplier * 3),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 15,
                ),
                Text(
                  "johndoe12@gmail.com",
                  textAlign: TextAlign.center,
                  style: CustomStyleClass.onboardingBodyTextStyle
                      .copyWith(fontSize: SizeConfig.textMultiplier * 2),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 40,
                ),
                Text(
                  "How is your trip?",
                  textAlign: TextAlign.center,
                  style: CustomStyleClass.onboardingHeadingStyle
                      .copyWith(fontSize: SizeConfig.textMultiplier * 3),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 15,
                ),
                Text(
                  "Your feedback will help improve customers experience.",
                  textAlign: TextAlign.center,
                  style: CustomStyleClass.onboardingBodyTextStyle
                      .copyWith(fontSize: SizeConfig.textMultiplier * 2),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 25,
                ),
                startRatingGenerator(4),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 20,
                ),
                commentContainer(),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 10,
                ),
                CustomButtonsClass.blackButton(
                    height: 72,
                    title: "SUBMIT",
                    titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                    onPressed: () {
                      Provider.of<RideProvider>(context, listen: false)
                          .setRideStatus(RideStatus.rideCompleted);

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeScreen.id, (Route<dynamic> route) => false);
                    })
              ],
            ),
            Positioned(
                top: -(SizeConfig.heightMultiplier * 110),
                left: 0,
                right: 0,
                child: circleImage())
          ],
        ),
      ),
    );
  }

  Widget circleImage() {
    return CircleAvatar(
      radius: SizeConfig.heightMultiplier * 80,
      child: Container(
        height: SizeConfig.heightMultiplier * 160,
        width: SizeConfig.heightMultiplier * 160,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                color: ColorPalette.dark.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1),
          ],
          color: ColorPalette.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            AssetImageClass.userLogo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  startRatingGenerator(int rating) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 50,
      width: SizeConfig.fullWidth,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                log("tapped : ${index + 1}");
                startList.clear();
                for (int i = 0; i < 5; i++) {
                  startList.add(AssetImageClass.starOffIcon);
                }
                for (int i = 0; i < (index + 1); i++) {
                  setState(() {
                    startList.removeAt(i);
                    startList.insert(
                      i,
                      AssetImageClass.starOnIcon,
                    );
                  });
                }
              },
              child: Image.asset(
                '${startList[index]}',
                height: SizeConfig.heightMultiplier * 50,
                width: SizeConfig.heightMultiplier * 50,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 15,
            );
          },
        ),
      ),
    );
  }

  Widget commentContainer() {
    return Container(
      height: SizeConfig.heightMultiplier * 130,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
          maxLines: 5,
          autovalidateMode: AutovalidateMode.disabled,
          validator: CustomValidationClass.nameValidator,
          keyboardType: TextInputType.text,
          style: CustomStyleClass.onboardingBodyTextStyle
              .copyWith(color: ColorPalette.black, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            isDense: true,
            //filled: true,
            contentPadding: EdgeInsets.only(
                top: 10 * SizeConfig.heightMultiplier,
                bottom: 10 * SizeConfig.heightMultiplier,
                left: 15,
                right: 10),

            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            errorMaxLines: 1,
            focusedErrorBorder: InputBorder.none,
            labelText: "Additional Comments",
            labelStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.dark,
                fontSize: SizeConfig.textMultiplier * 2),
            floatingLabelStyle: CustomStyleClass.onboardingBodyTextStyle
                .copyWith(
                    color: ColorPalette.black,
                    fontSize: SizeConfig.textMultiplier * 2),
            hintText: "Additional Comments....",
            hintStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.dark,
                fontSize: SizeConfig.textMultiplier * 2),
            errorStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                fontSize: 10,
                color: ColorPalette.error,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
