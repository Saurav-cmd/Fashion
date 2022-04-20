import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/static_testing_list/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ChooseColor(0).appBarColor1,
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Fashion Paints Store"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed("Order_history_screen");
            },
              child: Image.asset("icons/Stack.png")
          ),
          IconButton(onPressed:(){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home)),

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      hintText: 'Search Item by name',
                      prefixIcon:const Icon(Icons.search),
                      hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                    ),
                  ),
                ),
              ),
            ),

          Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
            child: Text("Artistic Paint",style: TextStyle(color:ChooseColor(0).appBarColor1,fontWeight: FontWeight.w600,fontSize: size.height*0.012+size.width*0.012),),
          ),
          GridView.builder(shrinkWrap: true,
              itemCount:storedData.length,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
          ), itemBuilder:(ctx,i){
            return Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.030),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: size.width*0.035,vertical: size.height*0.020),
                      child: Image.asset("icons/logo 2.png"),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: size.width*0.005,right: size.width*0.005,top: size.height*0.010),
                      child: Center(child: Text("FASHION MUSIC(1",style: TextStyle(fontSize: size.height*0.008+size.width*0.008),)),
                    ),
                    Text("ltr(pc))",style: TextStyle(fontSize: size.height*0.008+size.width*0.008),),
                    Padding(
                      padding:EdgeInsets.only(top: size.height*0.008),
                      child: Text("Rs 500",style: TextStyle(color: ChooseColor(0).buttonColor),),
                    ),
                  ],
                ),
              ),
            );
          }),


        ],
      ),
    );
  }
}
