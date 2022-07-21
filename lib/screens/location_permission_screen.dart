import 'dart:developer';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/providers/location_provider.dart';
import 'package:travel_app_driver/screens/home_screen/home_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import '../utils/asset_images_strings.dart';

class LocationPermissionScreen extends StatefulWidget {
  static const String id = 'locationPermission-screen';
  final String title;
  final String body;
  const LocationPermissionScreen(
      {Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  String? currentLocation;
  late LocationProvider locationData;
  void locatePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locatePosition();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await permission_handler.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setAddressLine(position);
  }

  setAddressLine(Position position) async {
    try {
      await locationData.getCurrentPosition();
      if (locationData.permissionAllowed == true) {
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.id, (route) => false);
        });
        if (mounted) {
          setState(() {
            locationData.loading = false;
          });
        }
      } else {
        //  print('permission not allowed');
        if (mounted) {
          setState(() {
            locationData.loading = false;
          });
        }
      }
    } catch (e) {
      log("Location Error : $e");
      if (mounted) {
        setState(() {
          currentLocation =
              'Please tap on location icon to get current location!';
        });
      }
    }
  }

  displaySnackNat(String title, String body) {
    var snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: body,
        contentType: ContentType.failure,
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    locationData = Provider.of<LocationProvider>(context, listen: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => displaySnackNat(widget.title, widget.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 1),
              Text(
                "Need Location Permission!",
                style: CustomStyleClass.onboardingHeadingStyle,
              ),
              Stack(
                children: [
                  const Center(
                    child: SpinKitPulse(
                      color: ColorPalette.green,
                      size: 180.0,
                    ),
                  ),
                  Positioned.fill(
                    child: Image.asset(
                      AssetImageClass.navigationIcon,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
              Platform.isAndroid
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("This app collects location data to enable \n",
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    color: ColorPalette.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.textMultiplier * 2)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            children: [
                              Image.asset(AssetImageClass.checkOnIcon),
                              const SizedBox(width: 5),
                              Text("The Customer and admin to get your ETA",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            children: [
                              Image.asset(AssetImageClass.checkOnIcon),
                              const SizedBox(width: 5),
                              Text("Exact location and",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            children: [
                              Image.asset(AssetImageClass.checkOnIcon),
                              const SizedBox(width: 5),
                              Text("Routes",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2))
                            ],
                          ),
                        ),
                        Text(
                            "\nEven when the app is closed or not in use.\n\n"
                            "Please Select 'Allow all the time' option From Location Permission Section to facilitate and enhance the meeting with the Customer at the meeting point.",
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    color: ColorPalette.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.textMultiplier * 2))
                      ],
                    )
                  : Text(
                      "For a reliable ride, Safe Ride SF collects location data from the time you open the app untill a trip ends, This improves pickup, support, and more. Need Location Permission to get your Current Location to set Pickup location.",
                      textAlign: TextAlign.center,
                      style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                          color: ColorPalette.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.textMultiplier * 2)),
              CustomButtonsClass.blackButton(
                  height: 72,
                  leftMargin: 0,
                  rightMargin: 0,
                  title: "ACCEPT",
                  titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                  onPressed: () {
                    locatePosition();
                  }),
              const SizedBox(height: 1),
            ]),
      ),
    );
  }
}
