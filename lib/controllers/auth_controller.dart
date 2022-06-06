import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fashion_paints/models/apis_model/login_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<LoginModel?> loginApiData(String userCode, String password,
      String deviceId, String fcmId, BuildContext context) async {
    try {
      isLoading(true);
      LoginModel? loginData = await Services.loginData(
          userCode, password, deviceId, fcmId, context);
      return loginData;
    } finally {
      isLoading(false);
    }
  }

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      print("This is devide info ${androidDeviceInfo.androidId}");
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  Future<String?> getFirebaseToken() async =>
      FirebaseMessaging.instance.getToken().then((value) {
        String? token = value;
        return token;
      });

  Future<String?> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userData');
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacementNamed("Button_Navigation_Bar");
  }
}
