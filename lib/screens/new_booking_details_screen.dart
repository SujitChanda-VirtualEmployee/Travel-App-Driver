import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/screens/home_screen/components/all_sheets.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../constants.dart';
import '../utils/asset_images_strings.dart';

class NewBookingDetailsScreen extends StatefulWidget {
  static const String id = 'newBookingDetails-screen';
  const NewBookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewBookingDetailsScreen> createState() =>
      _NewBookingDetailsScreenState();
}

class _NewBookingDetailsScreenState extends State<NewBookingDetailsScreen> {
  TextEditingController pickupLoc = TextEditingController();
  TextEditingController dropLoc = TextEditingController();
  TextEditingController notes = TextEditingController();
  @override
  void initState() {
    pickupLoc.text = "New delhi metro station, sector 34";
    dropLoc.text = "New delhi metro station, sector 87";
    notes.text =
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          title: const Text("#123456789"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorPalette.black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoSwitch(
                activeColor: ColorPalette.green,
                trackColor: ColorPalette.black,
                value: preferences!.getBool('_userStatus')!,
                onChanged: (newValue) => setState(() {
                  preferences!.setBool('_userStatus', newValue);
                  if (preferences!.getBool('_userStatus')!) {
                  } else {}
                }),
              ),
            ),
          ]),
      body: body(),
    );
  }

  Widget body() {
    return SizedBox(
      height: SizeConfig.fullHeight,
      width: SizeConfig.fullWidth,
      child: Column(children: [
        Container(
          height: SizeConfig.heightMultiplier * 100,
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 70,
                    width: SizeConfig.heightMultiplier * 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AssetImageClass.userLogo),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Obiliya Milana",
                          style:
                              CustomStyleClass.onboardingBodyTextStyle.copyWith(
                            color: ColorPalette.black,
                          )),
                      Text("Just Now",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.5)),
                    ],
                  )
                ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$ 2.5",
                      style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                        color: ColorPalette.black,
                      )),
                  Text("2.2km",
                      style: CustomStyleClass.onboardingBodyTextStyle
                          .copyWith(fontSize: SizeConfig.textMultiplier * 1.5)),
                ],
              )
            ],
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 10,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 155,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: pickupLoc,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Pick Up ",
                    labelStyle: CustomStyleClass.onboardingBodyTextStyle
                        .copyWith(
                            color: ColorPalette.dark,
                            fontSize: SizeConfig.textMultiplier * 2),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  readOnly: true,
                  controller: dropLoc,
                  decoration: InputDecoration(
                    labelText: "Drop Off ",
                    labelStyle: CustomStyleClass.onboardingBodyTextStyle
                        .copyWith(
                            color: ColorPalette.dark,
                            fontSize: SizeConfig.textMultiplier * 2),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 10,
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextField(
            maxLines: 3,
            readOnly: true,
            controller: notes,
            decoration: InputDecoration(
              labelText: "Notes ",
              labelStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.dark,
                  fontSize: SizeConfig.textMultiplier * 2),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        amountSection(
            amountPay: '\$ 2.5', discount: '\$ 1.5', totalPay: '\$ 1.0'),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: Row(
            children: [
              Expanded(
                  child: inLineButtons(
                      color: Colors.green,
                      icon: CupertinoIcons.phone,
                      onTap: () {
                        makePhoneCall("+1 99999 99999");
                      },
                      title: 'Call')),
              Expanded(
                  child: inLineButtons(
                      color: Colors.blue,
                      icon: CupertinoIcons.text_bubble,
                      onTap: () {
                        sendSms("+1 99999 99999");
                      },
                      title: 'Message')),
              Expanded(
                  child: inLineButtons(
                      color: Colors.red,
                      icon: Icons.close,
                      onTap: () {
                        Provider.of<RideProvider>(context, listen: false)
                            .setRideStatus(RideStatus.idle);
                        Navigator.pop(context);
                      },
                      title: 'Cancel')),
            ],
          ),
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        const Expanded(
            child: SizedBox(
          height: 1,
        )),
        CustomButtonsClass.blackButton(
            height: 72,
            title: "GO TO PICK UP",
            titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
            onPressed: () {
              Provider.of<RideProvider>(context, listen: false)
                  .setRideStatus(RideStatus.goingToPickup);

              Navigator.of(context, rootNavigator: false).pop();
              HomeScreenSheets.verifyPinSheet(context);
              //Navigator.pop(context);
            }),
        const Expanded(
            child: SizedBox(
          height: 1,
        ))
      ]),
    );
  }

  Widget amountSection({
    required String amountPay,
    required String discount,
    required String totalPay,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 5,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Amount',
            style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.dark,
                fontSize: SizeConfig.textMultiplier * 1.6),
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amount Pay',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
            Text(
              amountPay,
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
            Text(
              discount,
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 5,
        ),
        const Divider(
          thickness: 1,
          height: 15,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Pay',
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
            Text(
              totalPay,
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.textMultiplier * 2),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 15,
        ),
      ]),
    );
  }

  Widget inLineButtons({
    required Color color,
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return Container(
      height: SizeConfig.heightMultiplier * 80,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          Text(
            title,
            style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                color: ColorPalette.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.textMultiplier * 2),
          )
        ]),
      ),
    );
  }
}
