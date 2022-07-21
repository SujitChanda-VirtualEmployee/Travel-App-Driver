
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';
import 'package:travel_app_driver/screens/reset_password_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import 'manage_screens/manage_vehicle_screen/manage_vehicle_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const String id = 'otpVerification-screen';
  final NavigationFrom from;
  const OtpVerificationScreen({Key? key, required this.from}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinEditingController = TextEditingController();
  GlobalKey<ScaffoldState>? globalKey;

  String smsOtp = "";
  String error = '';
  bool otpSubmit = false;
  final pinputFocusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    margin: const EdgeInsets.only(left: 5, right: 5),
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorPalette.black,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
  );

  var focusedPinTheme;
  var submittedPinTheme;

  @override
  void initState() {
    super.initState();
    focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(),
    );
    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    pinputFocusNode.requestFocus();
  }

  void _submit() {
    if (smsOtp.length < 4) {
      showAlertDialog(
          context: context,
          closeButtonOnly: true,
          title: "Alert!",
          body: '\n\u2022 Please enter 4 digit OTP');
    } else if (smsOtp != "0000") {
      showAlertDialog(
          context: context,
          closeButtonOnly: false,
          title: 'Error!',
          body: '\n\u2022 Wrong OTP!  Please try again.');
    } else {
      EasyLoading.show(status: "Verifying OTP ...");
      Future.delayed(const Duration(milliseconds: 2000), () {
        EasyLoading.showSuccess(
          "OTP Verified!",
        );
        if (widget.from == NavigationFrom.forgotPasswordScreen) {
          Navigator.pushNamed(context, ResetPasswordScreen.id);
        } else if (widget.from == NavigationFrom.signUpScreen) {
          //  preferences!.setString("_registrationStatus", RegistrationStatus.vehicleDetailsDone.toString()); //

          Navigator.of(context)
            ..pop()
            ..pop();
          Navigator.pushNamed(context, ManageVehicleScreen.id);
        }
      });
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
    List<Widget> actionList = [];
    if (closeButtonOnly) {
      actionList.add(okButton);
    } else {
      actionList.add(okButton);
      actionList.add(optionalButton);
    }
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
      actions: actionList,
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
  void dispose() {
    super.dispose();
    pinputFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Verification"),
        elevation: 0,
      ),
      body: SizedBox(
        height: SizeConfig.fullHeight,
        width: SizeConfig.fullWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 20,
              ),
              Text("We have sent verification code on your mobile number.",
                  style: CustomStyleClass.onboardingBodyTextStyle),
              SizedBox(
                height: SizeConfig.heightMultiplier * 40,
              ),
              Pinput(
                focusNode: pinputFocusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                controller: _pinEditingController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                showCursor: true,
                onChanged: (pin) {
                  setState(() {
                    smsOtp = pin;
                  });
                },
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 30,
              ),
              CustomButtonsClass.skipButton(
                  height: 50,
                  title: "Resend OTP",
                  onPressed: () {
                    //Navigator.pushNamed(context, ForgotPasswordScreen.id);
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
                leftMargin: 0,
                rightMargin: 0,
                height: 72,
                title: "VERIFY",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
