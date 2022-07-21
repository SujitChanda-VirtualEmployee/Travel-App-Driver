import 'package:flutter/material.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/screens/landing_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class ManageAccountScreen extends StatefulWidget {
  static const String id = "manageAccount-screen";
  const ManageAccountScreen({Key? key}) : super(key: key);

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text('Manage Account'),
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Enter banking info to get paid",
                style: CustomStyleClass.onboardingBodyTextStyle,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Account Holder Name",
                hintText: "Account Holder Name",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Routing Name",
                hintText: "Routing Name",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Account Number",
                hintText: "Account Number",
                valueText: "",
                fieldType: FieldType.number),
            SizedBox(height: SizeConfig.heightMultiplier * 100),
            CustomButtonsClass.blackButton(
                leftMargin: 0,
                rightMargin: 0,
                height: 72,
                title: "ADD ACCOUNT",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: () {
                  preferences!.setBool('_userStatus', false);
                  preferences!.setString('_userAuthToken', "Bearer 1234657980");
                  Navigator.pushReplacementNamed(context, LandingScreen.id);
                })
          ],
        ),
      ),
    );
  }
}
