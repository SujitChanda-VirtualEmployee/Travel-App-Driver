import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';

class PaymentMethodTile extends StatefulWidget {
  final String cardNumber;
  final Function() ontap;
  final bool selected;
  final String imageUrl;

  const PaymentMethodTile({
    Key? key,
    required this.cardNumber,
    required this.ontap,
    required this.selected,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<PaymentMethodTile> createState() => _PaymentMethodTileState();
}

class _PaymentMethodTileState extends State<PaymentMethodTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 70,
      margin: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
      // padding: const EdgeInsets.only(right: 15, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: widget.selected ? ColorPalette.black : ColorPalette.dark),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.ontap,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: Row(children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    widget.imageUrl,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.cardNumber,
                    style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                        color: widget.selected
                            ? ColorPalette.black
                            : ColorPalette.dark),
                  ),
                ],
              ),
            ),
            widget.selected
                ? Image.asset(AssetImageClass.checkOnIcon)
                : Image.asset(AssetImageClass.checkOffIcon)
          ]),
        ),
      ),
    );
  }
}
