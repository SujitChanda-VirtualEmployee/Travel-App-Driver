import 'package:flutter/material.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/screens/landing_screen.dart';
import 'package:travel_app_driver/screens/onboarding_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (preferences!.containsKey('_userAuthToken')) {
        if (preferences!.getString('_userAuthToken') != null) {
          Navigator.pushReplacementNamed(context, LandingScreen.id);
        } else {
          Navigator.pushReplacementNamed(context, OnboardingScreen.id);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnboardingScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SizedBox(
        height: SizeConfig.fullHeight,
        width: SizeConfig.fullWidth,
        child: Center(
          child: Image.asset(
            AssetImageClass.splashAppLogo,
            width: SizeConfig.fullWidth / 1.5,
          ),
        ),
      ),
    );
  }
}
