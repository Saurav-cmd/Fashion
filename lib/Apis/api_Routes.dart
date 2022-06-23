import 'package:fashion_paints/Utils/contants.dart';

class ApiRoute {
  String? getLoginUrl(userCode, password, deviceId, fcmId) {
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

  String? findPainter(
    double? latitude,
    double? longitude,
  ) {
    return Constants.baseUrl +
        "v2/painterWithboundry?latitude=$latitude&longitude=$longitude";
  }

  String? complaints(String? name, String? userCode, String? phoneNumber,
      int? reasonForComplaint, String? complaint) {
    return Constants.baseUrl +
        "v2/complaint?title=$reasonForComplaint&issue=$complaint&user_code=$userCode&full_name=$name&phone=$phoneNumber";
  }

  String? BipanPreviewGallery(String? name, String? email, String? phone,
      String? address, String? userCode) {
    return Constants.baseUrl +
        "v2/bipanapreviewimage?full_name=$name&email=$email&phone=$phone&address=$address&user_code=$userCode";
  }

  String? BipanPreviewSaved(String? emailAddress, String? phone) {
    return Constants.baseUrl +
        "v2/bipanapreviewimage?email=$emailAddress&phone=$phone";
  }

  String? userNotification() {
    return Constants.baseUrl + "notice";
  }

  String? priceList() {
    return Constants.baseUrl + "image?type=3";
  }

  String? schemeList() {
    return Constants.baseUrl + "image?type=2";
  }

  String? statementList(String? userId) {
    return Constants.baseUrl + "ledger?id=$userId";
  }

  String? orderHistory() {
    return Constants.baseUrl + "orderHistory";
  }

  String? cartList() {
    return Constants.baseUrl + "getCart";
  }

  String? deleteCart(int? cartId) {
    return Constants.baseUrl + "cartDelete/$cartId";
  }

  String? addToCart(String? dealerId, int? itemId, int? quantity) {
    return Constants.baseUrl +
        "cart?dealer_id=$dealerId&items_id=$itemId&quantity=$quantity";
  }

  String? confirmOrder(
    int? userId,
    String? dealerId,
    int? items_id,
    int? quantity,
    int? cartId,
    String? date,
  ) {
    return Constants.baseUrl + "order";
  }

  String? chat(int? userId, String? message) {
    return Constants.baseUrl + "send?user_id=$userId&message=$message";
  }

  String? getChat(int? id) {
    return Constants.baseUrl + "v2/message?type=individual&id=";
  }

  String? noticeLog() {
    return Constants.baseUrl + "lognotice";
  }
}
