import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/add_card_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:travel_app_driver/widgets/payment_method_tile.dart';

class PaymentMethodScreen extends StatefulWidget {
  static const String id = 'paymentMethod-screen';
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool selected1 = true, selected2 = false, selected3 = true, selected4 = false;
  List<bool> selectedList = [true, false, false, false];
  List<String> cardNumberList = [
    "XXXX XXXX XXXX 1234",
    "XXXX XXXX XXXX 2345",
    "XXXX XXXX XXXX 3456",
    "XXXX XXXX XXXX 4567"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          shrinkWrap: true,
          itemCount: cardNumberList.length,
          itemBuilder: (BuildContext context, int index) {
            return PaymentMethodTile(
              cardNumber: cardNumberList[index],
              ontap: () {
                for (int i = 0; i < selectedList.length; i++) {
                  selectedList[i] = false;
                }
                selectedList[index] = true;
                setState(() {});
              },
              selected: selectedList[index],
              imageUrl: AssetImageClass.navigationIcon,
            );
          },
        )),
        CustomButtonsClass.blackButton(
            height: 72,
            title: "ADD CARD",
            titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
            onPressed: () {
              Navigator.pushNamed(context, AddNewCardScreen.id);
            }),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
