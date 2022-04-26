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
                                if(result.isNotEmpty && result[0].rawAddress.isNotEmpty && result!=null){
                                  print("There is wifi connection");
                                  Navigator.pop(context);
                                }
                              }on SocketException catch (_) {
                                print('not connected');
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

/*  noWifiConnection(BuildContext context){
    Widget AbortButton =
    TextButton(
        onPressed: () async {
          SystemNavigator.pop();
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width*0.31,
          color:ChooseColor(0).appBarColor1,
          child: Center(
            child: Text(
              'Abort'.toUpperCase(),
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,),
            ),
          ),
        ));

    Widget RetryButton = TextButton(
        onPressed: ()async{
          try{
            final result = await InternetAddress.lookup("example.com");
            if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
              print("There is wifi connection");
              Navigator.pop(context);
            }
          }on SocketException catch (_) {
            print('not connected');

          }
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width*0.31,
          color: ChooseColor(0).appBarColor1,
          child: Center(
            child: Text(
              'Retry'.toUpperCase(),
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
            ),
          ),
        ));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: const [
            Text("No Internet Connection",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16),),
            SizedBox(
              height: 10,
            ),
            Image(image:AssetImage('assets/images/network.png',),height: 60,width: 60,),
          ],
        ),
      ),
      content: const Padding(
        padding:  EdgeInsets.only(left: 40.0,right: 30,top: 10),
        child: Text(
          "Please recheck your internet connection and try again.",style: TextStyle(color: Colors.black54,fontSize: 16),),
      ),
      //Text("Are you sure to Place your Order ?"),
      actions: [
        AbortButton,
        RetryButton,
      ],
    );
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    showDialog(
      barrierDismissible:false,

      context: context,
      builder: (BuildContext
      context) {
        return alert;
      },
    );
  }*/
}
