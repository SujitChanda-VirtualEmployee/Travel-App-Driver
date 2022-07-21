import 'package:flutter/material.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_document_screen/display_document_screen.dart';
import 'package:travel_app_driver/screens/manage_screens/manage_vehicle_screen/display_vehicle_screen.dart';
import 'package:travel_app_driver/screens/my_profile.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';


class SettingsScreen extends StatefulWidget {
  static const String id = 'settings-screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView(
      children: [
        ListTile(
          title: Text(
            "Notifications",
            style: CustomStyleClass.onboardingBodyTextStyle
                .copyWith(color: ColorPalette.black),
          ),
          trailing: Switch.adaptive(
            activeColor: Colors.yellow,
            value: _value,
            onChanged: (newValue) => setState(() => _value = newValue),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyProfileScreen.id);
            },
            title: Text(
              "My Profile",
              style: CustomStyleClass.onboardingBodyTextStyle
                  .copyWith(color: ColorPalette.black),
            ),
            trailing: const Icon(Icons.arrow_forward_ios)),
        const Divider(
          thickness: 1,
        ),
        ListTile(
            onTap: () {
              Navigator.pushNamed(context, DisplayVehicleScreen.id);
            },
            title: Text(
              "Manage Vehicle",
              style: CustomStyleClass.onboardingBodyTextStyle
                  .copyWith(color: ColorPalette.black),
            ),
            trailing: const Icon(Icons.arrow_forward_ios)),
        const Divider(
          thickness: 1,
        ),
        ListTile(
            onTap: () {
              Navigator.pushNamed(context, DisplayDocumentScreen.id,
                  arguments: NavigationFrom.settingsScreen);
            },
            title: Text(
              "Manage Documents",
              style: CustomStyleClass.onboardingBodyTextStyle
                  .copyWith(color: ColorPalette.black),
            ),
            trailing: const Icon(Icons.arrow_forward_ios)),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
