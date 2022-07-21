import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';

import '../utils/color_palette.dart';
import '../utils/size_config.dart';

class DisplayInlineCredentials extends StatefulWidget {
  final String title;
  final String value;
  const DisplayInlineCredentials(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<DisplayInlineCredentials> createState() =>
      _DisplayInlineCredentialsState();
}

class _DisplayInlineCredentialsState extends State<DisplayInlineCredentials> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style: CustomStyleClass.onboardingBodyTextStyle
                      .copyWith(fontSize: SizeConfig.textMultiplier * 2)),
              Text(widget.value,
                  style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.black))
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
