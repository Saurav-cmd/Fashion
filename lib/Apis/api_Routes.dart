import 'package:fashion_paints/Utils/contants.dart';

class ApiRoute {
  String? getLoginUrl(userCode, password, deviceId, fcmId) {
    print("This is device Id ${deviceId}");
    print("This is fcm Id ${fcmId}");
    print("This is userCode ${userCode}");
    print("This is password ${password}");
    return Constants.baseUrl +
        "login?user_code=$userCode&password=$password&device_id=$deviceId&fcm_id=$fcmId";
  }

  String? giveFeedBackUrl(
      String? fullName,
      String? email,
      String? phone,
      String? comment,
      double? appRating,
      double? productRating,
      double? serviceRating,
      double? teamRating) {
    return Constants.baseUrl +
        "v2/feedback?full_name=$fullName &email=$email&comments=$comment&app_rating=$appRating&product_rating=$productRating&service_rating=$serviceRating&team_rating=$teamRating";
  }
}
