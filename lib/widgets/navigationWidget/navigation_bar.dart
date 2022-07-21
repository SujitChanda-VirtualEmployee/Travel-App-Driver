import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar_items.dart';


class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeConfig.fullWidth / 1.3,
      child: Container(color: Colors.white, child: const NavigationBarItems()),
    );
  }
}
