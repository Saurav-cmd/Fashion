import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/bipana_preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/dilogue_box.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? images;
  BipaniPreviewController bPC = Get.put(BipaniPreviewController());

  String? userCode;
  String? token;
  getSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      userCode = jsonDecode(userData)['userCode'];
      token = jsonDecode(userData)['token'];
    }
  }

  getImageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (image == null) {
      return;
    }
    final temporaryImage = File(image.path);
    setState(() {
      images = temporaryImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => bPC.isLoading.value == true ? false : true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
        body: Container(
          color: ChooseColor(0).appBarColor1,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.040,
                  vertical: size.height * 0.020),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please fill up the form",
                      style: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.020),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: size.height * 0.009 + size.width * 0.009,
                          color: Colors.white),
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
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.020),
                    Text(
                      "Email Address",
                      style: TextStyle(
                          fontSize: size.height * 0.009 + size.width * 0.009,
                          color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.005),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your email address";
                        } else if (!value.contains("@")) {
                          return "Please enter valid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.020),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: size.height * 0.009 + size.width * 0.009,
                          color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.005),
                    TextFormField(
                      keyboardType: TextInputType.number,
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
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your phone number";
                        } else if (value.length > 10) {
                          return "Number can't be greater than 10 digits";
                        } else if (value.length < 10) {
                          return "Please enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                      controller: phoneController,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    ),
                    SizedBox(height: size.height * 0.020),
                    Text(
                      "Address",
                      style: TextStyle(
                          fontSize: size.height * 0.009 + size.width * 0.009,
                          color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.005),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
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
                        hintText: 'Address',
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                      ),
                      controller: addressController,
                      validator: (value) {
                        if (value == null) {
                          return "Please enter your address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.020),
                    Text(
                      "Images",
                      style: TextStyle(
                          fontSize: size.height * 0.009 + size.width * 0.009,
                          color: Colors.white),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.099,
                          width: size.height * 0.099,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: IconButton(
                            onPressed: () {
                              getImageFromCamera();
                            },
                            tooltip: 'Pick Image',
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: ChooseColor(0).appBarColor1,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.015),
                        if (images != null)
                          Container(
                            height: size.height * 0.099,
                            width: size.width * 0.15,
                            child: Image.file(
                              images!,
                              fit: BoxFit.fill,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.035),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: double.infinity, height: size.height * 0.055),
                      child: ElevatedButton(
                        child: Text(
                          'Submit',
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
                              print("There is wifi connection");
                              if (_form.currentState != null &&
                                  _form.currentState!.validate()) {
                                bPC.sendBipaniaPreviewCameraData(
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text,
                                    addressController.text,
                                    userCode ?? "",
                                    images,
                                    context);
                                FocusManager.instance.primaryFocus?.unfocus();

                                nameController.text = "";
                                emailController.text = "";
                                phoneController.text = "";
                                addressController.text = "";
                              }
                            }
                          } on SocketException catch (_) {
                            AlertBox().noWifiConnection(12, "", "", context);
                            print('not connected');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: ChooseColor(0).buttonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
