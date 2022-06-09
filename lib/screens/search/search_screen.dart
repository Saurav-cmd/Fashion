import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'image_collor_picker.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? token;
  TextEditingController searchController = TextEditingController();

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        token = jsonDecode(userData)['token'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  final ImagePicker imagePicker = ImagePicker();

  File? galleryCameraImage;
  void pickImageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (image == null) {
      return;
    }
    final temporaryImage = File(image.path);
    setState(() {
      galleryCameraImage = temporaryImage;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => ColorPicker(
                cameraImage: galleryCameraImage,
                title: "Camera Search",
              )));
    });
  }

  void selectGalleryImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (image == null) {
      return;
    }
    final temporaryImage = File(image.path);
    setState(() {
      galleryCameraImage = temporaryImage;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => ColorPicker(
                cameraImage: galleryCameraImage,
                title: "Gallery Search",
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light // For iOS (dark icons)
            ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (token != null) {
              Navigator.of(context)
                  .pushReplacementNamed("Dealer_button_Navigation_Bar");
            } else {
              Navigator.of(context).pushNamed("Button_Navigation_Bar");
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                if (token != null) {
                  Navigator.of(context)
                      .pushNamed("Dealer_button_Navigation_Bar");
                } else {
                  Navigator.of(context).pushNamed("Button_Navigation_Bar");
                }
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.020, horizontal: size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImageFromCamera();
                  },
                  child: SizedBox(
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: size.width <= 411.42857142857144 &&
                                size.height <= 683.4285714285714
                            ? EdgeInsets.symmetric(
                                horizontal: size.width * 0.050,
                                vertical: size.height * 0.019)
                            : EdgeInsets.symmetric(
                                horizontal: size.width * 0.015,
                                vertical: size.height * 0.015),
                        child: Column(
                          children: [
                            SizedBox(
                                height: size.height * 0.1,
                                child: Image.asset("icons/camera.png")),
                            SizedBox(height: size.height * 0.0),
                            Center(
                                child: Text(
                              "Camera",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontSize:
                                      size.height * 0.009 + size.width * 0.009),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.070),
                GestureDetector(
                  onTap: () {
                    selectGalleryImage();
                  },
                  child: SizedBox(
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.060,
                            vertical: size.height * 0.015),
                        child: Column(
                          children: [
                            Image.asset("icons/gallery.png"),
                            SizedBox(height: size.height * 0.020),
                            Center(
                                child: Text(
                              "Gallery",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontSize:
                                      size.height * 0.009 + size.width * 0.009),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.020),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("Color_screen");
              },
              child: SizedBox(
                height: 125,
                width: 150,
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.010,
                        vertical: size.height * 0.010),
                    child: Column(
                      children: [
                        Image.asset("icons/colorMe.png"),
                        SizedBox(height: size.height * 0.020),
                        Center(
                            child: Text(
                          "Colour Name",
                          style: TextStyle(
                              color: ChooseColor(0).appBarColor1,
                              fontSize:
                                  size.height * 0.009 + size.width * 0.009),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
