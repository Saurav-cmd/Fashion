import 'dart:convert';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BipanaPreviewScreen extends StatefulWidget {
  const BipanaPreviewScreen({Key? key}) : super(key: key);

  @override
  State<BipanaPreviewScreen> createState() => _BipanaPreviewScreenState();
}

class _BipanaPreviewScreenState extends State<BipanaPreviewScreen> {
  String? token;

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
            } else if (token == null) {
              Navigator.of(context)
                  .pushReplacementNamed("Button_Navigation_Bar");
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Bipana Preview"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.030, vertical: size.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Try Bipana preview with stock images",
                style: TextStyle(
                    fontSize: size.height * 0.011 + size.width * 0.011),
              ),
              SizedBox(height: size.height * 0.020),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff031545),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Exterior_screen");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.030),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exterior",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: size.height * 0.014 +
                                        size.width * 0.014),
                              ),
                              SizedBox(height: size.height * 0.020),
                              Text(
                                "Images",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.height * 0.012 +
                                        size.width * 0.012),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: size.width * 0.6,
                            child: Image.asset(
                              "images/bipanaPreview1.png",
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  )),
              SizedBox(height: size.height * 0.020),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff856242),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: size.width * 0.6,
                        child: Image.asset(
                          "images/bipanaPreview2.png",
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Interior",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    size.height * 0.014 + size.width * 0.014),
                          ),
                          SizedBox(height: size.height * 0.020),
                          Text(
                            "Images",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    size.height * 0.012 + size.width * 0.012),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Text(
                "Bipana Preview",
                style: TextStyle(
                    fontSize: size.height * 0.011 + size.width * 0.011),
              ),
              SizedBox(height: size.height * 0.020),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff031545),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed("Exterior_screen");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.030),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My House",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: size.height * 0.014 +
                                        size.width * 0.014),
                              ),
                              SizedBox(height: size.height * 0.020),
                              Text(
                                "Images",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.height * 0.012 +
                                        size.width * 0.012),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.17,
                            child: Image.asset(
                              "images/my house.jfif",
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  )),
              SizedBox(height: size.height * 0.020),
              Text(
                "Send us your house photos for Bipana preview",
                style: TextStyle(
                    fontSize: size.height * 0.011 + size.width * 0.011),
              ),
              SizedBox(height: size.height * 0.010),
              Text(
                "Note:Please upload a quality image of your house for better result, or our MR will contact you for preview image",
                style: TextStyle(
                    fontSize: size.height * 0.008 + size.width * 0.008,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Camera_screen");
                    },
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.030,
                              vertical: size.height * 0.010),
                          child: Column(
                            children: [
                              Image.asset("icons/camera.png"),
                              SizedBox(height: size.height * 0.020),
                              Center(
                                  child: Text(
                                "Camera",
                                style: TextStyle(
                                    color: ChooseColor(0).appBarColor1,
                                    fontSize: size.height * 0.009 +
                                        size.width * 0.009),
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
                      Navigator.of(context).pushNamed("Gallery_screen");
                    },
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.030,
                              vertical: size.height * 0.010),
                          child: Column(
                            children: [
                              Image.asset("icons/gallery.png"),
                              SizedBox(height: size.height * 0.020),
                              Center(
                                  child: Text(
                                "Gallery",
                                style: TextStyle(
                                    color: ChooseColor(0).appBarColor1,
                                    fontSize: size.height * 0.009 +
                                        size.width * 0.009),
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
              Text(
                "Try with your previous images",
                style: TextStyle(
                    fontSize: size.height * 0.011 + size.width * 0.011,
                    color: ChooseColor(0).appBarColor1),
              ),
              SizedBox(height: size.height * 0.020),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("Bipana_Preview_Saved_Screen");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.075),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.010,
                            vertical: size.height * 0.010),
                        child: Column(
                          children: [
                            Image.asset("icons/saved1.png"),
                            SizedBox(height: size.height * 0.020),
                            Center(
                                child: Text(
                              "Saved",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
