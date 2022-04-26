
import 'package:flutter/material.dart';

class Api{
    loginApi(String userCode,String password,String deviceId,String fcmId,BuildContext context){
         "http://reliancetint.bihanitech.com/api/login?user_code=$userCode&password=$password&device_id=$deviceId&fcm_id=$fcmId";
    }

}