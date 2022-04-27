import 'package:fashion_paints/controllers/auth_controller.dart';
import 'package:fashion_paints/models/apis_model/color_base_model.dart';
import 'package:fashion_paints/models/database_models/color_base_database_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../database/all_data_database.dart';
import '../models/apis_model/doubled_fencee_model.dart';
import '../models/database_models/doubled_fencee_database_ model.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
AuthController aC = Get.put(AuthController());
bool value=false;

class _SplashScreenState extends State<SplashScreen> {

  saveBoolValue()async{
    print("saveBoolValue $value");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("boolValue", value);
    setState(() {
      addApiDataToDatabase();
    });
  }

  addApiDataToDatabase()async{
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTA3OTA0MjgsIm5iZiI6MTY1MDc5MDQyOCwianRpIjoiVDdMWTFFejdHZTZJa1VkRyIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.sT2nPLscSVgot0k9iCsbUxLtiTk8dz5BrSPLmVVbSFA";
    const url = "http://reliancetint.bihanitech.com/api/getdata";
    final response = await http.get(Uri.parse(url),headers: {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token",
    });
    bool? sharedPreferenceData;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sharedPreferenceData = prefs.getBool("boolValue");
    print("This is shared preference value $sharedPreferenceData");
    if(response.statusCode==200){
      Doubledfenceee dF = doubledfenceeeFromJson(response.body);
      ColorBase cB = colorBaseFromJson(response.body);
      if(sharedPreferenceData==false) {
        print("balla add hudai xa");
        for (int i = 0; i < dF.doubledefenceee!.length; i++) {
          DatabaseHelper.instance.addDoubleFenceeData(
              DoubleDefenceee(
                colorName: dF.doubledefenceee![i].colorName,
                colorCode: dF.doubledefenceee![i].colorCode,
                xT: dF.doubledefenceee![i].xt,
                tT: dF.doubledefenceee![i].lt,
                lS: dF.doubledefenceee![i].ls,
                mS: dF.doubledefenceee![i].ms,
                rT: dF.doubledefenceee![i].rt,
                fT: dF.doubledefenceee![i].ft,
                kS: dF.doubledefenceee![i].ks,
                mM: dF.doubledefenceee![i].mm,
                rS: dF.doubledefenceee![i].rs,
                vT: dF.doubledefenceee![i].vt,
                pP: dF.doubledefenceee![i].pp,
                zT: dF.doubledefenceee![i].zt,
                mT: dF.doubledefenceee![i].mt,
                lT: dF.doubledefenceee![i].lt,
                uS: dF.doubledefenceee![i].us,
                sT: dF.doubledefenceee![i].st,
                base: double.parse(dF.doubledefenceee![i].base.toString()),
                bVolume: dF.doubledefenceee![i].bVolume,
                fanDeck: double.parse(dF.doubledefenceee![i].fandeck.toString()),
              )
          );
        }

        for(int i=0;i<cB.colorBase!.length;i++){
          DatabaseHelper.instance.addColorBaseData(DatabaseColorBase(
            bId: cB.colorBase![i].id,
            base: cB.colorBase![i].base,
            unitPrice1: double.parse(cB.colorBase![i].unitPrice1.toString()),
            unitPrice2: double.parse(cB.colorBase![i].unitPrice2.toString()),
            unitPrice3: double.parse(cB.colorBase![i].unitPrice3.toString()),
            unitPrice4: double.parse(cB.colorBase![i].unitPrice4.toString()),
            kGLtrFlag: double.parse(cB.colorBase![i].kgLtrFlag.toString()),
          )
          ).whenComplete(()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            value = true;
            prefs.setBool("boolValue", value);
            setState(() {
              doLogin();
            });
          });
        }
      }
      else{
        print("Already Added");
      }
    }
  }

  Future doLogin()async{
    print("auto login ma check hudai xa aaba");
    Future.delayed(const Duration(seconds: 3),()async{
      final autoLogin =await aC.autoLogin();
      if(autoLogin!=null){
        Navigator.of(context).pushReplacementNamed('Button_Navigation_Bar');
      }else if(autoLogin == null){
        Navigator.of(context).pushReplacementNamed('Dealer_button_Navigation_Bar');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveBoolValue();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Center(child:Image.asset("icons/logo 2.png")));
  }
}
