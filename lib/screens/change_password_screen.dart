import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/landing_screen.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = 'changePassword-screen';
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>? globalKey;
  String? oldPassword, newPassword, newConfPassword;

  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      Navigator.pushReplacementNamed(context, LandingScreen.id);
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
        title: const Text("Change Passwords"),
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
            SizedBox(
              height: SizeConfig.heightMultiplier * 50,
            ),
            CustomTextField(
              fieldType: FieldType.password,
              hintText: 'Enter Old Password*',
              labelText: 'Old Password',
              valueText: oldPassword,
              validator: CustomValidationClass.passwordValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.password,
              hintText: 'Enter New Password*',
              labelText: 'New Password',
              valueText: newPassword,
              validator: CustomValidationClass.passwordValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomTextField(
              fieldType: FieldType.password,
              hintText: 'Enter Confirm NewPassword*',
              labelText: 'Confirm New Password',
              valueText: newConfPassword,
              validator: CustomValidationClass.passwordValidator,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 80,
            ),
            CustomButtonsClass.blackButton(
                height: 72,
                leftMargin: 0,
                rightMargin: 0,
                title: "SAVE",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: _submit)
          ],
        ),
      ),
    );
  }
}
