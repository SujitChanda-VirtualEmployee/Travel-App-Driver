import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

class VerifyPinScreenContent extends StatefulWidget {
  const VerifyPinScreenContent({Key? key}) : super(key: key);

  @override
  State<VerifyPinScreenContent> createState() => _VerifyPinScreenContentState();
}

class _VerifyPinScreenContentState extends State<VerifyPinScreenContent> {


  TextEditingController pickupLoc = TextEditingController();
  TextEditingController dropLoc = TextEditingController();
  @override
  void initState() {
    pickupLoc.text = "New delhi metro station, sector 34";
    dropLoc.text = "New delhi metro station, sector 87";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: SizeConfig.fullHeight / 2.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: SizeConfig.fullHeight / 3.5,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Obiliya Milana",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                    color: ColorPalette.black,
                                  )),
                              Text("Just Now",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
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
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                color: ColorPalette.black,
                              )),
                          Text("2.2km",
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                      fontSize:
                                          SizeConfig.textMultiplier * 1.5)),
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
                Expanded(
                  child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextField(
                                controller: pickupLoc,
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: "Pick Up ",
                                  labelStyle: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.dark,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextField(
                                readOnly: true,
                                controller: dropLoc,
                                decoration: InputDecoration(
                                  labelText: "Drop Off ",
                                  labelStyle: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.dark,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 1,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              child: SizedBox(
            height: 1,
          )),
          CustomButtonsClass.blackButton(
              leftMargin: 0,
              rightMargin: 0,
              height: 72,
              title: "VERIFY PIN",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {
                Provider.of<RideProvider>(context, listen: false)
                    .setRideStatus(RideStatus.onPickupLocation);
                // setState(() {
                //   rideStatus = RideStatus.onPickupLocation;
                // });
                Navigator.of(context).pop(true);
                //  Navigator.pushNamed(context, RideVerifyPinScreen.id);
              })
        ],
      ),
    );
  }
}
