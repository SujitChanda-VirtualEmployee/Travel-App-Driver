import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

class NewRideOfferContent extends StatefulWidget {
  const NewRideOfferContent({Key? key}) : super(key: key);

  @override
  State<NewRideOfferContent> createState() => _NewRideOfferContentState();
}

class _NewRideOfferContentState extends State<NewRideOfferContent> {


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
      height: SizeConfig.fullHeight / 2.8,
      child: Container(
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
            Expanded(
              child: SizedBox(
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
                              labelStyle: CustomStyleClass
                                  .onboardingBodyTextStyle
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
                        height: 1,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            readOnly: true,
                            controller: dropLoc,
                            decoration: InputDecoration(
                              labelText: "Drop Off ",
                              labelStyle: CustomStyleClass
                                  .onboardingBodyTextStyle
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
                        height: 1,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 20,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButtonsClass.blackButton(
                        rightMargin: 8,
                        height: 50,
                        title: "IGNORE",
                        color: Colors.grey.shade300,
                        titleStyle: CustomStyleClass.onboardingSkipButtonStyle
                            .copyWith(
                                color: ColorPalette.black,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                fontWeight: FontWeight.normal),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                Expanded(
                    child: CustomButtonsClass.blackButton(
                        leftMargin: 8,
                        height: 50,
                        title: "ACCEPT",
                        titleStyle: CustomStyleClass.onboardingSkipButtonStyle
                            .copyWith(
                                fontSize: SizeConfig.textMultiplier * 1.8),
                        onPressed: () {
                          Provider.of<RideProvider>(context, listen: false)
                              .setRideStatus(RideStatus.driverAccepted);

                          Navigator.of(context).pop(true);
                        }))
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 15,
            ),
          ],
        ),
      ),
    );
  }
}
