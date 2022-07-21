import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app_driver/screens/home_screen/components/sheet_contents/new_ride_offer_sheet_content.dart';
import 'package:travel_app_driver/screens/home_screen/components/sheet_contents/start_ride_sheet_content.dart';
import 'package:travel_app_driver/screens/home_screen/components/sheet_contents/verify_pin_sheet_content.dart';
import 'package:travel_app_driver/screens/new_booking_details_screen.dart';
import 'package:travel_app_driver/screens/ride_verify_pin_screen.dart';

class HomeScreenSheets {
  static showNewRideOfferSheet(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const NewRideOfferContent();
        }).then((val) {
      log("=============================================================");
      if (val != null) {
        if (val == true) {
          Get.toNamed(NewBookingDetailsScreen.id);
          // Navigator.pushNamed(context, NewBookingDetailsScreen.id);
        }
      }
    });
  }

  static verifyPinSheet(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const VerifyPinScreenContent();
        }).then((val) {
      log("=============================================================");
      if (val != null) {
        if (val == true) {
          Get.toNamed(RideVerifyPinScreen.id);
          // Navigator.pushNamed(context, RideVerifyPinScreen.id);
        }
      } else {
        Get.toNamed(NewBookingDetailsScreen.id);
      }
    });
  }

  static showStartRideheet(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return const StartRideSheetContent();
        }).then((val) {
      if (val != null) {
        if (val == true) {
          // showConfirmPickupSheet(context);
        }
      } else {
        showNewRideOfferSheet(context);
      }
    });
  }
}
