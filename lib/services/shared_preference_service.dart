import 'package:travel_app_driver/main.dart';

class SharedServices {
  static addUsersDataToSF({
    required String userName,
    required String userPhone,
    required String userEmail,
    required String userPhoto,
    required String authToken,
    required String userId,
    required bool userStatus,
  }) {
    preferences!.setString('_userName', userName);
    preferences!.setString('_userPhoto', userPhone);
    preferences!.setString('_userEmail', userEmail);
    preferences!.setString('_userPhone', userPhone);
    preferences!.setString('_userAuthToken', authToken);
    preferences!.setString('_userId', userId);
    preferences!.setBool('_userStatus', userStatus);
    
    print("User Data Added to SharedPreferences");
  }
}
