import 'dart:convert';

import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/apis_model/login_model.dart';
import 'package:fashion_paints/models/database_models/doubled_fencee_database_%20model.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/apis_model/doubled_fencee_model.dart';

class Services{
  static Future<LoginModel?> loginData(String userCode,String password,String deviceId,String fcmId,BuildContext context)async{
    String? token;
    print("This is token ${token}");
    try {
      final url = "http://reliancetint.bihanitech.com/api/login?user_code=$userCode&password=$password&device_id=$deviceId&fcm_id=$fcmId";
      const url1 = "http://reliancetint.bihanitech.com/api/getdata";
      final response = await http.post(Uri.parse(url));
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode({'message':responseData['message'],'token':responseData['token']});
        prefs.setString('userData', userData);

        String? userData1 = prefs.getString("userData");
        if(userData!=null){
          token = json.decode(userData)['token'];
        }else{
          return null;
        }
        print("this is inside token $token");
        final response1 = await http.get(Uri.parse(url1),headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer $token"
        });

        if(response1.statusCode==200){
          Doubledfenceee dF = doubledfenceeeFromJson(response1.body);
          for(int i=0;i<dF.doubledefenceee!.length;i++){
            DatabaseHelper.instance.addDoubleFenceeData(
              DoubleDefenceee(
                  colorName:dF.doubledefenceee![i].colorName,
                  colorCode:dF.doubledefenceee![i].colorCode,
                  xT:dF.doubledefenceee![i].xt,
                  tT:dF.doubledefenceee![i].lt,
                  lS:dF.doubledefenceee![i].ls,
                  mS:dF.doubledefenceee![i].ms,
                  rT:dF.doubledefenceee![i].rt,
                  fT:dF.doubledefenceee![i].ft,
                  kS:dF.doubledefenceee![i].ks,
                  mM:dF.doubledefenceee![i].mm,
                  rS:dF.doubledefenceee![i].rs,
                  vT:dF.doubledefenceee![i].vt,
                  pP:dF.doubledefenceee![i].pp,
                  zT:dF.doubledefenceee![i].zt,
                  mT:dF.doubledefenceee![i].mt,
                  lT: dF.doubledefenceee![i].lt,
                  uS: dF.doubledefenceee![i].us,
                  sT: dF.doubledefenceee![i].st,
                  base: double.parse(dF.doubledefenceee![i].base.toString()),
                  bVolume:dF.doubledefenceee![i].bVolume,
                  fanDeck:double.parse(dF.doubledefenceee![i].fandeck.toString()),
              )
            );
          }
          Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
        }
      } else if(response.statusCode ==403){
        AlertBox().loginAlertBox1(context);
      }
      else if(response.statusCode == 400){
        AlertBox().loginAlertBox2(context);
      }
      else if(response.statusCode == 401){
        AlertBox().loginAlertBox3(context);
      }
      else if(response.statusCode==500){
        print("Unexpected error on Server");
      }else if(response.statusCode==503){
        print("Unexpected error on Server");
      }
      else{
       AlertBox().universalAlertBox(context);
      }

    }catch(e){
      rethrow;
    }
    return null;
  }
}