import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

import '../utils/custom_styles.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_textFields.dart';

class ContactUsScreen extends StatefulWidget {
  static const String id = 'contactUs-screen';
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>? globalKey;
  String? fullName, emailAddress, phoneNumber, message;

  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
    } else {
      // print("CheckBox Submit ");
      //  errorSnack(context, "Please Select the CheckBox");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 30),
            Text("GET IN TOUCH",
                style: CustomStyleClass.onboardingHeadingStyle.copyWith(
                    color: ColorPalette.green.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 4.8)),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.name,
              hintText: 'Enter Full Name',
              labelText: 'Full Name',
              valueText: fullName,
              validator: CustomValidationClass.nameValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.email,
              hintText: 'Enter Email Address',
              labelText: 'Email Address',
              valueText: emailAddress,
              validator: CustomValidationClass.emailValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.mobile,
              hintText: 'Enter Phone Number',
              labelText: 'Phone Number',
              valueText: phoneNumber,
              validator: CustomValidationClass.emailValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.message,
              hintText: 'Enter Your Message',
              labelText: 'Message',
              valueText: message,
              validator: CustomValidationClass.emailValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 100,
            ),
            CustomButtonsClass.blackButton(
                height: 72,
                leftMargin: 0,
                rightMargin: 0,
                title: "SUBMIT",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: _submit)
          ],
        ),
      ),
    );
  }
}
