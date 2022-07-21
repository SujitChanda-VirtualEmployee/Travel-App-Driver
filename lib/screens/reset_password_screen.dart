import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travel_app_driver/screens/login_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = 'resetPassword-screen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController pinEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>? globalKey;

  String? newPassword, confirm_new_password;
  String error = '';
  bool otpSubmit = false;

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      EasyLoading.show(status: "Saving new password...");
      Future.delayed(const Duration(milliseconds: 2000), () {
        EasyLoading.showSuccess(
          "Passweord Reset Successful!",
        );
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.id, (route) => false);
      });
    } else {
      // print("CheckBox Submit ");
      //  errorSnack(context, "Please Select the CheckBox");

    }
  }

  showAlertDialog({
    required BuildContext context,
    required String title,
    required String body,
    required bool closeButtonOnly,
  }) {
    Widget okButton = CupertinoDialogAction(
        child: Text(
          "CLOSE",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        });
    Widget optionalButton = CupertinoDialogAction(
        child: Text(
          "OK",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        });
    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title,
          style: CustomStyleClass.onboardingHeadingStyle
              .copyWith(color: ColorPalette.error)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(body, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
      actions: [
        // okButton,
        optionalButton,
        //closeButtonOnly == false ? optionalButton : SizedBox(),
      ],
    );

    // show the dialog
    showCupertinoDialog(
      barrierDismissible: false,
      barrierLabel: "50",
      context: context,
      builder: (BuildContext context1) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Reset Password"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.black,
            )),
        elevation: 0,
      ),
      body: SizedBox(
        height: SizeConfig.fullHeight,
        width: SizeConfig.fullWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Set your new Password.",
                      style: CustomStyleClass.onboardingBodyTextStyle),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 40,
                ),
                CustomTextField(
                    labelText: "New Password",
                    hintText: "Enter New Password",
                    valueText: newPassword,
                    validator: CustomValidationClass.passwordValidator,
                    fieldType: FieldType.password),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 30,
                ),
                CustomTextField(
                    labelText: "Confirm New Password",
                    hintText: "Enter Confirm New Password",
                    valueText: confirm_new_password,
                    validator: CustomValidationClass.passwordValidator,
                    fieldType: FieldType.password),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 80,
                ),
                CustomButtonsClass.blackButton(
                  leftMargin: 0,
                  rightMargin: 0,
                  height: 72,
                  title: "SAVE",
                  titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                  onPressed: _submit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
