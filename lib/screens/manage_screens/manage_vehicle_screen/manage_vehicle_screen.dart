
import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_document_screen/manage_documents_screen.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';
import '../../../utils/color_palette.dart';

class ManageVehicleScreen extends StatefulWidget {
  static const String id = "manageVehicle-screen";
  final NavigationFrom from;
  const ManageVehicleScreen({Key? key, required this.from}) : super(key: key);

  @override
  State<ManageVehicleScreen> createState() => _ManageVehicleScreenState();
}

class _ManageVehicleScreenState extends State<ManageVehicleScreen> {
  String appBarTitle = "", buttonText = "";
  bool bodyTextVisible = false;

  @override
  void initState() {
    if (widget.from == NavigationFrom.settingsScreen) {
      appBarTitle = "Update Vehicle";
      bodyTextVisible = false;
      buttonText = " SAVE";
    } else {
      appBarTitle = "Manage Vehicle";
      bodyTextVisible = true;
      buttonText = " CONTINUE";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: !bodyTextVisible,
        title: Text(appBarTitle),
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
            Visibility(
              visible: bodyTextVisible,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Enter your Vehicle details",
                  style: CustomStyleClass.onboardingBodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Driver Name",
                hintText: "Driver Name",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Company Name",
                hintText: "Company Name",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Model of Vehicle",
                hintText: "Model of Vehicle",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Plate Number",
                hintText: "Plate Number",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 25),
            CustomTextField(
                labelText: "Vehicle Color",
                hintText: "Vehicle Color",
                valueText: "",
                fieldType: FieldType.name),
            SizedBox(height: SizeConfig.heightMultiplier * 70),
            CustomButtonsClass.blackButton(
                leftMargin: 0,
                rightMargin: 0,
                height: 72,
                title: buttonText,
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: () {
                  if (widget.from == NavigationFrom.settingsScreen) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushNamed(context, ManageDocumentScreen.id,
                        arguments: NavigationFrom.signUpScreen);
                  }
                })
          ],
        ),
      ),
    );
  }
}
