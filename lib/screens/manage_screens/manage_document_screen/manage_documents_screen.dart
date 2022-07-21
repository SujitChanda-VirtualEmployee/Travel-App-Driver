import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_document_screen/components/document_tile.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_account_screen.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../../../utils/color_palette.dart';
import '../../../utils/enum_classes.dart';

class ManageDocumentScreen extends StatefulWidget {
  static const String id = 'manageDocument-screen';
  final NavigationFrom from;
  const ManageDocumentScreen({Key? key, required this.from}) : super(key: key);

  @override
  State<ManageDocumentScreen> createState() => _ManageDocumentScreenState();
}

class _ManageDocumentScreenState extends State<ManageDocumentScreen> {
  File? drivingLicense, insurance, credentials, qualifications;
  String appBarTitle = "", buttonText = "";
  bool bodyTextVisible = false;

  @override
  void initState() {
    if (widget.from == NavigationFrom.settingsScreen) {
      appBarTitle = "Update Document";
      bodyTextVisible = false;
      buttonText = " SAVE";
    } else {
      appBarTitle = "Manage Document";
      bodyTextVisible = true;
      buttonText = " CONTINUE";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: !bodyTextVisible,
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
                  "Enter your Document details",
                  style: CustomStyleClass.onboardingBodyTextStyle,
                ),
              ),
            ),
            DocumentTileWidget(
              fileName: drivingLicense,
              status: 'Pending',
              title: 'Driving Licence',
              readOnly: false,
            ),
            DocumentTileWidget(
              fileName: insurance,
              status: 'Pending',
              title: 'Vehicle Insurance',
              readOnly: false,
            ),
            DocumentTileWidget(
              fileName: credentials,
              status: 'Pending',
              title: 'Credentials',
              readOnly: false,
            ),
            DocumentTileWidget(
              fileName: qualifications,
              status: 'Pending',
              title: 'Qualifications',
              readOnly: false,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 70,
            ),
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
                    Navigator.pushNamed(context, ManageAccountScreen.id);
                  }
                })
          ],
        ),
      ),
    );
  }
}
