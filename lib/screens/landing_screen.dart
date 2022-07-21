import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/location_provider.dart';
import 'package:travel_app_driver/screens/home_screen/home_screen.dart';
import 'package:travel_app_driver/screens/location_permission_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';

import '../utils/color_palette.dart';

class LandingScreen extends StatefulWidget {
  static const String id = 'landing-screen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController anim_controller;
  String? currentLocation;
  late LocationProvider locationData;
  void locatePosition(BuildContext context) async {
    bool serviceEnabled;

    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(
          context,
          LocationPermissionScreen.id,
          arguments: ["Alert!", "Location services are disabled."],
        );
      });
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(
          context,
          LocationPermissionScreen.id,
          arguments: ["Alert!", "Location permissions are denied."],
        );
      });
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(
          context,
          LocationPermissionScreen.id,
          arguments: ["Alert!", "Location permissions are permanently denied."],
        );
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    setAddressLine(position);
  }

  setAddressLine(Position position) async {
    try {
      setState(() {
        locationData.loading = true;
      });
      await locationData.getCurrentPosition();
      if (locationData.permissionAllowed == true) {
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (route) => false);
        });
        setState(() {
          locationData.loading = false;
        });
      } else {
        // print('permission not allowed');
        setState(() {
          locationData.loading = false;
        });
      }
    } catch (e) {
      log("Location Error : $e");
      setState(() {
        currentLocation =
            'Please tap on location icon to get current location!';
      });
    }
  }

  @override
  void initState() {
    anim_controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    locationData = Provider.of<LocationProvider>(context, listen: false);
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => locatePosition(context));
  }

  @override
  void dispose() {
    anim_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(
              child: SpinKitPulse(
                color: ColorPalette.green,
                size: 200.0,
              ),
            ),
            Center(
              child: SizedBox(
                height: 100,
                //margin: EdgeInsets.only(bottom: 40),
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(anim_controller),
                  child: Image.asset(
                    AssetImageClass.navigationIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoPicture({
    required double height,
    required double width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(AssetImageClass.loginAppLogo),
    );
  }
}
