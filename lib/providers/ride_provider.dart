import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';

class RideProvider with ChangeNotifier {
  RideStatus rideStatus = RideStatus.idle;

  setRideStatus(RideStatus status) {
    rideStatus = status;
    notifyListeners();
  }
}
