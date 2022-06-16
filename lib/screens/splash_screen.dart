import 'package:fashion_paints/Utils/contants.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/auth_controller.dart';
import 'package:fashion_paints/models/apis_model/color_base_model.dart';
import 'package:fashion_paints/models/apis_model/shade_color_model.dart';
import 'package:fashion_paints/models/database_models/color_base_database_model.dart';
import 'package:fashion_paints/models/database_models/colorant_database_model.dart';
import 'package:fashion_paints/models/database_models/magnetic_ext_emulsion_model.dart';
import 'package:fashion_paints/models/database_models/shade_color_database_model.dart';
import 'package:fashion_paints/models/database_models/smart_dist_model.dart';
import 'package:fashion_paints/models/database_models/style_dist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../database/all_data_database.dart';
import '../models/apis_model/WeatherProofEmulsiton_api_model.dart';
import '../models/apis_model/colorant_model.dart';
import '../models/apis_model/cosmetic_int_emulsion_model.dart';
import '../models/apis_model/magnetic_ext_emulsion_api_model.dart';
import '../models/apis_model/smart_dist_api_model.dart';
import '../models/apis_model/style_dist_api_model.dart';
import '../models/database_models/cosmetic_int_emulsion_database_model.dart';
import '../models/database_models/weather_proof_extemulsion_model.dart';
import '../widgets/dilogue_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController aC = Get.put(AuthController());
  bool? value;
  bool hasConnection = false;

  final cosmeticData = DatabaseHelper.instance.getCosmeticIntData();
  final weatherProofDaa = DatabaseHelper.instance.getWeatherExtData();
  final styleDistData = DatabaseHelper.instance.getStyleDist();
  final smartDistData = DatabaseHelper.instance.getSmartDist();
  final magneticData = DatabaseHelper.instance.getMagnetExt();
  final colorBaseData = DatabaseHelper.instance.getColorBaseData();
  final colorantData = DatabaseHelper.instance.getColorColorantData();

  simpleNetworkError() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: const Text(
                  "There is some issue in your internet connection please check!",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 80.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ChooseColor(0).appBarColor1),
                          onPressed: () async {
                            Navigator.pop(context);
                            await addApiDataToDatabase();
                          },
                          child: const Text("Retry"),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                        width: 80.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ChooseColor(0).appBarColor1),
                          onPressed: () {
                            DatabaseHelper.instance.cleanDatabase();
                            SystemNavigator.pop();
                            /*Navigator.of(context).pop(true);
                            Navigator.of(context).pop(true);*/
                          },
                          child: const Text("OK"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  addApiDataToDatabase() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    value = sharedPreferences.getBool(Constants.DATA_DOWNLOAD);
    if (value == null || value != true) {
      try {
        DatabaseHelper.instance.cleanDatabase();
        final url = Constants.baseUrl + "getdata";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          CosmeticEmulsion cE = cosmeticEmulsionFromJson(response.body);
          WeatherProofEmulsion wPE =
              weatherProofEmulsionFromJson(response.body);
          StyleDistemper sD = styleDistemperFromJson(response.body);
          SmartDistemper smartD = smartDistemperFromJson(response.body);
          MagneticExteriorEmulsion mE =
              magneticExteriorEmulsionFromJson(response.body);
          ColorBase cB = colorBaseFromJson(response.body);
          ColorColorant cC = colorColorantFromJson(response.body);
          ShadeColor sCE = shadeColorFromJson(response.body);

          for (int i = 0; i < cE.cosmeticintemulsion!.length; i++) {
            print("second ma yo vhitra aayo");
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
                bVolume:
                    double.parse(cE.cosmeticintemulsion![i].bVolume.toString())
                        .toStringAsFixed(2),
                fandeck: cE.cosmeticintemulsion![i].fandeck!.toDouble(),
                formulation: cE.cosmeticintemulsion![i].formulation));
          }

          for (int i = 0; i < wPE.weatherproofextemulsion!.length; i++) {
            print("third ma yo vhitra aayo");
            DatabaseHelper.instance.addWeatherExtData(WeatherProofExtemusion(
              weatherId: wPE.weatherproofextemulsion![i].id,
              colorName: wPE.weatherproofextemulsion![i].colorName,
              colorCode: wPE.weatherproofextemulsion![i].colorCode,
              whf: wPE.weatherproofextemulsion![i].whf,
              fbf: wPE.weatherproofextemulsion![i].fbf,
              fgf: wPE.weatherproofextemulsion![i].fgf,
              fef: wPE.weatherproofextemulsion![i].fef,
              yof: wPE.weatherproofextemulsion![i].yof,
              fvf: wPE.weatherproofextemulsion![i].fvf,
              iyf: wPE.weatherproofextemulsion![i].iyf,
              mgf: wPE.weatherproofextemulsion![i].mgf,
              irf: wPE.weatherproofextemulsion![i].irf,
              rof: wPE.weatherproofextemulsion![i].rof,
              erf: wPE.weatherproofextemulsion![i].erf,
              myf: wPE.weatherproofextemulsion![i].myf,
              lbf: wPE.weatherproofextemulsion![i].lbf,
              lgf: wPE.weatherproofextemulsion![i].lgf,
              eyf: wPE.weatherproofextemulsion![i].eyf,
              ruf: wPE.weatherproofextemulsion![i].ruf,
              base: wPE.weatherproofextemulsion![i].base!.toDouble(),
              bVolume: double.parse(
                      wPE.weatherproofextemulsion![i].bVolume.toString())
                  .toStringAsFixed(2),
              fandeck: wPE.weatherproofextemulsion![i].fandeck!.toDouble(),
            ));
          }

          for (int i = 0; i < sD.styledist!.length; i++) {
            print("fourth ma yo vhitra aayo");
            DatabaseHelper.instance.addStyleDist(StyleDist(
              styleId: sD.styledist![i].id,
              colorName: sD.styledist![i].colorName,
              colorCode: sD.styledist![i].colorCode,
              whf: sD.styledist![i].whf,
              fbf: sD.styledist![i].fbf,
              fgf: sD.styledist![i].fgf,
              fef: sD.styledist![i].fef,
              yof: sD.styledist![i].yof,
              fvf: sD.styledist![i].fvf,
              iyf: sD.styledist![i].iyf,
              mgf: sD.styledist![i].mgf,
              irf: sD.styledist![i].irf,
              rof: sD.styledist![i].rof,
              erf: sD.styledist![i].erf,
              myf: sD.styledist![i].myf,
              lbf: sD.styledist![i].lbf,
              lgf: sD.styledist![i].lgf,
              eyf: sD.styledist![i].eyf,
              ruf: sD.styledist![i].ruf,
              base: sD.styledist![i].base!.toDouble(),
              bVolume: double.parse(sD.styledist![i].bVolume.toString())
                  .toStringAsFixed(2),
              fandeck: sD.styledist![i].fandeck!.toDouble(),
            ));
          }

          for (int i = 0; i < smartD.smartdist!.length; i++) {
            print("fifth ma yo vhitra aayo");
            DatabaseHelper.instance.addSmartDist(SmartDist(
              smartId: smartD.smartdist![i].id,
              colorName: smartD.smartdist![i].colorName,
              colorCode: smartD.smartdist![i].colorCode,
              whf: smartD.smartdist![i].whf,
              fbf: smartD.smartdist![i].fbf,
              fgf: smartD.smartdist![i].fgf,
              fef: smartD.smartdist![i].fef,
              yof: smartD.smartdist![i].yof,
              fvf: smartD.smartdist![i].fvf,
              iyf: smartD.smartdist![i].iyf,
              mgf: smartD.smartdist![i].mgf,
              irf: smartD.smartdist![i].irf,
              rof: smartD.smartdist![i].rof,
              erf: smartD.smartdist![i].erf,
              myf: smartD.smartdist![i].myf,
              lbf: smartD.smartdist![i].lbf,
              lgf: smartD.smartdist![i].lgf,
              eyf: smartD.smartdist![i].eyf,
              ruf: smartD.smartdist![i].ruf,
              base: smartD.smartdist![i].base!.toDouble(),
              bVolume: double.parse(smartD.smartdist![i].bVolume.toString())
                  .toStringAsFixed(2),
              fandeck: smartD.smartdist![i].fandeck!.toDouble(),
            ));
          }

          for (int i = 0; i < mE.magnetextemulsion!.length; i++) {
            print("sixth ma yo vhitra aayo");
            DatabaseHelper.instance.addMagnetExt(MageneticExtEmulsion(
              magneticId: mE.magnetextemulsion![i].id,
              colorName: mE.magnetextemulsion![i].colorName,
              colorCode: mE.magnetextemulsion![i].colorCode,
              whf: mE.magnetextemulsion![i].whf,
              fbf: mE.magnetextemulsion![i].fbf,
              fgf: mE.magnetextemulsion![i].fgf,
              fef: mE.magnetextemulsion![i].fef,
              yof: mE.magnetextemulsion![i].yof,
              fvf: mE.magnetextemulsion![i].fvf,
              iyf: mE.magnetextemulsion![i].iyf,
              mgf: mE.magnetextemulsion![i].mgf,
              irf: mE.magnetextemulsion![i].irf,
              rof: mE.magnetextemulsion![i].rof,
              erf: mE.magnetextemulsion![i].erf,
              myf: mE.magnetextemulsion![i].myf,
              lbf: mE.magnetextemulsion![i].lbf,
              lgf: mE.magnetextemulsion![i].lgf,
              eyf: mE.magnetextemulsion![i].eyf,
              ruf: mE.magnetextemulsion![i].ruf,
              base: mE.magnetextemulsion![i].base!.toDouble(),
              bVolume: double.parse(mE.magnetextemulsion![i].bVolume.toString())
                  .toStringAsFixed(2),
              fandeck: mE.magnetextemulsion![i].fandeck!.toDouble(),
            ));
          }
          for (int i = 0; i < cB.colorBase!.length; i++) {
            print("seventh ma yo vhitra aayo");
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
            print("eight ma yo vhitra aayo");
            DatabaseHelper.instance.addColorColorantData(Colorants(
              id: cC.colorColorant![i].id,
              colorantName: cC.colorColorant![i].colorantName,
              colorantCode: cC.colorColorant![i].colorantCode,
              unitPrice: double.parse(
                  cC.colorColorant![i].unitPrice!.toStringAsFixed(2)),
              rValue: double.parse(cC.colorColorant![i].rValue.toString()),
              gValue: double.parse(cC.colorColorant![i].gValue.toString()),
              bValue: double.parse(cC.colorColorant![i].bValue.toString()),
            ));
          }
          for (int i = 0; i < sCE.shadeColor!.length; i++) {
            print("ninth ma yo vhitra aayo");
            DatabaseHelper.instance
                .addShadeColorData(ShadeColorDatabase(
              id: sCE.shadeColor![i].id,
              sId: sCE.shadeColor![i].s_id,
              colorCode: sCE.shadeColor![i].colorCode,
              colorName: sCE.shadeColor![i].colorName,
              styledist: double.parse(sCE.shadeColor![i].styledist.toString()),
              weatherproofextemulsion: double.parse(
                  sCE.shadeColor![i].weatherproofextemulsion.toString()),
              smartdist: double.parse(sCE.shadeColor![i].smartdist.toString()),
              cosmeticintemulsion: double.parse(
                  sCE.shadeColor![i].cosmeticintemulsion.toString()),
              magnetextemulsion:
                  double.parse(sCE.shadeColor![i].magnetextemulsion.toString()),
              rValue: double.parse(sCE.shadeColor![i].rValue.toString()),
              gValue: double.parse(sCE.shadeColor![i].gValue.toString()),
              bValue: double.parse(sCE.shadeColor![i].bValue.toString()),
            ))
                .whenComplete(() async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              value = true;
              prefs.setBool(Constants.DATA_DOWNLOAD, value!);
              doLogin();
            });
          }
        } else if (response.statusCode == 403) {
          AlertBox().AlertBox403(context);
        } else if (response.statusCode == 400) {
          AlertBox().AlertBox400(context);
        } else if (response.statusCode == 401) {
          AlertBox().AlertBox401(context);
        } else if (response.statusCode == 500) {
          AlertBox().servererror(context);
        } else if (response.statusCode == 503) {
          AlertBox().servererror(context);
        } else {
          AlertBox().universalAlertBox(context);
        }
      } catch (e) {
        simpleNetworkError();
      }
    } else {
      print("ya aayo");
      doLogin();
    }
  }

  Future doLogin() async {
    print("doLogin vhitra");
    Future.delayed(const Duration(seconds: 3), () async {
      final autoLogin = await aC.autoLogin();
      if (autoLogin.toString().isEmpty || autoLogin == null) {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('Button_Navigation_Bar');
        }
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

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getBool(Constants.DATA_DOWNLOAD);
    setState(() {
      value = userData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
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
    print("this is value $value");
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
