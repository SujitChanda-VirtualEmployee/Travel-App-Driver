import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/update_profile_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../widgets/display_inline_credentials.dart';

class MyProfileScreen extends StatefulWidget {
  static const String id = 'myProfile-screen';
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.black,
            )),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SizedBox(
      height: SizeConfig.fullHeight,
      width: SizeConfig.fullWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          logoPicture(
              height: SizeConfig.imageSizeMultiplier * 40,
              width: SizeConfig.imageSizeMultiplier * 40),
          Column(
            children: const [
              DisplayInlineCredentials(title: "Fisrt Name", value: "Jhon"),
              DisplayInlineCredentials(title: "Last Name", value: "Doe"),
              DisplayInlineCredentials(
                  title: "Mobile Number", value: "+1 99999 99999"),
              DisplayInlineCredentials(
                  title: "Email-ID", value: "jhondoe12@gmail.com"),
            ],
          ),
          const SizedBox(height: 10),
          CustomButtonsClass.blackButton(
              height: 71,
              title: "UPDATE PROFILE",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, UpdateProfileScreen.id);
              }),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget logoPicture({
    required double height,
    required double width,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: ColorPalette.dark, spreadRadius: 1, blurRadius: 1.5)
      ], borderRadius: BorderRadius.circular(100), color: ColorPalette.green),
      height: height,
      width: width,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(2),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorPalette.white),
          child: Image.asset(
            AssetImageClass.introImageOne,
            fit: BoxFit.contain,
          )),
    );
  }
}
