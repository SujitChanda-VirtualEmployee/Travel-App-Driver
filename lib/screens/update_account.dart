import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class UpdateAccountScreen extends StatefulWidget {
  static const String id = 'updateAccount-screen';
  const UpdateAccountScreen({Key? key}) : super(key: key);

  @override
  State<UpdateAccountScreen> createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update Account'),
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
              onPressed: () {
                Navigator.pop(context);
              }),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget credentials({required String title, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: CustomStyleClass.onboardingBodyTextStyle),
              Text(value,
                  style: CustomStyleClass.onboardingBodyTextStyle
                      .copyWith(color: ColorPalette.black))
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
