import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String id = 'updateProfile-screen';
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update Profile'),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomTextField(
                    labelText: "First Name",
                    hintText: "First Name",
                    valueText: "John",
                    fieldType: FieldType.name),
                SizedBox(height: SizeConfig.heightMultiplier * 30),
                CustomTextField(
                    labelText: "Last Name",
                    hintText: "Last Name",
                    valueText: "John",
                    fieldType: FieldType.name),
                SizedBox(height: SizeConfig.heightMultiplier * 30),
                CustomTextField(
                    labelText: "Mobile Number",
                    hintText: "Mobile Number",
                    valueText: "John",
                    fieldType: FieldType.mobile),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CustomButtonsClass.blackButton(
              height: 71,
              title: "SAVE",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {}),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget logoPicture({
    required double height,
    required double width,
  }) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: ColorPalette.dark, spreadRadius: 1, blurRadius: 1.5)
              ],
              borderRadius: BorderRadius.circular(100),
              color: ColorPalette.green),
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
        ),
        Positioned(
            bottom: 0, right: 0, child: Image.asset(AssetImageClass.cameraIcon))
      ],
    );
  }
}
