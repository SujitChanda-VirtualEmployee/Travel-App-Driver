import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/screens/forgot_password_screen.dart';
import 'package:travel_app_driver/screens/landing_screen.dart';
import 'package:travel_app_driver/screens/signup_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/custom_validations.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/custom_textFields.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState>? globalKey;
  String? _email, _password;

  void _submit() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      preferences!.setBool('_userStatus', false);
      preferences!.setString('_userAuthToken', "Bearer 1234657980");
      Navigator.pushReplacementNamed(context, LandingScreen.id);
    } else {
      // print("CheckBox Submit ");
      //  errorSnack(context, "Please Select the CheckBox");

    }
  }

  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.fullWidth,
          height: SizeConfig.fullHeight,
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
              Align(alignment: Alignment.centerLeft, child: headerSection()),
              Expanded(child: middleForm()),
              bottomSection(),
              SizedBox(
                height: SizeConfig.heightMultiplier * 30,
              )
            ],
          ),
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
          "Login",
          style: CustomStyleClass.onboardingHeadingStyle,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 10,
        ),
        Text.rich(
          TextSpan(
              text: 'Welcome to ',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.dark,
                  fontSize: SizeConfig.textMultiplier * 2.5),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Safe Ride FR',
                  style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                      color: ColorPalette.black,
                      fontSize: SizeConfig.textMultiplier * 2.5),
                ),
              ]),
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
            height: SizeConfig.heightMultiplier * 50,
          ),
          CustomTextField(
            fieldType: FieldType.email,
            hintText: 'Enter Email ID*',
            labelText: 'Email ID',
            valueText: _email,
            validator: CustomValidationClass.emailValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 30,
          ),
          CustomTextField(
            fieldType: FieldType.password,
            hintText: 'Enter Password',
            labelText: 'Password',
            valueText: _password,
            validator: CustomValidationClass.passwordValidator,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 30,
          ),
          CustomButtonsClass.skipButton(
              height: 50,
              title: "Forgot Password?",
              onPressed: () {
                Navigator.pushNamed(context, ForgotPasswordScreen.id);
              },
              widthDividedBy: 2,
              titleStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.black,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: SizeConfig.heightMultiplier * 40,
          ),
          CustomButtonsClass.blackButton(
              height: 72,
              leftMargin: 0,
              rightMargin: 0,
              title: "LOGIN",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: _submit)
        ],
      ),
    );
  }

  Widget bottomSection() {
    return Text.rich(
      TextSpan(
          text: 'New User? ',
          style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
              color: ColorPalette.dark,
              fontSize: SizeConfig.textMultiplier * 2),
          children: <InlineSpan>[
            TextSpan(
              text: 'Create an account',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.textMultiplier * 2),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignupScreen.id);
                },
            ),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
