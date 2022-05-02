import 'dart:io';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';


class AlertBox{
  loginAlertBox1(BuildContext context) {
    showDialog(
        barrierDismissible:false,
        context: context,
        builder: (ctx) =>
            WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: const Text('Invalid Phone Number and password'),
                actions: [
                  SizedBox(
                    height: 40.0,
                    width: 80.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ChooseColor(0).appBarColor1
                        ),
                        onPressed: () {
                      Navigator.of(ctx).pop(true);
                    }, child: const Text('Edit')),
                  ),
                ],
              ),
            )
    );
  }

  loginAlertBox2(BuildContext context){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (ctx)=>
            WillPopScope(
              onWillPop: ()async=>false,
                child:AlertDialog(
                  title: const Text("Bad request",style: TextStyle(fontWeight: FontWeight.w400),),
                  actions: [
                    SizedBox(
                      height: 40.0,
                      width: 80.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ChooseColor(0).appBarColor1
                        ),
                        onPressed: (){
                        Navigator.of(context).pop(true);
                      }, child: const Text("OK"),),
                    )
                  ],
                ),
            )
    );
  }

  loginAlertBox3(BuildContext context){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx)=>
            WillPopScope(
              onWillPop: ()async=>false,
              child:AlertDialog(
                title: const Text("Invalid dealer code or password/unAuthorized user",style: TextStyle(fontWeight: FontWeight.w400),),
                actions: [
                  SizedBox(
                    height: 40.0,
                    width: 80.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ChooseColor(0).appBarColor1
                      ),
                      onPressed: (){
                      Navigator.of(context).pop(true);
                    }, child: const Text("OK"),),
                  )
                ],
              ),
            )
    );
  }

  universalAlertBox(BuildContext context){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx)=>
            WillPopScope(
              onWillPop: ()async=>false,
              child:AlertDialog(
                title: const Text("Some Unexpected error occurred",style: TextStyle(fontWeight: FontWeight.w400),),
                actions: [
                  SizedBox(
                    height: 40.0,
                    width: 80.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ChooseColor(0).appBarColor1
                      ),
                      onPressed: (){
                      Navigator.of(context).pop(true);
                    }, child: const Text("OK"),),
                  )
                ],
              ),
            )
    );
  }
  noWifiConnection(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return  WillPopScope(
          onWillPop: ()async=>false,
          child: AlertDialog(
            title: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const Text(
                          "No Internet Connection",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 12,bottom: 12),
                        child:Image.asset("icons/network.png")
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 12,bottom: 12),
                        child: const Text(
                          "Please check your internet connection",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        )
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () async{
                              SystemNavigator.pop();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color:ChooseColor(0).appBarColor1,
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10,bottom: 10),
                                  child: Text(
                                    "Abort",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async{
                              try{
                                final result = await InternetAddress.lookup("example.com");
                                if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
                                  Navigator.pop(context);
                                }
                              }on SocketException catch (_) {
                                final SnackBar snackBar = SnackBar(
                                  content:const Padding(
                                    padding: EdgeInsets.only(right:10),
                                    child: Text(
                                      'No Internet Connection',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(fontSize:14,color: Colors.red),),
                                  ),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: Colors.white,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                );
                                snackBarKey.currentState?.showSnackBar(snackBar);
                              }
                            },
                            child: Container(
                                decoration:BoxDecoration(
                                    color:ChooseColor(0).appBarColor1,
                                    borderRadius:const BorderRadius.all(Radius.circular(5))),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10,bottom: 10),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    // Navigator.of(context).pop();
  }

  Widget setupColorantsContainer(List<int>rValue,List<int>gValue,List<int>bValue, List<String?> cylinder,List<double?> cylinderVolume,List<double> price,BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 150.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cylinderVolume.length,
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding:EdgeInsets.symmetric(vertical: size.height*0.010),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height*0.030,
                        width: size.width*0.1,
                        decoration:BoxDecoration(
                          color:Color.fromRGBO(rValue[i], gValue[i], bValue[i], 3),
                          borderRadius:const BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      Text(
                        "${cylinder[i]}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.012+size.width*0.012,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "${cylinderVolume[i]} ml",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.012+size.width*0.012,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "${price[i] * cylinderVolume[i]!.truncateToDouble()}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.012+size.width*0.012,
                            fontWeight: FontWeight.w300),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            thickness: size.width*0.005,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: size.height*0.015+size.width*0.015,
                      fontWeight: FontWeight.w400),
                ),
                VerticalDivider(
                  color: Colors.black45,
                  thickness: size.width*0.005,
                ),
                Text(
                  "50 Rs",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height*0.012+size.width*0.012,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  priceDialogueBox(String? baseName,double? canSize,List<int>rValue,List<int>gValue,List<int>bValue, List<String?> cylinder,List<double?> cylinderVolume,List<double> price,BuildContext context) async {
    final size = MediaQuery.of(context).size;
    await showDialog(
      context:context,
      barrierDismissible: true,
      builder: (context) {
        return  WillPopScope(
          onWillPop: ()async=>false,
          child: AlertDialog(
            title: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.height*0.015+size.width*0.015,
                              fontWeight: FontWeight.w500),
                        ),
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon:const Icon(Icons.clear))

                      ],
                    ),
                    Text(
                      "Base",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: size.height*0.014+size.width*0.014,
                          fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      thickness: size.width*0.005,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$baseName",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height*0.012+size.width*0.012,
                                fontWeight: FontWeight.w300),
                          ),
                          VerticalDivider(
                            color: Colors.black45,
                            thickness: size.width*0.005,
                          ),
                          Text(
                            "$canSize ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height*0.012+size.width*0.012,
                                fontWeight: FontWeight.w300),
                          ),
                          VerticalDivider(
                            color: Colors.black45,
                            thickness: size.width*0.005,
                          ),
                          Text(
                            "Rs 0",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height*0.012+size.width*0.012,
                                fontWeight: FontWeight.w300),
                          ),
                          VerticalDivider(
                            color: Colors.black45,
                            thickness: size.width*0.005,
                          ),
                          Text(
                            "Rs 0",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height*0.012+size.width*0.012,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: size.width*0.005,
                    ),

                    SizedBox(height: size.height*0.005),
                    Text(
                      "Colorants",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: size.height*0.015+size.width*0.015,
                          fontWeight: FontWeight.w500),
                    ),


                  ],
                ),
              ),
            ),
            content: setupColorantsContainer(rValue,gValue,bValue,cylinder,cylinderVolume,price,context),
          ),
        );
      },
    );
    // Navigator.of(context).pop();
  }
}
