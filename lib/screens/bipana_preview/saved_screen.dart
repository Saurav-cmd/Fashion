import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/bipana_preview_controller_1.dart';
import '../../widgets/dilogue_box.dart';

class BipanPreviewSavedScreen extends StatefulWidget {
  const BipanPreviewSavedScreen({Key? key}) : super(key: key);

  @override
  State<BipanPreviewSavedScreen> createState() =>
      _BipanPreviewSavedScreenState();
}

class _BipanPreviewSavedScreenState extends State<BipanPreviewSavedScreen> {
  BipanPreviewController1 bPC = Get.put(BipanPreviewController1());
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? token;
  getSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
  }

  getSavedData(String? emailAddress, String? phoneNumber) async {
    await bPC
        .bipanaPreviewGetSavedData(emailAddress, phoneNumber)
        .whenComplete(() {
      setState(() {
        bPC.savedDataList;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bPC.savedDataList = [];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => bPC.isLoading.value == true ? false : true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          title: const Text("Saved"),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ChooseColor(0).appBarColor1,
              statusBarIconBrightness: Brightness.light // For iOS (dark icons)
              ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed("Bipana_Preview_screen");
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white60,
            iconSize: 20,
          ),
          backgroundColor: ChooseColor(0).appBarColor1,
          actions: [
            IconButton(
                onPressed: () {
                  if (token != null) {
                    Navigator.of(context)
                        .pushNamed("Dealer_button_Navigation_Bar");
                  } else if (token == null) {
                    Navigator.of(context).pushNamed("Button_Navigation_Bar");
                  }
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.015, horizontal: size.width * 0.020),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.015),
                      Text(
                        "Email Address",
                        style: TextStyle(
                            color: ChooseColor(0).appBarColor1,
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
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          // labelText: 'Phone Number',
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                              fontSize:
                                  size.height * 0.012 + size.width * 0.012,
                              color: Colors.black26),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please enter your email address";
                          } else if (!value.contains("@")) {
                            return "Please enter a valid email address";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                      ),
                      SizedBox(height: size.height * 0.020),
                      Text(
                        "Phone number",
                        style: TextStyle(
                            color: ChooseColor(0).appBarColor1,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: size.height * 0.005),
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.001,
                              horizontal: size.width * 0.030),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                              fontSize:
                                  size.height * 0.012 + size.width * 0.012,
                              color: Colors.black26),
                        ),
                        controller: phoneController,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        validator: (value) {
                          if (value == null) {
                            return "Please enter your phone number";
                          } else if (value.length < 10) {
                            return "Please enter valid phone number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.035),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: double.infinity,
                            height: size.height * 0.055),
                        child: ElevatedButton(
                          child: Text(
                            'Search',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize:
                                    size.height * 0.014 + size.width * 0.014),
                          ),
                          onPressed: () async {
                            try {
                              final result =
                                  await InternetAddress.lookup("example.com");
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  getSavedData(emailController.text,
                                      phoneController.text);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              }
                            } on SocketException catch (_) {
                              AlertBox().noWifiConnection(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ChooseColor(0).buttonColor,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: size.height*0.015),
              const Text(
                  "Note: Enter your email address and phone number to get your related data"),
              Obx(() {
                if (bPC.isLoading.value) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.3,
                        left: size.width * 0.1,
                        right: size.width * 0.1),
                    child: Card(
                        child: Center(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.height * 0.008 + size.width * 0.008,
                              top: size.height * 0.008 + size.width * 0.008,
                              bottom: size.height * 0.008 + size.width * 0.008),
                          child: CircularProgressIndicator(
                            color: ChooseColor(0).appBarColor1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.030,
                          ),
                          child: SizedBox(
                              width: size.width * 0.5,
                              child: const Text(
                                "Searching.......",
                                overflow: TextOverflow.clip,
                              )),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        )
                      ],
                    ))),
                  );
                } else if (bPC.savedDataList == null ||
                    bPC.savedDataList!.isEmpty) {
                  return Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No Data to Show",
                        style: TextStyle(
                            color: ChooseColor(0).appBarColor1,
                            fontSize: size.height * 0.014 + size.width * 0.014,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: bPC.savedDataList!.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.lightBlue.shade900),
                              )),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Image.network(
                                        "${bPC.savedDataList![i].image}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Text(
                                            "Name: ${bPC.savedDataList![i].user!.fullName}"),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Text(
                                            "Address: ${bPC.savedDataList![i].user!.address}"),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Text(
                                            "Phone: ${bPC.savedDataList![i].user!.phone}"),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Text(
                                            "Email: ${bPC.savedDataList![i].user!.email}"),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Text(
                                            "Type: ${bPC.savedDataList![i].types}"),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
