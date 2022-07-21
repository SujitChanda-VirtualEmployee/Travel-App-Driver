import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class AddNewCardScreen extends StatefulWidget {
  static const String id = "AddNewCard-screen";
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                    labelText: "Card Holder Name",
                    hintText: "Card Holder Name",
                    valueText: "value",
                    fieldType: FieldType.name),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 25,
                ),
                CustomTextField(
                    labelText: "Card Number",
                    hintText: "Card Number",
                    valueText: "value",
                    fieldType: FieldType.number),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                          labelText: "Expiry Date",
                          hintText: "Expiry Date",
                          valueText: "value",
                          fieldType: FieldType.number),
                    ),
                    SizedBox(
                      width: SizeConfig.heightMultiplier * 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                          labelText: "CVV",
                          hintText: "CVV",
                          valueText: "value",
                          fieldType: FieldType.number),
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomButtonsClass.blackButton(
              height: 72,
              leftMargin: 0,
              rightMargin: 0,
              title: "SAVE",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {})
        ],
      ),
    );
  }
}
