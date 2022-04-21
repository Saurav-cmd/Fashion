import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:ChooseColor(0).appBarColor1,
          statusBarIconBrightness: Brightness.light// For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Save"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.040,vertical: size.height*0.015),
              child: Form(
                child:   TextFormField(
                  decoration:InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.030),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    // labelText: 'Phone Number',
                    fillColor:const Color(0xffF6F9FA),
                    filled: true,
                    hintText: 'Search customer',
                    prefixIcon:const Icon(Icons.search),
                    hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
