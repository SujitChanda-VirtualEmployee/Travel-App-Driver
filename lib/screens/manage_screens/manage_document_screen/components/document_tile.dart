import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/size_config.dart';
import 'package:travel_app_driver/widgets/custom_buttons.dart';

// ignore: must_be_immutable
class DocumentTileWidget extends StatefulWidget {
  File? fileName;
  final String title;
  final String status;
  final bool readOnly;
  DocumentTileWidget(
      {Key? key,
      required this.fileName,
      required this.title,
      required this.status,
      required this.readOnly})
      : super(key: key);

  @override
  State<DocumentTileWidget> createState() => _DocumentTileWidgetState();
}

class _DocumentTileWidgetState extends State<DocumentTileWidget> {
  bool loading = false;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(children: [
        imageViewer(),
        Expanded(
            child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                      color: ColorPalette.black,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
                Text.rich(
                  TextSpan(
                      text: 'Status : ',
                      style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                          color: ColorPalette.dark,
                          fontSize: SizeConfig.textMultiplier * 2),
                      children: <InlineSpan>[
                        TextSpan(
                          text: widget.status,
                          style: CustomStyleClass.onboardingBodyTextStyle
                              .copyWith(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: SizeConfig.textMultiplier * 2),
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
                Visibility(
                  visible: !widget.readOnly,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButtonsClass.blackButton(
                            leftMargin: 0,
                            rightMargin: 0,
                            height: 40,
                            radius: 5,
                            title: "UPDATE",
                            titleStyle: CustomStyleClass
                                .onboardingSkipButtonStyle
                                .copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.5),
                            onPressed: getProfileImage),
                      ),
                      const Expanded(
                          child: SizedBox(
                        width: 20,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }

  Widget imageViewer() {
    return ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: Container(
          color: ColorPalette.dark.withOpacity(0.2),
          height: 100,
          width: 100,
          child: widget.fileName == null
              ? Icon(
                  CupertinoIcons.photo,
                  size: 40,
                  color: ColorPalette.dark.withOpacity(0.8),
                )
              : Image.file(File(widget.fileName!.path)),
        ));
  }

  Future getProfileImage() async {
    File? cropped;
    await EasyLoading.show(status: 'Please wait...', dismissOnTap: false);
    await picker
        .pickImage(source: ImageSource.gallery, maxHeight: 1024, maxWidth: 1024)
        .then((image) async {
      try {
        if (image != null) {
          var data = await ImageCropper().cropImage(
              sourcePath: image.path,
              aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
              // compressQuality: 100,
              maxWidth: 1024,
              maxHeight: 1024,
              compressFormat: ImageCompressFormat.jpg,
              uiSettings: [
                AndroidUiSettings(
                  toolbarColor: Theme.of(context).colorScheme.secondary,
                  toolbarTitle: "Crop Image",
                  statusBarColor: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.white,
                ),
              ]);

          if (data != null) cropped = File(data.path);

          if (cropped != null) {
            setState(() {
              widget.fileName = cropped;
            });
            EasyLoading.dismiss();
            // await uploadProfilePic();
            if (cropped?.path == null) retrieveLostData(widget.fileName!);
            // print(
            //     "============================================================================");
          }
          EasyLoading.dismiss();
        }
      } catch (e) {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              backgroundColor: Colors.red.shade400,
              content: Text("$e!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white)),
              duration: const Duration(milliseconds: 5000),
            ))
            .closed
            .then((_) {
          setState(() {});
        });
      }
      EasyLoading.dismiss();
    });
  }

  Future<void> retrieveLostData(File _image) async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file!.path);
      });
    } else {
      print(response.file);
    }
  }
}
