import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_document_screen/components/document_tile.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_document_screen/manage_documents_screen.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../../../utils/color_palette.dart';
import '../../../utils/enum_classes.dart';

class DisplayDocumentScreen extends StatefulWidget {
  static const String id = 'displayDocument-screen';

  const DisplayDocumentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayDocumentScreen> createState() => _DisplayDocumentScreenState();
}

class _DisplayDocumentScreenState extends State<DisplayDocumentScreen> {
  File? drivingLicense, insurance, credentials, qualifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Manage Documents"),
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DocumentTileWidget(
              fileName: drivingLicense,
              status: 'Pending',
              title: 'Driving Licence',
              readOnly: true,
            ),
            DocumentTileWidget(
              fileName: insurance,
              status: 'Pending',
              title: 'Vehicle Insurance',
              readOnly: true,
            ),
            DocumentTileWidget(
              fileName: credentials,
              status: 'Pending',
              title: 'Credentials',
              readOnly: true,
            ),
            DocumentTileWidget(
              fileName: qualifications,
              status: 'Pending',
              title: 'Qualifications',
              readOnly: true,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 70,
            ),
            CustomButtonsClass.blackButton(
                leftMargin: 0,
                rightMargin: 0,
                height: 72,
                title: "UPDATE DOCUMENTS",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, ManageDocumentScreen.id,
                      arguments: NavigationFrom.settingsScreen);
                })
          ],
        ),
      ),
    );
  }
}
