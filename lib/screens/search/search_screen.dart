import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:ChooseColor(0).appBarColor1, // For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Search"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(vertical: size.height*0.020,horizontal: size.width*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height:130,
                  width:150,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: size.width*0.010,vertical: size.height*0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height*0.1,
                              child: Image.asset("icons/camera.png")),
                          SizedBox(height: size.height*0.0),
                          Center(child: Text("Camera",style: TextStyle(color: ChooseColor(0).appBarColor1,fontSize: size.height*0.009+size.width*0.009),))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width*0.070),
                SizedBox(
                  height:130,
                  width:150,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: size.width*0.010,vertical: size.height*0.010),
                      child: Column(
                        children: [
                          Image.asset("icons/gallery.png"),
                          SizedBox(height: size.height*0.020),
                          Center(child: Text("Gallery",style: TextStyle(color: ChooseColor(0).appBarColor1,fontSize: size.height*0.009+size.width*0.009),))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height*0.020),
            SizedBox(
              height:130,
              width:150,
              child: Card(
                elevation: 0,
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: size.width*0.010,vertical: size.height*0.010),
                  child: Column(
                    children: [
                      Image.asset("icons/colorMe.png"),
                      SizedBox(height: size.height*0.020),
                      Center(child: Text("Colour Name",style: TextStyle(color: ChooseColor(0).appBarColor1,fontSize: size.height*0.009+size.width*0.009),))
                    ],
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
