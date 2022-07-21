import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travel_app_driver/screens/otp_verification_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class SignupScreen extends StatefulWidget {
  static const String id = 'signup-screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>? globalKey;

  String? _firstName, _lastName, _mobile, _email, _password, _confirmPassword;
  bool? checkBoxSubmit;
  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      if (checkBoxSubmit == true) {
        EasyLoading.show(status: "Signing up ...");
        Future.delayed(const Duration(milliseconds: 2000), () {
          EasyLoading.showSuccess(
            "Signup Successful!",
          );
          Navigator.pushNamed(context, OtpVerificationScreen.id,
              arguments: NavigationFrom.signUpScreen);
        });
      } else {
        showAlertDialogForError(context,
            '\n\u2022 CheckBox is Not selected.\n\nPlease select CheckBook To proceed.');
      }
    } else {
      //  print("CheckBox Submit ");
      //  errorSnack(context, "Please Select the CheckBox");

    }
  }

  showAlertDialogForError(BuildContext context, String title) {
    // set up the button
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

    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text("Alert !",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: ColorPalette.black)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context1) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey<ScaffoldState>();
    checkBoxSubmit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                  ),
                  logoPicture(
                      height: SizeConfig.imageSizeMultiplier * 45,
                      width: SizeConfig.imageSizeMultiplier * 50),
                  Align(
                      alignment: Alignment.centerLeft, child: headerSection()),
                  middleForm(),
                  bottomSection(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 30,
                  )
                ],
              ),
            ),
            const Positioned(
                top: 0, left: 0, child: SafeArea(child: BackButton()))
          ],
        ),
      ),
    );
  }

  Widget logoPicture({
    required double height,
    required double width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(AssetImageClass.loginAppLogo),
    );
  }

  Widget headerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sign up",
          style: CustomStyleClass.onboardingHeadingStyle,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 10,
        ),
        Text.rich(
          TextSpan(
            text: 'Enter your personal details. ',
            style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.dark,
                fontSize: SizeConfig.textMultiplier * 2.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget middleForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 30,
          ),
          CustomTextField(
            fieldType: FieldType.name,
            hintText: 'Enter First Name',
            labelText: 'First Name',
            valueText: _firstName,
            validator: CustomValidationClass.nameValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
          ),
          CustomTextField(
            fieldType: FieldType.name,
            hintText: 'Enter Last Name',
            labelText: 'Last Name',
            valueText: _lastName,
            validator: CustomValidationClass.nameValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
          ),
          CustomTextField(
            fieldType: FieldType.mobile,
            hintText: 'Enter Mobile Number',
            labelText: 'Mobile Number',
            valueText: _mobile,
            validator: CustomValidationClass.phoneValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
          ),
          CustomTextField(
            fieldType: FieldType.email,
            hintText: 'Enter Email ID*',
            labelText: 'Email ID',
            valueText: _email,
            validator: CustomValidationClass.emailValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
          ),
          CustomTextField(
            fieldType: FieldType.password,
            hintText: 'Enter Password',
            labelText: 'Password',
            valueText: _password,
            validator: CustomValidationClass.passwordValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
          ),
          CustomTextField(
            fieldType: FieldType.password,
            hintText: 'Enter Confirm Password',
            labelText: 'Confirm Password',
            valueText: _confirmPassword,
            validator: CustomValidationClass.passwordValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 20,
          ),
          _checkBox(),
          SizedBox(
            height: SizeConfig.heightMultiplier * 40,
          ),
          CustomButtonsClass.blackButton(
              height: 72,
              leftMargin: 0,
              rightMargin: 0,
              title: "SIGN UP",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: _submit),
        ],
      ),
    );
  }

  Widget _checkBox() {
    return Padding(
      padding: EdgeInsets.only(
          top: 0.5 * SizeConfig.heightMultiplier,
          bottom: 0.5 * SizeConfig.heightMultiplier),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: checkBoxSubmit,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            onChanged: (value) {
              setState(() {
                checkBoxSubmit = !checkBoxSubmit!;
              });
            },
            activeColor: ColorPalette.black,
            checkColor: Colors.white,
            tristate: false,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 15),
                Text.rich(TextSpan(
                    text: 'Click here to agree that you have read the ',
                    style: CustomStyleClass.onboardingBodyTextStyle
                        .copyWith(fontSize: SizeConfig.textMultiplier * 2),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(fontSize: SizeConfig.textMultiplier * 2)
                            .copyWith(color: ColorPalette.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Container(),
                      ),
                      TextSpan(
                        text: 'of',
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(fontSize: SizeConfig.textMultiplier * 2)
                            .copyWith(color: ColorPalette.dark),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Container(),
                      ),
                      TextSpan(
                        text: 'Safe Ride FR',
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(fontSize: SizeConfig.textMultiplier * 2)
                            .copyWith(color: ColorPalette.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Container(),
                      )
                    ])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSection() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 40,
        ),
        Text.rich(
          TextSpan(
              text: 'Already have an account? ',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.dark,
                  fontSize: SizeConfig.textMultiplier * 2),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Login',
                  style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                      color: ColorPalette.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.textMultiplier * 2),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
              ]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
