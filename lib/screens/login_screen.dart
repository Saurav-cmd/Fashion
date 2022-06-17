import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/auth_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _isObscure = true;

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  AuthController aC = Get.put(AuthController());
  String deviceId = AuthController().getId().toString();
  // String fcmId = AuthController().getFirebaseToken().toString();
  TextEditingController dealerCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? fcmToken;
  var iosInfo;
  var androidDeviceInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getToken().then((value) {
      fcmToken = value;
      print("This is token $fcmToken");
      return fcmToken;
    });

    getId();
  }

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      setState(() {
        iosInfo = iosDeviceInfo.identifierForVendor;
      });
      return iosInfo; // unique ID on iOS
    } else {
      var androidInfo = await deviceInfo.androidInfo;
      setState(() {
        androidDeviceInfo = androidInfo.androidId;
      });
      print("This is devide info ${androidDeviceInfo}");
      return androidDeviceInfo; // unique ID on Android
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dealerCodeController;
    passwordController;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => aC.isLoading.value == true ? false : true,
      child: Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor2, // For iOS (dark icons)
          ),
          elevation: 0,
          backgroundColor: ChooseColor(0).appBarColor2,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed("Button_Navigation_Bar");
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black38,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.070, vertical: size.height * 0.020),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                          width: size.width * 0.50,
                          child: Image.asset(
                            "icons/logo 2.png",
                            fit: BoxFit.fill,
                          )),
                      SizedBox(height: size.height * 0.010),
                      Text(
                        "Product of Fashion Paints Pvt.Ltd",
                        style: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: size.height * 0.050),
                      Container(
                        decoration: BoxDecoration(
                          color: ChooseColor(0).appBarColor1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.040,
                              vertical: size.height * 0.020),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.014 +
                                        size.width * 0.014,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: size.height * 0.020),
                              Form(
                                  key: _form,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dealer Code",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.010 +
                                                size.width * 0.010,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: size.height * 0.005),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.001,
                                              horizontal: size.width * 0.030),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          // labelText: 'Phone Number',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Dealer Code',
                                          hintStyle: TextStyle(
                                              fontSize: size.height * 0.012 +
                                                  size.width * 0.012,
                                              color: Colors.black26),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Dealer code is empty";
                                          }
                                        },
                                        controller: dealerCodeController,
                                      ),
                                      SizedBox(height: size.height * 0.020),
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.010 +
                                                size.width * 0.010,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: size.height * 0.005),
                                      TextFormField(
                                        obscureText: _isObscure,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.001,
                                              horizontal: size.width * 0.030),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          fillColor: Colors.white,
                                          filled: true,
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.005),
                                            child: IconButton(
                                              color: Colors.black45,
                                              iconSize: size.height * 0.020 +
                                                  size.width * 0.020,
                                              icon: Icon(
                                                _isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              },
                                            ),
                                          ),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontSize: size.height * 0.012 +
                                                  size.width * 0.012,
                                              color: Colors.black26),
                                        ),
                                        controller: passwordController,
                                      ),
                                    ],
                                  )),
                              SizedBox(height: size.height * 0.035),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: double.infinity,
                                    height: size.height * 0.055),
                                child: ElevatedButton(
                                  child: Text(
                                    'LOGIN',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: size.height * 0.014 +
                                            size.width * 0.014),
                                  ),
                                  onPressed: () async {
                                    try {
                                      final result =
                                          await InternetAddress.lookup(
                                              "example.com");
                                      if (result.isNotEmpty &&
                                          result[0].rawAddress.isNotEmpty) {
                                        print("There is wifi connection");
                                        if (_form.currentState != null &&
                                            _form.currentState!.validate()) {
                                          aC.loginApiData(
                                              dealerCodeController.text,
                                              passwordController.text,
                                              androidDeviceInfo,
                                              fcmToken!,
                                              context);
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        }
                                      }
                                    } on SocketException catch (_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Please check your internet connection!',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: size.height * 0.011 +
                                                  size.width * 0.011),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: Colors.grey.shade700,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ));
                                      /* AlertBox()
                                          .noWifiConnection(1, "", "", context);*/
                                      print('not connected');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: ChooseColor(0).buttonColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.15),
                      Text("Ver 1.0.7",
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize:
                                  size.height * 0.010 + size.width * 0.010))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
