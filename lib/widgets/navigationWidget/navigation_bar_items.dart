import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:travel_app_driver/main.dart';
import 'package:travel_app_driver/providers/drawer_navigation_provider.dart';
import 'package:travel_app_driver/screens/about_us_screen.dart';
import 'package:travel_app_driver/screens/change_password_screen.dart';
import 'package:travel_app_driver/screens/contact_us_screen.dart';
import 'package:travel_app_driver/screens/history_screen.dart';
import 'package:travel_app_driver/screens/home_screen/home_screen.dart';
import 'package:travel_app_driver/screens/login_screen.dart';
import 'package:travel_app_driver/screens/notification_screen.dart';
import 'package:travel_app_driver/screens/rating_screen.dart';
import 'package:travel_app_driver/screens/settings_screen.dart';
import 'package:travel_app_driver/screens/wallet_screen.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

import '../../utils/asset_images_strings.dart';

class NavigationBarItems extends StatefulWidget {
  const NavigationBarItems({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationBarItemsState createState() => _NavigationBarItemsState();
}

class _NavigationBarItemsState extends State<NavigationBarItems> {
  void select(int n, DrawerNavigationProvider navProvider) {
    for (int i = 0; i < 10; i++) {
      if (i != n) {
        navProvider.selected[i] = false;
      } else {
        navProvider.selected[i] = true;
        //  selected[i] = true;
      }
    }

    // Future.delayed(const Duration(milliseconds: 300), () {
    //   context.read<DrawerNavigationProvider>().closeMenu();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerNavigationProvider>(
        builder: (context, navProvider, child) {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 10),
              Items(
                  icon: AssetImageClass.drawerIconHome,
                  label: "Home",
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(0);

                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                    select(0, navProvider);
                  },
                  active: navProvider.selected[0]),
              Items(
                  icon: AssetImageClass.drawerIconWallet,
                  label: "Wallet",
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(1);
                    Navigator.pushReplacementNamed(context, WalletScreen.id);
                    select(1, navProvider);
                  },
                  active: navProvider.selected[1]),
              Items(
                  icon: AssetImageClass.drawerIconHistory,
                  label: "History",
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(2);
                    Navigator.pushReplacementNamed(context, HistoryScreen.id);
                    select(2, navProvider);
                  },
                  active: navProvider.selected[2]),
              Items(
                  icon: AssetImageClass.drawerIconSettings,
                  label: "Settings",
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(3);
                    Navigator.pushReplacementNamed(context, SettingsScreen.id);
                    select(3, navProvider);
                  },
                  active: navProvider.selected[3]),
              Items(
                  icon: AssetImageClass.drawerIconNotification,
                  label: "Notifications",
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(4);
                    Navigator.pushReplacementNamed(
                        context, NotificationScreen.id);
                    select(4, navProvider);
                  },
                  active: navProvider.selected[4]),
              Items(
                  label: "Change Password",
                  icon: AssetImageClass.drawerIconChangePass,
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(5);
                    Navigator.pushReplacementNamed(
                        context, ChangePasswordScreen.id);
                    select(5, navProvider);
                  },
                  active: navProvider.selected[5]),
              Items(
                  label: "Rating",
                  icon: AssetImageClass.drawerIconRating,
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(6);
                    Navigator.pushReplacementNamed(context, RatingScreen.id);
                    select(6, navProvider);
                  },
                  active: navProvider.selected[6]),
              Items(
                  label: "Share",
                  icon: AssetImageClass.drawerIconShare,
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(7);
                    Share.share('check out my App https://google.com');
                    select(7, navProvider);
                  },
                  active: navProvider.selected[7]),
              Items(
                  label: "Contact Us",
                  icon: AssetImageClass.drawerIconContactUs,
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(8);
                    Navigator.pushReplacementNamed(context, ContactUsScreen.id);
                    select(8, navProvider);
                  },
                  active: navProvider.selected[8]),
              Items(
                  label: "About Us",
                  icon: AssetImageClass.drawerIconAboutUs,
                  touched: () {
                    Provider.of<DrawerNavigationProvider>(context,
                            listen: false)
                        .selectPageIndex(9);
                    Navigator.pushReplacementNamed(context, AboutUsScreen.id);
                    select(9, navProvider);
                  },
                  active: navProvider.selected[9]),
              const SizedBox(height: 20),
              CustomButtonsClass.blackButton(
                  height: 72,
                  title: "LOGOUT",
                  leftMargin: 40,
                  rightMargin: 40,
                  titleStyle: CustomStyleClass.onboardingSkipButtonStyle,
                  onPressed: () {
                    preferences!.clear();
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.id, (route) => false);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }

  Widget _header() {
    return Container(
      height: SizeConfig.heightMultiplier * 200,
      width: double.infinity,
      color: ColorPalette.black,
      child: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.widthMultiplier * 10,
              ),
              CircleAvatar(
                radius: (SizeConfig.imageSizeMultiplier * 11) + 2,
                backgroundColor: ColorPalette.green,
                child: CircleAvatar(
                  radius: SizeConfig.imageSizeMultiplier * 11,
                  backgroundColor: Colors.white,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      AssetImageClass.userLogo,
                      width: SizeConfig.imageSizeMultiplier * 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 50,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alexa Doe",
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 2.2)),
                    SizedBox(
                      height: SizeConfig.widthMultiplier * 10,
                    ),
                    Text("Emp Id : FR1234",
                        style: CustomStyleClass.onboardingBodyTextStyle
                            .copyWith(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 2)),
                    SizedBox(
                      height: SizeConfig.widthMultiplier * 10,
                    ),
                    Row(
                      children: [
                        Text("4.5 ",
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: SizeConfig.textMultiplier * 1.6)),
                        const Icon(
                          Icons.star,
                          color: ColorPalette.green,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

class Items extends StatefulWidget {
  final String icon;
  final Function touched;
  final bool active;
  final String label;

  Items(
      {required this.icon,
      required this.label,
      required this.touched,
      required this.active});
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            widget.touched();
          },
          splashColor: Colors.white,
          hoverColor: Colors.white12,
          child: Container(
              height: 45,
              margin: const EdgeInsets.only(top: 7, bottom: 7),
              color: widget.active
                  ? ColorPalette.black.withOpacity(0.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  AnimatedContainer(
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 1),
                      duration: const Duration(milliseconds: 100),
                      height: 45,
                      width: 5,
                      decoration: BoxDecoration(
                          color: widget.active
                              ? ColorPalette.black
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(0.0),
                              bottomRight: Radius.circular(0)))),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.icon,
                              color: widget.active
                                  ? ColorPalette.black
                                  : ColorPalette.black.withOpacity(0.5),
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: widget.active
                                          ? ColorPalette.black
                                          : ColorPalette.black.withOpacity(0.5),
                                    ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ))),
    );
  }
}
