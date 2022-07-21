import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/asset_images_strings.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/navigationWidget/navigation_bar.dart';

class RatingScreen extends StatefulWidget {
  static const String id = 'rating-screen';
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      drawer: const CustomNavigationBar(),
      appBar: AppBar(
        title: const Text("Rating"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: body(),
    );
  }

  List<CustomRatingListWidget> ratingList = [
    CustomRatingListWidget(
      description:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly ',
      image: AssetImageClass.userLogo,
      name: 'Olive Yew',
      ratingValue: 1,
      reviewTime: "2 Days ago",
      onTap: () {},
    ),
    CustomRatingListWidget(
      description:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly ',
      image: AssetImageClass.userLogo,
      name: 'Jhon Dao',
      ratingValue: 5,
      reviewTime: "2 Days ago",
      onTap: () {},
    ),
    CustomRatingListWidget(
      description:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly ',
      image: AssetImageClass.userLogo,
      name: 'Harry Potter',
      ratingValue: 2,
      reviewTime: "2 Days ago",
      onTap: () {},
    ),
    CustomRatingListWidget(
      description:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly ',
      image: AssetImageClass.userLogo,
      name: 'Alli Legge',
      ratingValue: 4,
      reviewTime: "2 Days ago",
      onTap: () {},
    ),
    CustomRatingListWidget(
      description:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly ',
      image: AssetImageClass.userLogo,
      name: 'Peg Grater',
      ratingValue: 3,
      reviewTime: "2 Days ago",
      onTap: () {},
    ),
  ];

  Widget body() {
    return SizedBox(
        height: SizeConfig.fullHeight,
        width: SizeConfig.fullWidth,
        child: ListView.builder(
          itemCount: ratingList.length,
          itemBuilder: (BuildContext context, int index) {
            return ratingList[index];
          },
        ));
  }
}

class CustomRatingListWidget extends StatefulWidget {
  final String name;
  final String description;
  final String image;
  final int ratingValue;
  final String reviewTime;
  final Function() onTap;

  // ignore: prefer_const_constructors_in_immutables
  CustomRatingListWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.ratingValue,
    required this.reviewTime,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomRatingListWidget> createState() => _CustomRatingListWidgetState();
}

class _CustomRatingListWidgetState extends State<CustomRatingListWidget> {
  startRatingGenerator(int rating) {
    List startList = [
      AssetImageClass.starOffIcon,
      AssetImageClass.starOffIcon,
      AssetImageClass.starOffIcon,
      AssetImageClass.starOffIcon,
      AssetImageClass.starOffIcon,
    ];

    for (int i = 0; i < rating; i++) {
      startList.removeAt(i);
      startList.insert(i, AssetImageClass.starOnIcon);
    }

    return Expanded(
      child: SizedBox(
        // width: 09,
        height: 18,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              '${startList[index]}',
              height: 18,
              width: 18,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 5,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 220,
      width: SizeConfig.fullWidth,
      child: Stack(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(15),
            shadowColor: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.contain,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.name,
                                    style: CustomStyleClass
                                        .onboardingBodyTextStyle
                                        .copyWith(
                                            color: ColorPalette.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                SizeConfig.textMultiplier * 2)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    startRatingGenerator(widget.ratingValue),
                                    Text(widget.reviewTime)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Text(widget.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CustomStyleClass.onboardingBodyTextStyle
                                .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.8)))
                  ],
                ),
              ),
            ),
          ),
          // Positioned.fill(
          //     child: InkWell(
          //   onTap: widget.onTap,
          // ))
        ],
      ),
    );
  }
}
