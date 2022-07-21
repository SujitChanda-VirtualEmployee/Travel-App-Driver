import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_driver/providers/drawer_navigation_provider.dart';
import 'package:travel_app_driver/providers/location_provider.dart';
import 'package:travel_app_driver/providers/ride_provider.dart';
import 'package:travel_app_driver/screens/splash_screen.dart';
import 'package:travel_app_driver/utils/app_theme.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/routes.dart';
import 'package:travel_app_driver/utils/size_config.dart';

SharedPreferences? preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  preferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawerNavigationProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => RideProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..indicatorWidget = const CupertinoActivityIndicator(
      color: Colors.black,
      radius: 20,
    )
    ..radius = 8.0
    ..boxShadow = [
      const BoxShadow(
          offset: Offset(0.7, 0.7),
          color: ColorPalette.black,
          blurRadius: 2,
          spreadRadius: 2)
    ]
    ..maskColor = ColorPalette.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel App User',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      builder: EasyLoading.init(),
      home: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return const SplashScreen();
          });
        },
      ),
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
