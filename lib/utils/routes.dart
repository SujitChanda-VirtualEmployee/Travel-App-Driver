import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/about_us_screen.dart';
import 'package:travel_app_driver/screens/add_card_screen.dart';
import 'package:travel_app_driver/screens/change_password_screen.dart';
import 'package:travel_app_driver/screens/contact_us_screen.dart';
import 'package:travel_app_driver/screens/forgot_password_screen.dart';
import 'package:travel_app_driver/screens/history_screen.dart';
import 'package:travel_app_driver/screens/home_screen/home_screen.dart';
import 'package:travel_app_driver/screens/landing_screen.dart';
import 'package:travel_app_driver/screens/location_permission_screen.dart';
import 'package:travel_app_driver/screens/login_screen.dart';
import 'package:travel_app_driver/screens/my_profile.dart';
import 'package:travel_app_driver/screens/new_booking_details_screen.dart';
import 'package:travel_app_driver/screens/onboarding_screen.dart';
import 'package:travel_app_driver/screens/otp_verification_screen.dart';
import 'package:travel_app_driver/screens/peyment_method_screen.dart';
import 'package:travel_app_driver/screens/rating_screen.dart';
import 'package:travel_app_driver/screens/reset_password_screen.dart';
import 'package:travel_app_driver/screens/ride_complete_screen/ride_complete_screen.dart';
import 'package:travel_app_driver/screens/ride_rating_screen.dart';
import 'package:travel_app_driver/screens/ride_verify_pin_screen.dart';
import 'package:travel_app_driver/screens/settings_screen.dart';
import 'package:travel_app_driver/screens/signup_screen.dart';
import 'package:travel_app_driver/screens/splash_screen.dart';
import 'package:travel_app_driver/screens/update_account.dart';
import 'package:travel_app_driver/screens/update_profile_screen.dart';
import 'package:travel_app_driver/screens/wallet_screen.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import '../screens/manage_screens/manage_account_screen.dart';
import '../screens/manage_screens/manage_document_screen/display_document_screen.dart';
import '../screens/manage_screens/manage_document_screen/manage_documents_screen.dart';
import '../screens/manage_screens/manage_vehicle_screen/display_vehicle_screen.dart';
import '../screens/manage_screens/manage_vehicle_screen/manage_vehicle_screen.dart';
import '../screens/notification_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(
    RouteSettings settings,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case HomeScreen.id:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case OnboardingScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const OnboardingScreen());
      case LoginScreen.id:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());
      case SignupScreen.id:
        return CupertinoPageRoute(builder: (context) => const SignupScreen());
      case ForgotPasswordScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const ForgotPasswordScreen());
      case OtpVerificationScreen.id:
        if (args is NavigationFrom) {
          return CupertinoPageRoute(
              builder: (context) => OtpVerificationScreen(from: args));
        }
        return _errorRoutes();

      case ResetPasswordScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const ResetPasswordScreen());
      case LocationPermissionScreen.id:
        if (args is List<String>) {
          return CupertinoPageRoute(
              builder: (context) => LocationPermissionScreen(
                    title: args[0],
                    body: args[1],
                  ));
        }
        return _errorRoutes();
      case LandingScreen.id:
        return CupertinoPageRoute(builder: (context) => const LandingScreen());
      case SettingsScreen.id:
        return CupertinoPageRoute(builder: (context) => const SettingsScreen());
      case HistoryScreen.id:
        return CupertinoPageRoute(builder: (context) => const HistoryScreen());
      case NotificationScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const NotificationScreen());
      case ChangePasswordScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const ChangePasswordScreen());
      case RatingScreen.id:
        return CupertinoPageRoute(builder: (context) => const RatingScreen());
      case ContactUsScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const ContactUsScreen());
      case AboutUsScreen.id:
        return CupertinoPageRoute(builder: (context) => const AboutUsScreen());
      case MyProfileScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const MyProfileScreen());
      case UpdateProfileScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const UpdateProfileScreen());
      case PaymentMethodScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const PaymentMethodScreen());
      case AddNewCardScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const AddNewCardScreen());

      case ManageVehicleScreen.id:
        if (args is NavigationFrom) {
          return CupertinoPageRoute(
              builder: (context) => ManageVehicleScreen(from: args));
        }
        return _errorRoutes();

      case ManageDocumentScreen.id:
        if (args is NavigationFrom) {
          return CupertinoPageRoute(
              builder: (context) => ManageDocumentScreen(from: args));
        }
        return _errorRoutes();

      case ManageAccountScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const ManageAccountScreen());
      case NewBookingDetailsScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const NewBookingDetailsScreen());
      case RideVerifyPinScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const RideVerifyPinScreen());
      case RideCompleteScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const RideCompleteScreen());
      case RideRatingScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const RideRatingScreen());
      case WalletScreen.id:
        return CupertinoPageRoute(builder: (context) => const WalletScreen());
      case UpdateAccountScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const UpdateAccountScreen());
      case DisplayVehicleScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const DisplayVehicleScreen());
       case DisplayDocumentScreen.id:
        return CupertinoPageRoute(
            builder: (context) => const DisplayDocumentScreen());
      default:
        return _errorRoutes();
    }
  }

  static Route<dynamic> _errorRoutes() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page not found!")),
      );
    });
  }
}
