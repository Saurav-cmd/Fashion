import 'package:fashion_paints/Utils/contants.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/auth_controller.dart';
import 'package:fashion_paints/models/apis_model/color_base_model.dart';
import 'package:fashion_paints/models/apis_model/shade_color_model.dart';
import 'package:fashion_paints/models/database_models/color_base_database_model.dart';
import 'package:fashion_paints/models/database_models/colorant_database_model.dart';
import 'package:fashion_paints/models/database_models/shade_color_database_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../database/all_data_database.dart';
import '../models/apis_model/colorant_model.dart';
import '../models/apis_model/doubled_fencee_model.dart';
import '../models/database_models/doubled_fencee_database_ model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController aC = Get.put(AuthController());
  bool? value;

  addApiDataToDatabase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    value = sharedPreferences.getBool(Constants.DATA_DOWNLOAD);
    if (value == null || value != true) {
      const token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTA3OTA0MjgsIm5iZiI6MTY1MDc5MDQyOCwianRpIjoiVDdMWTFFejdHZTZJa1VkRyIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.sT2nPLscSVgot0k9iCsbUxLtiTk8dz5BrSPLmVVbSFA";
      final url = Constants.baseUrl + "getdata";
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      print("This is shared preference value $value");
      if (response.statusCode == 200) {
        Doubledfenceee dF = doubledfenceeeFromJson(response.body);
        ColorBase cB = colorBaseFromJson(response.body);
        ColorColorant cC = colorColorantFromJson(response.body);
        ShadeColor sCE = shadeColorFromJson(response.body);
        print("balla add hudai xa");
        for (int i = 0; i < dF.doubledefenceee!.length; i++) {
          DatabaseHelper.instance.addDoubleFenceeData(DoubleDefenceee(
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
          ));
        }

        for (int i = 0; i < cB.colorBase!.length; i++) {
          DatabaseHelper.instance.addColorBaseData(DatabaseColorBase(
            bId: cB.colorBase![i].id,
            base: cB.colorBase![i].base,
            unitPrice1: double.parse(cB.colorBase![i].unitPrice1.toString()),
            unitPrice2: double.parse(cB.colorBase![i].unitPrice2.toString()),
            unitPrice3: double.parse(cB.colorBase![i].unitPrice3.toString()),
            unitPrice4: double.parse(cB.colorBase![i].unitPrice4.toString()),
            kGLtrFlag: double.parse(cB.colorBase![i].kgLtrFlag.toString()),
          ));
        }

        for(int i=0;i<cC.colorColorant!.length;i++){
          DatabaseHelper.instance.addColorColorantData(Colorants(
            id: cC.colorColorant![i].id,
            colorantName: cC.colorColorant![i].colorantName,
            colorantCode: cC.colorColorant![i].colorantCode,
            unitPrice: cC.colorColorant![i].unitPrice,
            rValue:double.parse(cC.colorColorant![i].rValue.toString()),
            gValue:double.parse(cC.colorColorant![i].gValue.toString()),
            bValue:double.parse(cC.colorColorant![i].bValue.toString()),
            createdAt: cC.colorColorant![i].createdAt,
            updatedAt: cC.colorColorant![i].updatedAt
          ));
        }

        for(int i=0;i<sCE.shadeColor!.length;i++){
          DatabaseHelper.instance.addShadeColorData(ShadeColorDatabase(
            id: sCE.shadeColor![i].id,
            sId: sCE.shadeColor![i].sId,
            colorCode: sCE.shadeColor![i].colorCode,
            colorName: sCE.shadeColor![i].colorName,
            doubleDefenceEe:double.parse(sCE.shadeColor![i].doubleDefenceEe.toString()),
            elegaIe: double.parse(sCE.shadeColor![i].elegaIe.toString()),
            newBarpimoIe: double.parse(sCE.shadeColor![i].newBarpimoIe.toString()),
            newShangrilaIe: double.parse(sCE.shadeColor![i].newShangrilaIe.toString()),
            newShangrilaEe: double.parse(sCE.shadeColor![i].newShangrilaEe.toString()),
            protecEe: double.parse(sCE.shadeColor![i].protecEe.toString()),
            relianceDist: double.parse(sCE.shadeColor![i].relianceDist.toString()),
            shangrilaDist: double.parse(sCE.shadeColor![i].shangrilaDist.toString()),
            rValue: double.parse(sCE.shadeColor![i].rValue.toString()),
            gValue: double.parse(sCE.shadeColor![i].gValue.toString()),
            bValue: double.parse(sCE.shadeColor![i].bValue.toString()),
            newUltraProtecEe: double.parse(sCE.shadeColor![i].newUltraProtecEe.toString())
          )).whenComplete(()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            value = true;
            prefs.setBool(Constants.DATA_DOWNLOAD, value!);
            setState(() {
              doLogin();
            });
          });
        }
      }
    } else {
      doLogin();
    }
  }

  Future doLogin() async {
    Future.delayed(const Duration(seconds: 3), () async {
      final autoLogin = await aC.autoLogin();
      if (autoLogin != null) {
        Navigator.of(context).pushReplacementNamed('Button_Navigation_Bar');
      } else if (autoLogin == null) {
        Navigator.of(context)
            .pushReplacementNamed('Dealer_button_Navigation_Bar');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addApiDataToDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: value==null || value==false?Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("icons/logo 2.png"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Center(child: CircularProgressIndicator(
                  color: ChooseColor(0).appBarColor1,
                )),
                const SizedBox(width: 10),
                const Center(child: Text("Downloading Data Please Wait..."))
              ],
            ),

          ],
        )
    ):Image.asset("icons/logo 2.png"));
  }
}
