import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'https://static9.depositphotos.com/1167801/1083/i/600/depositphotos_10837356-stock-photo-paint-dripping.jpg',
    'https://www.californiapaints.com/wp-content/uploads/Painting-Basics.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor2, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: ChooseColor(0).appBarColor2,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
            // height: size.height*0.050,
            width: size.width * 0.30,
            child: Image.asset(
              "icons/logo 2.png",
              fit: BoxFit.fill,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.030, vertical: size.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.network(e, fit: BoxFit.cover),
                              )
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: size.height * 0.3,
                  autoPlay: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ChooseColor(0).buttonColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.030),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    size.height * 0.012 + size.width * 0.012),
                          ),
                          SizedBox(height: size.height * 0.020),
                          Text(
                            "Explore our wide range of",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    size.height * 0.012 + size.width * 0.012),
                          ),
                          Text(
                            "products",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    size.height * 0.012 + size.width * 0.012),
                          )
                        ],
                      ),
                    ),
                    Image.asset("icons/smart 1.png")
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.005),
                child: Text(
                  "Fashion Paints Menu",
                  style: TextStyle(
                      color: ChooseColor(0).appBarColor1,
                      fontWeight: FontWeight.w700,
                      fontSize: size.height * 0.012 + size.width * 0.012),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      FlutterWebBrowser.openWebPage(
                          url:
                              "https://fashionpaints.com.np/color-personality/");
                      // Navigator.of(context)
                      //     .pushNamed("Color_Personality_screen");
                    },
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.010),
                          child: Column(
                            children: [
                              Image.asset("icons/Vector1.png"),
                              Center(
                                  child: Text(
                                "Color Personality",
                                style: TextStyle(
                                    color: ChooseColor(0).appBarColor1,
                                    fontSize: size.height * 0.009 +
                                        size.width * 0.009),
                              )),
                              SizedBox(height: size.height * 0.010),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Bipana_Preview_screen");
                    },
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.010,
                              vertical: size.height * 0.010),
                          child: Column(
                            children: [
                              Image.asset(
                                  "icons/undraw_house_searching_re_stk8 (1) 1.png"),
                              SizedBox(height: size.height * 0.030),
                              Center(
                                  child: Text(
                                "Bipana preview",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Search_Screen");
                    },
                    child: SizedBox(
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.050,
                              vertical: size.height * 0.010),
                          child: Column(
                            children: [
                              Image.asset(
                                  "icons/undraw_searching_re_3ra9 1.png"),
                              SizedBox(height: size.height * 0.020),
                              Center(
                                  child: Text(
                                "Search",
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
              SizedBox(height: size.height * 0.015),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("Find_Painter_Second_screen");
                },
                child: SizedBox(
                  height: 120,
                  width: 116,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.010,
                          vertical: size.height * 0.010),
                      child: Column(
                        children: [
                          Image.asset(
                              "icons/undraw_people_search_re_5rre 1.png"),
                          SizedBox(height: size.height * 0.020),
                          Center(
                              child: Text(
                            "Find a painter",
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
      ),
    );
  }
}
