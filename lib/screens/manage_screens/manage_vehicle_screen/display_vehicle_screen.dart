import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_vehicle_screen/manage_vehicle_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../../../widgets/display_inline_credentials.dart';

class DisplayVehicleScreen extends StatefulWidget {
  static const String id = "displayVehicle-screen";
  const DisplayVehicleScreen({Key? key}) : super(key: key);

  @override
  State<DisplayVehicleScreen> createState() => _DisplayVehicleScreenState();
}

class _DisplayVehicleScreenState extends State<DisplayVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Manage Vehicle'),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 20),
          const DisplayInlineCredentials(
              title: "Driver Name", value: "CK Rana"),
          const DisplayInlineCredentials(title: "Company Name", value: "TATA"),
          const DisplayInlineCredentials(
              title: "Model of Vehicle", value: "Tata Nexone 123"),
          const DisplayInlineCredentials(
              title: "Plate Number", value: "DL 1023A4 0054"),
          const DisplayInlineCredentials(title: "Vehicle Color", value: "Red"),
          SizedBox(height: SizeConfig.heightMultiplier * 70),
          CustomButtonsClass.blackButton(
              height: 72,
              title: "UPDATE VEHICLE",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, ManageVehicleScreen.id,
                    arguments: NavigationFrom.settingsScreen);
              })
        ],
      ),
    );
  }
}
