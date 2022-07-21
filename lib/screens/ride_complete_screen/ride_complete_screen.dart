import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/screens/ride_rating_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../../providers/ride_provider.dart';

class RideCompleteScreen extends StatefulWidget {
  static const String id = 'rideComplete-screen';
  const RideCompleteScreen({Key? key}) : super(key: key);

  @override
  State<RideCompleteScreen> createState() => _RideCompleteScreenState();
}

class _RideCompleteScreenState extends State<RideCompleteScreen> {
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
      backgroundColor: ColorPalette.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.white,
            )),
        elevation: 0,
        backgroundColor: ColorPalette.black,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: ColorPalette.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 10,
            ),
            Container(
              height: SizeConfig.heightMultiplier * 100,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 15),
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
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Obiliya Milana",
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                color: ColorPalette.black,
                              )),
                          Text("Just Now",
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                      fontSize:
                                          SizeConfig.textMultiplier * 1.5)),
                        ],
                      )
                    ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$ 2.5",
                          style:
                              CustomStyleClass.onboardingBodyTextStyle.copyWith(
                            color: ColorPalette.black,
                          )),
                      Text("2.2km",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.5)),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            SizedBox(
              height: SizeConfig.heightMultiplier * 30,
            ),
            CustomButtonsClass.blackButton(
                height: 72,
                title: "ARRIVED SAFE",
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                onPressed: () {
                  Provider.of<RideProvider>(context, listen: false)
                      .setRideStatus(RideStatus.onDropLocatopn);

                  Get.toNamed(RideRatingScreen.id);

                  //Navigator.pop(context);
                }),
            SizedBox(
              height: SizeConfig.heightMultiplier * 60,
            ),
          ]),
          Positioned(
            top: -(SizeConfig.heightMultiplier * 15),
            left: 10,
            right: 10,
            child: printHalfCircles(),
          ),
          Positioned(
            bottom: -(SizeConfig.heightMultiplier * 15),
            left: 10,
            right: 10,
            child: printHalfCircles(),
          )
        ],
      ),
    );
  }

  Widget printHalfCircles() {
    double totalWidth = SizeConfig.fullHeight - 30;
    double remainingLength = 0;
    double circleSize = SizeConfig.heightMultiplier * 25;
    List<Widget> circleList = [];

    while (remainingLength < totalWidth) {
      // log(remainingLength.toString());
      circleList.add(Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: ColorPalette.black),
        height: SizeConfig.heightMultiplier * 25,
        width: SizeConfig.heightMultiplier * 25,
      ));
      remainingLength = (remainingLength + circleSize * 4);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: circleList,
    );
    //return Container();
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
}
