import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';

import '../utils/color_palette.dart';

class VehicleListTile extends StatefulWidget {
  final String title;
  final String distance;
  final double price;
  final String timeRequired;
  final String image;
  final bool selected;
  final Function() onTap;

  const VehicleListTile({
    Key? key,
    required this.title,
    required this.distance,
    required this.price,
    required this.timeRequired,
    required this.image,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<VehicleListTile> createState() => _VehicleListTileState();
}

class _VehicleListTileState extends State<VehicleListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: widget.selected ? ColorPalette.black : ColorPalette.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(widget.image),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    color: widget.selected
                                        ? ColorPalette.white
                                        : ColorPalette.black,
                                    fontWeight: FontWeight.bold)),
                        Text(widget.distance,
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.6)),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("\$ ${widget.price}",
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(
                                color: widget.selected
                                    ? ColorPalette.white
                                    : ColorPalette.black,
                                fontWeight: FontWeight.bold)),
                    Text(widget.timeRequired,
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(
                                fontSize: SizeConfig.textMultiplier * 1.6)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
