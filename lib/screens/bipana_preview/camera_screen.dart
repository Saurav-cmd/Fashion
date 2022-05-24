import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("Bipana_Preview_screen");
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Container(
        color: ChooseColor(0).appBarColor1,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.040, vertical: size.height * 0.020),
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
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                    controller: nameController,
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
                      if (value!.length > 10) {
                        return "Number can't be greater than 10 digits";
                      }
                    },
                    controller: phoneController,
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
                  ),
                  SizedBox(height: size.height * 0.020),
                  Text(
                    "Images",
                    style: TextStyle(
                        fontSize: size.height * 0.009 + size.width * 0.009,
                        color: Colors.white),
                  ),
                  SizedBox(height: size.height * 0.005),
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
                  SizedBox(height: size.height * 0.035),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: double.infinity, height: size.height * 0.055),
                    child: ElevatedButton(
                      child: Text(
                        'Submit',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: size.height * 0.014 + size.width * 0.014),
                      ),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
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
    );
  }
}
