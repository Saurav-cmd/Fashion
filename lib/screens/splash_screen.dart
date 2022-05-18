import 'dart:convert';

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
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../database/all_data_database.dart';
import '../models/apis_model/colorant_model.dart';
import '../models/apis_model/cosmetic_int_emulsion_model.dart';
import '../models/database_models/cosmetic_int_emulsion_database_model.dart';

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
      const token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZmFzaGlvbnBhaW50cy5iaWhhbml0ZWNoLmNvbVwvYXBpXC9sb2dpbiIsImlhdCI6MTY1MTk5NDMyNSwibmJmIjoxNjUxOTk0MzI1LCJqdGkiOiJ3Qk5WaHJiT1RKV0xCRlJHIiwic3ViIjoyMjIsInBydiI6IjMyY2IzOTAwNGMyYThlMjc1MWNlOTE2NTg4MmFiMDlmZGE0ZDEzMTcifQ.pDDXh0CqWvfn7l4tgiAE-Hn5j3weYHc-1VMBbUJBWOM";
      final url = Constants.baseUrl + "getdata";
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
      print("This is shared preference value $value");
      if (response.statusCode == 200) {
        print("This is response Data ${jsonDecode(response.body)}");
        CosmeticEmulsion cE = cosmeticEmulsionFromJson(response.body);
        ColorBase cB = colorBaseFromJson(response.body);
        ColorColorant cC = colorColorantFromJson(response.body);
        ShadeColor sCE = shadeColorFromJson(response.body);
        for (int i = 0; i < cE.cosmeticintemulsion!.length; i++) {
          DatabaseHelper.instance.addCosmeticIntData(CosmeticInt(
              cosmeticId: cE.cosmeticintemulsion![i].id,
              colorName: cE.cosmeticintemulsion![i].colorName,
              colorCode: cE.cosmeticintemulsion![i].colorCode,
              whf: cE.cosmeticintemulsion![i].WHF,
              fbf: cE.cosmeticintemulsion![i].FBF,
              fgf: cE.cosmeticintemulsion![i].FGF,
              fef: cE.cosmeticintemulsion![i].FEF,
              yof: cE.cosmeticintemulsion![i].YOF,
              fvf: cE.cosmeticintemulsion![i].FVF,
              iyf: cE.cosmeticintemulsion![i].IYF,
              mgf: cE.cosmeticintemulsion![i].MGF,
              irf: cE.cosmeticintemulsion![i].IRF,
              rof: cE.cosmeticintemulsion![i].ROF,
              erf: cE.cosmeticintemulsion![i].ERF,
              myf: cE.cosmeticintemulsion![i].MYF,
              lbf: cE.cosmeticintemulsion![i].LBF,
              lgf: cE.cosmeticintemulsion![i].LGF,
              eyf: cE.cosmeticintemulsion![i].EYF,
              ruf: cE.cosmeticintemulsion![i].RUF,
              base: cE.cosmeticintemulsion![i].base!.toDouble(),
              // base: double.parse(cE.cosmeticintemulsion![i].base.toString()),
              bVolume:
                  double.parse(cE.cosmeticintemulsion![i].bVolume.toString())
                      .toStringAsFixed(2),
              fandeck: cE.cosmeticintemulsion![i].fandeck!.toDouble(),
              // fandeck: double.parse(cE.cosmeticintemulsion![i].fandeck.toString()),
              formulation: cE.cosmeticintemulsion![i].formulation));
        }
        for (int i = 0; i < cB.colorBase!.length; i++) {
          DatabaseHelper.instance.addColorBaseData(DatabaseColorBase(
            bId: cB.colorBase![i].id,
            base: cB.colorBase![i].base,
            unitPrice1: cB.colorBase![i].unitPrice1!.toDouble(),
            unitPrice2: cB.colorBase![i].unitPrice2!.toDouble(),
            unitPrice3: cB.colorBase![i].unitPrice3!.toDouble(),
            unitPrice4: cB.colorBase![i].unitPrice4!.toDouble(),
            kGLtrFlag: cB.colorBase![i].kgLtrFlag!.toDouble(),
          ));
        }
        for (int i = 0; i < cC.colorColorant!.length; i++) {
          DatabaseHelper.instance
              .addColorColorantData(Colorants(
            id: cC.colorColorant![i].id,
            colorantName: cC.colorColorant![i].colorantName,
            colorantCode: cC.colorColorant![i].colorantCode,
            unitPrice: double.parse(
                cC.colorColorant![i].unitPrice!.toStringAsFixed(2)),
            rValue: double.parse(cC.colorColorant![i].rValue.toString()),
            gValue: double.parse(cC.colorColorant![i].gValue.toString()),
            bValue: double.parse(cC.colorColorant![i].bValue.toString()),
          ))
              .whenComplete(() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            value = true;
            prefs.setBool(Constants.DATA_DOWNLOAD, value!);
            doLogin();
            /*setState(() {
                     doLogin();
                    });*/
            for (int i = 0; i < sCE.shadeColor!.length; i++) {
              DatabaseHelper.instance
                  .addShadeColorData(ShadeColorDatabase(
                    id: sCE.shadeColor![i].id,
                    sId: sCE.shadeColor![i].s_id,
                    colorCode: sCE.shadeColor![i].colorCode,
                    colorName: sCE.shadeColor![i].colorName,
                    styledist:
                        double.parse(sCE.shadeColor![i].styledist.toString()),
                    weatherproofextemulsion: double.parse(
                        sCE.shadeColor![i].weatherproofextemulsion.toString()),
                    smartdist:
                        double.parse(sCE.shadeColor![i].smartdist.toString()),
                    cosmeticintemulsion: double.parse(
                        sCE.shadeColor![i].cosmeticintemulsion.toString()),
                    magnetextemulsion: double.parse(
                        sCE.shadeColor![i].magnetextemulsion.toString()),
                    rValue: double.parse(sCE.shadeColor![i].rValue.toString()),
                    gValue: double.parse(sCE.shadeColor![i].gValue.toString()),
                    bValue: double.parse(sCE.shadeColor![i].bValue.toString()),
                  ))
                  .whenComplete(() async {});
            }
          });
        }
      }
    } else {
      doLogin();
    }
  }

  Future doLogin() async {
    print("doLogin vhitra");
    Future.delayed(const Duration(seconds: 3), () async {
      final autoLogin = await aC.autoLogin();
      if (autoLogin.toString().isEmpty || autoLogin == null) {
        Navigator.of(context).pushReplacementNamed('Button_Navigation_Bar');
      } else {
        if (mounted) {
          Navigator.of(context)
              .pushReplacementNamed('Dealer_button_Navigation_Bar');
        }
      }
      /*else if (autoLogin.toString().isNotEmpty || autoLogin!=null) {

        }*/
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addApiDataToDatabase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      doLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: value == null || value == false
            ? Card(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("icons/logo 2.png"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                        color: ChooseColor(0).appBarColor1,
                      )),
                      const SizedBox(width: 10),
                      const Center(
                          child: Text("Downloading Data Please Wait..."))
                    ],
                  ),
                ],
              ))
            : Image.asset("icons/logo 2.png"));
  }
}
