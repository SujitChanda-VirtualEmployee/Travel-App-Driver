import 'package:flutter/material.dart';
import 'package:travel_app_driver/utils/color_palette.dart';
import 'package:travel_app_driver/utils/custom_styles.dart';
import 'package:travel_app_driver/utils/enum_classes.dart';
import 'package:travel_app_driver/utils/size_config.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  String labelText;
  String hintText;
  String? valueText;
  String? Function(String?)? validator;
  FieldType fieldType;
  CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.valueText,
    this.validator,
    required this.fieldType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passWordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: 60,
      padding: EdgeInsets.only(top: 1.5 * SizeConfig.heightMultiplier),
      child: Stack(
        children: [
          TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              obscureText: widget.fieldType == FieldType.password
                  ? !passWordVisibility
                  : false,
              maxLines: widget.fieldType == FieldType.message ? 5 : 1,
              onSaved: (val) => widget.valueText = val!.trim().toLowerCase(),
              validator: widget.validator,
              keyboardType: widget.fieldType == FieldType.email
                  ? TextInputType.emailAddress
                  : widget.fieldType == FieldType.password
                      ? TextInputType.visiblePassword
                      : widget.fieldType == FieldType.name
                          ? TextInputType.name
                          : widget.fieldType == FieldType.mobile
                              ? TextInputType.phone
                              : widget.fieldType == FieldType.message
                                  ? TextInputType.text
                                  : TextInputType.number,
              style: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                  color: ColorPalette.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefix: widget.fieldType == FieldType.mobile
                    ? const Text("+1 ")
                    : null,
                isDense: true,
                //filled: true,
                contentPadding: EdgeInsets.only(
                    top: 20 * SizeConfig.heightMultiplier,
                    bottom: 20 * SizeConfig.heightMultiplier,
                    left: 30,
                    right: 15),
               
                enabledBorder: const OutlineInputBorder(
                    gapPadding: 10,
                    borderSide:
                        BorderSide(width: 0.7, color: ColorPalette.dark),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                disabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.7, color: ColorPalette.dark),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.7, color: ColorPalette.black),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.7, color: ColorPalette.black),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                errorMaxLines: 1,
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.7, color: ColorPalette.black),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                labelText: widget.labelText,
                labelStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                    color: ColorPalette.dark,
                    fontSize: SizeConfig.textMultiplier * 2),
                floatingLabelStyle: CustomStyleClass.onboardingBodyTextStyle
                    .copyWith(
                        color: ColorPalette.black,
                        fontSize: SizeConfig.textMultiplier * 2),
                hintText: widget.hintText,
                hintStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                    color: ColorPalette.dark,
                    fontSize: SizeConfig.textMultiplier * 2),
                errorStyle: CustomStyleClass.onboardingBodyTextStyle.copyWith(
                    fontSize: 10,
                    color: ColorPalette.error,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
            right: 5,
            top: 1.5 * SizeConfig.heightMultiplier,
            child: widget.fieldType == FieldType.password
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passWordVisibility = !passWordVisibility;
                      });
                    },
                    icon: Icon(passWordVisibility
                        ? Icons.visibility_off
                        : Icons.visibility))
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final FormFieldValidator<String> validate;
  final String labelText;

  final GlobalKey<FormFieldState> formFieldKey;

  // (before flutter 2.0) drop `required`
  const RoundedInputField({
    Key? key,
    required this.formFieldKey,
    required this.labelText,
    required this.icon,
    required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      validator: validate,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.blue,
        ),
        labelText: labelText,
      ),
    );
  }
}
