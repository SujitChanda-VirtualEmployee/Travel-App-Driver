import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/models/address.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';



class LocationProvider with ChangeNotifier {
  double latitude = 37.421632;
  double longitude = 12.084664;
  bool permissionAllowed = false;
  TextEditingController pickupLoc = TextEditingController();
  TextEditingController dropLoc = TextEditingController();
  Address pickUpLocation = Address(), dropOffLocation = Address();
  bool loading = false;

  RideStatus rideStatus = RideStatus.idle;

  Future<Position> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latitude = position.latitude;
    longitude = position.longitude;
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);

    final addresses =
        ' ${placemark[0].street}, ${placemark[0].subLocality}, ${placemark[0].locality}, ${placemark[0].country}, ${placemark[0].postalCode}';
    pickUpLocation.placeName = addresses;
    permissionAllowed = true;
    setLocation(pickupLoc);
    notifyListeners();

    return position;
  }

  void updateRideStatus(RideStatus status) {
    rideStatus = status;
    notifyListeners();
  }

  void onCameraMove(CameraPosition cameraPosition) async {
    latitude = cameraPosition.target.latitude;
    longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  void getLatLng(double latitude, double longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
    notifyListeners();
  }

  Future<void> getMoveCamera() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);

    final addresses =
        ' ${placemark[0].street}, ${placemark[0].subLocality}, ${placemark[0].locality}, ${placemark[0].country}, ${placemark[0].postalCode}';
    pickUpLocation.placeName = addresses;
    setLocation(pickupLoc);
    notifyListeners();
  }

  clearLocation(TextEditingController text) {
    text.clear();
    notifyListeners();
  }

  setLocation(TextEditingController text) {
    text.text = pickUpLocation.placeName!;
    notifyListeners();
  }

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropOffAddress) {
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }

  Future<void> savePrefs() async {
    preferences!.setDouble('latitude', latitude);
    preferences!.setDouble('longitude', longitude);
    preferences!.setString('address', pickUpLocation.placeName!);
  }
}
