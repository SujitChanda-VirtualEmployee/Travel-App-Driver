import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/update_account.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import '../widgets/display_inline_credentials.dart';
import '../widgets/navigationWidget/navigation_bar.dart';

class WalletScreen extends StatefulWidget {
  static const String id = "wallet-screen";
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Wallet"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SizedBox(
      height: SizeConfig.fullHeight,
      width: SizeConfig.fullWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 30),
          Column(
            children: const [
              DisplayInlineCredentials(
                  title: "Account holder name", value: "CK Rana"),
              DisplayInlineCredentials(
                  title: "Routing Number", value: "XXXXX12"),
              DisplayInlineCredentials(
                  title: "Account Number", value: "XXXX XXXX XXXX 1234"),
            ],
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 200),
          CustomButtonsClass.blackButton(
              height: 71,
              title: "UPDATE ACCOUNT",
              titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, UpdateAccountScreen.id);
              }),
        ],
      ),
    );
  }
}
