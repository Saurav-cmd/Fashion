import 'package:fashion_paints/Utils/contants.dart';

class ApiRoute {
  String? getLoginUrl(userCode,password,deviceId,fcmId){
    print("This is device Id ${deviceId}");
    print("This is fcm Id ${fcmId}");
    print("This is userCode ${userCode}");
    print("This is password ${password}");
    return Constants.baseUrl+"login?user_code=$userCode&password=$password&device_id=$deviceId&fcm_id=$fcmId";
  }

}
