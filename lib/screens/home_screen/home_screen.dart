import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/providers/location_provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/screens/home_screen/components/all_sheets.dart';
import 'package:travel_app_driver/screens/new_booking_details_screen.dart';
import 'package:travel_app_driver/screens/ride_complete_screen/ride_complete_screen.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey closeKey = GlobalKey();
  late List<FocusNode> focusNodes;
  final List<FocusNode> overlayKeys = <FocusNode>[
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  late AnimationController anim_controller;
  GoogleMapController? _mapController;
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markersSet = Set<Marker>();
  double containerHeight = 400;
  Set<Polyline> polylineSet = Set<Polyline>();
  List<LatLng> polylineCorOrdinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor? animatingMarkerIcon;
  String? status = "";
  String durationRide = "";
  bool isRequestingDirection = false;
  LatLng currentLocation = const LatLng(37.421632, 122.084664);
  late Timer timer;
  double currentLat = 0, currentLng = 0;
  bool semaphore = false;
  bool _locating = false;
  int durationCounter = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String customerToken = "";
  double riderDetailsSheetHeight = 0;
  String onlineStatus = "Offline";

  DraggableScrollableController dragController =
      DraggableScrollableController();
  final minChildSize = 0.2;

  void animatedHide() {
    dragController.animateTo(
      minChildSize,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOutBack,
    );
  }

  CameraPosition kLake = const CameraPosition(
      // bearing: 192.8334901395799,
      tilt: 20,
      target: LatLng(22.609464, 88.427546),
      zoom: 14);

  Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
      BuildContext context, String assetName, double size) async {
    String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);

    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, "");

    // ignore: use_build_context_synchronously
    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    double width = size * devicePixelRatio;
    double height = size * devicePixelRatio;

    ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));

    ui.Image image = await picture.toImage(width.toInt(), height.toInt());
    ByteData bytes = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData>);
    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  @override
  void initState() {
    focusNodes = List<FocusNode>.generate(
      18,
      (int i) => FocusNode(debugLabel: 'Onboarding Focus Node $i'),
      growable: false,
    );
    if (preferences!.getBool('_userStatus')!) {
      onlineStatus = "Online";
    } else {
      onlineStatus = "Offline";
    }
    anim_controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    dragController = DraggableScrollableController();
    super.initState();
  }

  @override
  void dispose() {
    anim_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final locationData = Provider.of<LocationProvider>(context);

    setState(() {
      currentLocation = LatLng(Provider.of<LocationProvider>(context).latitude,
          Provider.of<LocationProvider>(context).longitude);
    });

    Future<void> _goToTheLake() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: currentLocation,
        zoom: 18,
      )));
    }

    void onCreated(GoogleMapController controller) {
      _controller.complete(controller);
      _mapController = controller;
      _goToTheLake();
    }

    return Consumer<LocationProvider>(builder: (context, locationData, child) {
      return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: const CustomNavigationBar(),
        floatingActionButton: preferences!.getBool('_userStatus')!
            ? Container(
                padding: const EdgeInsets.only(bottom: 0),
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: RotationTransition(
                      turns:
                          Tween(begin: 0.0, end: 1.0).animate(anim_controller),
                      child: const Icon(Icons.my_location_rounded,
                          color: ColorPalette.black),
                    ),
                    onPressed: () {
                      anim_controller.forward();
                      locationData.getCurrentPosition().then((value) {
                        _mapController!
                            .animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                          target: LatLng(value.latitude, value.longitude),
                          zoom: 18,
                        )))
                            .then((value) {
                          anim_controller.reset();
                        });
                        setState(() {});
                      });
                    }),
              )
            : null,
        appBar: AppBar(
          elevation: 02,
          title: Text(onlineStatus),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoSwitch(
                activeColor: ColorPalette.green,
                trackColor: ColorPalette.black,
                value: preferences!.getBool('_userStatus')!,
                onChanged: (newValue) => setState(() {
                  preferences!.setBool('_userStatus', newValue);
                  if (preferences!.getBool('_userStatus')!) {
                    onlineStatus = "Online";
                  } else {
                    onlineStatus = "Offline";
                  }
                }),
              ),
            ),
          ],
          centerTitle: true,
          leading: IconButton(
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
              icon: const Icon(Icons.menu)),
        ),
        body: Stack(
          children: [
            GoogleMap(
              key: widget.key,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 18,
              ),
              zoomControlsEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(1.5, 20.8),
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              mapToolbarEnabled: true,
              onCameraMove: (CameraPosition position) {
                setState(() {
                  _locating = true;
                });
                locationData.onCameraMove(position);
              },
              onMapCreated: onCreated,
              onCameraIdle: () {
                setState(() {
                  _locating = false;
                });
                locationData.getMoveCamera();
              },
            ),
            Visibility(
              visible: preferences!.getBool('_userStatus')!,
              child: const Positioned.fill(
                child: SpinKitPulse(
                  color: ColorPalette.green,
                  size: 200.0,
                ),
              ),
            ),
            Visibility(
                visible: preferences!.getBool('_userStatus')!,
                child: Positioned(
                  top: 10,
                  right: 10,
                  child: Consumer<RideProvider>(
                      builder: (context, rideprovider, child) {
                    var statusText = "";
                    switch (rideprovider.rideStatus) {
                      case RideStatus.idle:
                        statusText = "Get Demo Booking";
                        break;
                      case RideStatus.driverAccepted:
                        statusText = "Ride Accepted";
                        break;
                      case RideStatus.goingToPickup:
                        statusText = "Going to Pickup";
                        break;
                      case RideStatus.onPickupLocation:
                        statusText = "Reached at Pickup Location";
                        break;
                      case RideStatus.onRide:
                        statusText = "Ride Started\nTap to Close Trip";
                        break;
                      case RideStatus.onDropLocatopn:
                        statusText = "Reahed at Drop Location";
                        break;
                      case RideStatus.rideCompleted:
                        statusText = "Ride Completed\nGet another Booking";
                        break;
                    }

                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ColorPalette.green),
                        onPressed: () {
                          switch (rideprovider.rideStatus) {
                            case RideStatus.idle:
                              HomeScreenSheets.showNewRideOfferSheet(context);
                              break;
                            case RideStatus.driverAccepted:
                              Get.toNamed(NewBookingDetailsScreen.id);
                              break;
                            case RideStatus.goingToPickup:
                              HomeScreenSheets.showNewRideOfferSheet(context);
                              break;
                            case RideStatus.onPickupLocation:
                              HomeScreenSheets.verifyPinSheet(context);
                              break;
                            case RideStatus.onRide:
                              Get.toNamed(RideCompleteScreen.id);
                              break;
                            case RideStatus.onDropLocatopn:
                              HomeScreenSheets.showNewRideOfferSheet(context);
                              break;
                            case RideStatus.rideCompleted:
                              HomeScreenSheets.showNewRideOfferSheet(context);
                              break;
                          }
                        },
                        child: Text(
                          statusText,
                          textAlign: TextAlign.center,
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                  color: ColorPalette.black,
                                  fontWeight: FontWeight.bold),
                        ));
                  }),
                )),
            Center(
              child: SizedBox(
                height: 100,
                //margin: EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  AssetImageClass.navigationIcon,
                ),
              ),
            ),
            Visibility(
              visible: !preferences!.getBool('_userStatus')!,
              child: Positioned.fill(
                  child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        color: ColorPalette.black.withOpacity(0.4)),
                  )),
                  Container(
                    height: SizeConfig.heightMultiplier * 70,
                    decoration: const BoxDecoration(color: ColorPalette.green),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: ImageIcon(
                            AssetImage(
                              AssetImageClass.offlineIcon,
                            ),
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You are Offline!",
                                style: CustomStyleClass.onboardingBodyTextStyle
                                    .copyWith(
                                        color: ColorPalette.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text("Go online to start accepting jobs.",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.black,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.8)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      );
    });
  }
}
