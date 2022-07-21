import 'dart:developer';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

enum StatusType { pending, confirm, completed, cancelled }

class HistoryScreen extends StatefulWidget {
  static const String id = 'history-screen';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Hostory"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(AssetImage(AssetImageClass.calenderIcon)),
            onPressed: () {},
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return SizedBox(
      height: SizeConfig.fullHeight,
      width: SizeConfig.fullWidth,
      child: Column(children: [
        CalendarTimeline(
          initialDate: DateTime(2020, 4, 20),
          firstDate: DateTime(2019, 1, 15),
          lastDate: DateTime(2020, 11, 20),
          onDateSelected: (date) => log(date.toString()),
          leftMargin: 20,
          monthColor: ColorPalette.black,
          dayColor: ColorPalette.dark,
          activeDayColor: ColorPalette.green,
          activeBackgroundDayColor: ColorPalette.black,
          dotsColor: ColorPalette.white,
          //  selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        const Divider(
          thickness: 1,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: SizeConfig.heightMultiplier * 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPalette.green),
                  child: Row(children: [
                    Image.asset(AssetImageClass.carIcon),
                    SizedBox(width: SizeConfig.widthMultiplier * 30),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Jobs",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  color: ColorPalette.black,
                                  fontSize: SizeConfig.textMultiplier * 2),
                        ),
                        Text(
                          "24",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  color: ColorPalette.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.textMultiplier * 2.5),
                        )
                      ],
                    ))
                  ]),
                ),
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 50),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPalette.black),
                  height: SizeConfig.heightMultiplier * 80,
                  child: Row(children: [
                    Image.asset(AssetImageClass.dollarIcon),
                    SizedBox(width: SizeConfig.widthMultiplier * 30),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Earn",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  color: ColorPalette.green,
                                  fontSize: SizeConfig.textMultiplier * 2),
                        ),
                        Text(
                          "\$234.0",
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  color: ColorPalette.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.textMultiplier * 2.5),
                        )
                      ],
                    ))
                  ]),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 15,
        ),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          children: [
            CustomListWidget(
              amount: 2.5,
              dropLocation: "New Delhi Metro Station, Sector 87 ",
              pickupLocation: "New Delhi Metro Station, Sector 34 ",
              status: StatusType.confirm,
            ),
            CustomListWidget(
              amount: 2.5,
              dropLocation: "New Delhi Metro Station, Sector 87 ",
              pickupLocation: "New Delhi Metro Station, Sector 34 ",
              status: StatusType.completed,
            ),
            CustomListWidget(
              amount: 2.5,
              dropLocation: "New Delhi Metro Station, Sector 87 ",
              pickupLocation: "New Delhi Metro Station, Sector 34 ",
              status: StatusType.cancelled,
            ),
            CustomListWidget(
              amount: 2.5,
              dropLocation: "New Delhi Metro Station, Sector 87 ",
              pickupLocation: "New Delhi Metro Station, Sector 34 ",
              status: StatusType.pending,
            )
          ],
        ))
      ]),
    );
  }
}

class CustomListWidget extends StatefulWidget {
  final String pickupLocation;
  final String dropLocation;
  final double amount;
  final StatusType status;

  // ignore: prefer_const_constructors_in_immutables
  CustomListWidget({
    Key? key,
    required this.pickupLocation,
    required this.dropLocation,
    required this.amount,
    required this.status,
  }) : super(key: key);

  @override
  State<CustomListWidget> createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  TextEditingController pickupLoc = TextEditingController();
  TextEditingController dropLoc = TextEditingController();
  @override
  void initState() {
    pickupLoc.text = widget.pickupLocation;
    dropLoc.text = widget.dropLocation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 290,
      width: SizeConfig.fullWidth,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {},
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(children: [
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 70,
                            width: SizeConfig.heightMultiplier * 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(AssetImageClass.userLogo),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Obiliya Milana",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                    color: ColorPalette.black,
                                  )),
                              Text("Just Now",
                                  style: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.5)),
                            ],
                          )
                        ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$ 2.5",
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                color: ColorPalette.black,
                              )),
                          Text("2.2km",
                              style: CustomStyleClass.onboardingBodyTextStyle
                                  .copyWith(
                                      fontSize:
                                          SizeConfig.textMultiplier * 1.5)),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: pickupLoc,
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: "Pick Up ",
                                  labelStyle: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.dark,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              height: 10,
                            ),
                            Expanded(
                              child: TextField(
                                readOnly: true,
                                controller: dropLoc,
                                decoration: InputDecoration(
                                  labelText: "Drop Off ",
                                  labelStyle: CustomStyleClass
                                      .onboardingBodyTextStyle
                                      .copyWith(
                                          color: ColorPalette.dark,
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget statusStyle(StatusType status) {
  //   return Text(
  //     status == StatusType.cancelled
  //         ? "Cancelled"
  //         : status == StatusType.completed
  //             ? "Completed"
  //             : status == StatusType.confirm
  //                 ? "Confirm"
  //                 : status == StatusType.pending
  //                     ? "Pending"
  //                     : "",
  //     style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
  //       fontWeight: FontWeight.bold,
  //       color: status == StatusType.cancelled
  //           ? ColorPalette.dark
  //           : status == StatusType.completed
  //               ? ColorPalette.green
  //               : status == StatusType.confirm
  //                   ? Colors.purple
  //                   : status == StatusType.pending
  //                       ? Colors.amber
  //                       : ColorPalette.white,
  //     ),
  //   );
  // }
}
