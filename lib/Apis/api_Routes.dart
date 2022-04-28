import 'package:fashion_paints/Utils/contants.dart';

class ApiRoute {
  String? getLoginUrl(userCode,password,deviceId,fcmId){
    return Constants.baseUrl+"?user_code=$userCode&password=$password&device_id=$deviceId&fcm_id=$fcmId";
  }

}
