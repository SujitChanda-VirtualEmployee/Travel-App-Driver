import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification-screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Notification"),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Text(
                  "N",
                  style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                      color: ColorPalette.black, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                "Notification ${index + 1}",
                style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black,
                ),
              ),
              subtitle: Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                maxLines: 2,
                style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  fontSize: 15,
                  color: ColorPalette.dark,
                ),
              ));
        },
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }
}
