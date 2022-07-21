import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/login_screen.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../utils/asset_images_strings.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onboarding-screen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController(
    initialPage: 0,
  );

  int currentPage = 0;

  List<String> onboardingIndicators = [
    AssetImageClass.bottomSliderOne,
    AssetImageClass.bottomSliderTwo,
    AssetImageClass.bottomSliderThree,
  ];

  List<Widget> pages(BuildContext context) {
    return [
      Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
                width: SizeConfig.fullWidth,
                child: Image.asset(AssetImageClass.introImageOne)),
          ),
          Expanded(
            flex: 5,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "Accept a Job",
                    style: CustomStyleClass.onboardingHeadingStyle,
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece, making it over 2000 years old. ",
                    textAlign: TextAlign.center,
                    style: CustomStyleClass.onboardingBodyTextStyle,
                  )),
              CustomButtonsClass.skipButton(
                height: 50,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                title: 'Skip',
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                widthDividedBy: 2,
              )
            ]),
          ),
          //const Expanded(flex: 2, child: SizedBox())
        ],
      ),
      Column(
        children: [
          Expanded(
              flex: 5,
              child: SizedBox(
                  width: SizeConfig.fullWidth,
                  child: Image.asset(AssetImageClass.introImageTwo))),
          Expanded(
            flex: 5,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "Tracking Realtime",
                    style: CustomStyleClass.onboardingHeadingStyle,
                  )),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece, making it over 2000 years old. ",
                    textAlign: TextAlign.center,
                    style: CustomStyleClass.onboardingBodyTextStyle,
                  )),
              CustomButtonsClass.skipButton(
                height: 50,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                title: 'Skip',
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                widthDividedBy: 2,
              )
            ]),
          ),
        ],
      ),
      Column(
        children: [
          Expanded(
              flex: 5,
              child: SizedBox(
                  width: SizeConfig.fullWidth,
                  child: Image.asset(AssetImageClass.introImageThree))),
          Expanded(
            flex: 5,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    "Earn Money",
                    style: CustomStyleClass.onboardingHeadingStyle,
                  )),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece, making it over 2000 years old. ",
                      textAlign: TextAlign.center,
                      style: CustomStyleClass.onboardingBodyTextStyle,
                    )),
              ),
              CustomButtonsClass.blackButton(
                height: 72,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                title: 'GET STARTED',
                titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 60,
              )
            ]),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _controller,
              children: pages(context),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Image.asset(onboardingIndicators[currentPage]),
          SizedBox(
            height: SizeConfig.heightMultiplier * 20,
          )
        ],
      ),
    );
  }
}
