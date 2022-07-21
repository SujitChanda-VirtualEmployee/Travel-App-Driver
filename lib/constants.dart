import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

String mapKey = "AIzaSyCjGATzcTwi0QeupQn0P3eszhqDQ00i0i8";


Widget glassLoading() {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.blue.withOpacity(0.3),
                      color: Colors.grey.shade400,
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: const Offset(0.7, 0.7),
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.black87),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpinKitCircle(
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text("Please wait...", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          )),
    ),
  );
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> sendSms(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
