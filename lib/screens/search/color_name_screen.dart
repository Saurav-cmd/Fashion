import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Search_Screen");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ChooseColor(0).appBarColor1,
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Search code"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home)),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.040,vertical: size.height*0.015),
              child: Form(
                key:_form,
                child:TextFormField(
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
                    hintText: 'Search colour code',
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
