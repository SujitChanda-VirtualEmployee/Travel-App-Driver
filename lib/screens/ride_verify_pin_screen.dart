import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';
import 'package:travel_app_driver/screens/home_screen/components/all_sheets.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../utils/custom_styles.dart';

class RideVerifyPinScreen extends StatefulWidget {
  static const String id = 'rideVerifyPin-screen';
  const RideVerifyPinScreen({Key? key}) : super(key: key);

  @override
  State<RideVerifyPinScreen> createState() => _RideVerifyPinScreenState();
}

class _RideVerifyPinScreenState extends State<RideVerifyPinScreen> {
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
        Navigator.of(context, rootNavigator: false).pop();
        HomeScreenSheets.showStartRideheet(context);
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
      appBar: AppBar(
        elevation: 0,
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
    return SizedBox(
      height: SizeConfig.fullHeight,
      width: SizeConfig.fullWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 40,
            ),
            Image.asset(AssetImageClass.keypadIcon),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
            ),
            Text("Enter Obiliya Milana's Pin",
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
              height: SizeConfig.heightMultiplier * 70,
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
    );
  }
}
