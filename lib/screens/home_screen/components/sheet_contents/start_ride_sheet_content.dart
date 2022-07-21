import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

class StartRideSheetContent extends StatefulWidget {
  const StartRideSheetContent({Key? key}) : super(key: key);

  @override
  State<StartRideSheetContent> createState() => _StartRideSheetContentState();
}

class _StartRideSheetContentState extends State<StartRideSheetContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.fullHeight / 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Your ride is verified",
                style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.black,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                color: Colors.indigo.shade400,
                child: Center(child: Image.asset(AssetImageClass.shieldIcon)),
              ),
            ),
            CustomButtonsClass.blackButton(
              height: 72,
              onPressed: () {
                Provider.of<RideProvider>(context, listen: false)
                    .setRideStatus(RideStatus.onRide);

                Navigator.of(context).pop(true);

                // Navigator.pop(context);
              },
              title: 'START RIDE',
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
