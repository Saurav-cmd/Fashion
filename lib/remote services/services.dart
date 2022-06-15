import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/Apis/api_Routes.dart';
import 'package:fashion_paints/models/apis_model/login_model.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/contants.dart';
import '../controllers/get_cart_data_controller.dart';
import '../main.dart';
import '../models/apis_model/add_to_cart_model.dart';
import '../models/apis_model/bipana_preview_saved_model.dart';
import '../models/apis_model/confirm_order_model.dart';
import '../models/apis_model/find_painter_model.dart';
import '../models/apis_model/get_cart_data_model.dart';
import '../models/apis_model/message_model.dart';
import '../models/apis_model/notice_log.dart';
import '../models/apis_model/notice_model.dart';
import '../models/apis_model/order_history_model.dart';
import '../models/apis_model/price_list_model.dart';
import '../models/apis_model/product_model.dart';
import '../models/apis_model/stetement_model.dart';
import '../models/apis_model/user_notification_model.dart';
import '../screens/button_navigation_bars/dealer_home_screen_button_navigation_bar.dart';

class Services {
  static Future<LoginModel?> loginData(String userCode, String password,
      String deviceId, String fcmId, BuildContext context) async {
    try {
      String? apiRoute =
          ApiRoute().getLoginUrl(userCode, password, deviceId, fcmId);
      final response = await http.post(Uri.parse(apiRoute!));
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode({
          'message': responseData['message'],
          'status': responseData['status'],
          'token': responseData['token'],
          'userName': responseData['Dealer_user']['full_name'],
          'phone': responseData['Dealer_user']['phone'],
          'userCode': responseData['Dealer_user']['user_code'],
          'user_id': responseData['Dealer_user']['id'],
          'dealer_code': responseData['dealer_info']['code'],
          "due_amount": responseData['dealer_info']['due_amount'],
          "cheque_in_hand": responseData['dealer_info']['cheque_in_hand'],
          "order_limit": responseData['dealer_info']['order_limit'],
          "name": responseData['dealer_info']['name'],
          "address": responseData['dealer_info']['address'],
          "dealer_id": responseData['Dealer_user']['dealer_id'],
        });
        prefs.setString('userData', userData);

        SharedPreferences prefs1 = await SharedPreferences.getInstance();
        final userData1 = prefs1.getString("userData");
        String? message;
        String? status;
        if (userData1 != null) {
          message = jsonDecode(userData1)['message'];
          status = jsonDecode(userData1)['status'];
          if (message == "User already logged in on another device" &&
              status == "error") {
            print("User Already logged in");
            AlertBox().userAlreadyLoggedIn(context);
          } else if (message == "Welcome" && status == "success") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DealerBottomNavigation()),
              ModalRoute.withName('/'),
            );
          }
        }
      } else if (response.statusCode == 403) {
        AlertBox().loginAlertBox1(context);
      } else if (response.statusCode == 400) {
        AlertBox().loginAlertBox2(context);
      } else if (response.statusCode == 401) {
        AlertBox().loginAlertBox3(context);
      } else if (response.statusCode == 500) {
        print("Unexpected error on Server");
      } else if (response.statusCode == 503) {
        print("Unexpected error on Server");
      } else {
        AlertBox().universalAlertBox(context);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  static Future<List<GetCartData>?> getCartData(BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
    final apiUrl = ApiRoute().cartList();
    try {
      final response = await http.get(Uri.parse(apiUrl!), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return getCartDataFromJson(jsonEncode(responseData));
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
      throw (e);
    }
  }

  static Future<List<OrderHistory>?>? getOrderHistory(
      BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    } else {
      return null;
    }

    final apiUrl = ApiRoute().orderHistory();
    try {
      final response = await http.get(Uri.parse(apiUrl!), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        return orderHistoryFromJson(response.body);
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
      print('error');
    }
  }

  static Future<AddCart?> Addtocart(
      BuildContext context, var dealerId, var itemId, var quantityId) async {
    final url =
        "http://reliancetint.bihanitech.com/api/cart?dealer_id=$dealerId&items_id=$itemId&quantity=$quantityId";
    try {
      final response = await http.post(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        final SnackBar snackBar = SnackBar(
          content: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'Item Successfully added to Cart',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontSize: 14),
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade600,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
        print('succefully add to cart item');
        print('add to cart data data 99 ${response.body}');

        return addCartFromJson(jsonEncode(responseData));
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
      print('errorcatche');
    }
  }

  static Future<ProductList?> getProduct(BuildContext context) async {
    String? token;
    final url = "${Constants.baseUrl}products";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return productListFromJson(jsonEncode(responseData));
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
      print('error');
    }
  }

  static Future<AddCart?> DeleteCart(BuildContext context, int cartId) async {
    final url = "http://reliancetint.bihanitech.com/api/cartDelete/${cartId}";
    try {
      final response = await http.delete(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        final GetCartController _getCartController =
            Get.put(GetCartController());
        _getCartController.getAllCartData(context);
        print('delete cartitem data 99 ${response.body}');
        print(
            'order id all checking ${_getCartController.cartList!.map((e) => e.id).toList()}');

        return addCartFromJson(jsonEncode(responseData));
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
      print('errorcatche');
    }
  }

  static Future<OrderId?> fetchConfirmOrder(
      BuildContext context, List orderId) async {
    Map passData = {
      "orders": [
        ...orderId.map((e) => {"cart_id": e}).toList()
      ]
    };
    String body = json.encode(passData);

    const url = "http://reliancetint.bihanitech.com/api/order";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
          'Content-Type': 'application/json'
        },
        body: body,
      );

      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        // final GetCartController _getCartController =
        // Get.put(GetCartController());
        // _getCartController.cartList!.clear();
        Navigator.of(context).pushNamed("Order_history_screen");
        print('confirm order 99 all  ${response.body}');
        return orderIdFromJson(jsonEncode(responseData));
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
      print('errorcatche');
    }
  }

  static Future<Notices?> getNotice(BuildContext context) async {
    const url = "https://fashionpaints.bihanitech.com/api/notice";
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZmFzaGlvbnBhaW50cy5iaWhhbml0ZWNoLmNvbVwvYXBpXC9sb2dpbiIsImlhdCI6MTY1MTk5Mzk1NSwibmJmIjoxNjUxOTkzOTU1LCJqdGkiOiJVNkQzc2N3QVBlUWxWVVg2Iiwic3ViIjoyMjIsInBydiI6IjMyY2IzOTAwNGMyYThlMjc1MWNlOTE2NTg4MmFiMDlmZGE0ZDEzMTcifQ.d-K4nTBb12xpRS8sEP820pq3tz_p6Za8ZEjOYZ-6psI",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        print('all notice data test just now ${response.body}');

        return noticesFromJson(jsonEncode(responseData));
      } else if (response.statusCode == 403) {
        print('error');
      } else if (response.statusCode == 400) {
        print('error');
      } else if (response.statusCode == 401) {
        print('error');
      } else if (response.statusCode == 500) {
        print('error');
      } else if (response.statusCode == 503) {
      } else {
        print('error');
      }
    } catch (e) {
      print('error');
    }
  }

  static Future<void> giveFeedBack(
      String? fullName,
      String? email,
      String? phone,
      String? comment,
      double? appRating,
      double? productRating,
      double? serviceRating,
      double? teamRating,
      String? updatedAt,
      String? createdAt,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("userData");
    String? token = json.decode(userData!)["token"];
    try {
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
      EasyLoading.instance.backgroundColor = Colors.black45;
      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
      EasyLoading.show(status: "Posting Feedback....");
      String? apiRoute = ApiRoute().giveFeedBackUrl(fullName, email, phone,
          comment, appRating, productRating, serviceRating, teamRating);
      final Map<String, String> feedBackParams = {
        "full_name": fullName!,
        "email": email!,
        "phone": phone!,
        "comments": comment!,
        "app_rating": appRating.toString(),
        "product_rating": productRating.toString(),
        "service_rating": serviceRating.toString(),
        "team_rating": teamRating.toString(),
        "updated_at": updatedAt!,
        "created_at": createdAt!,
      };
      final response = await http.post(Uri.parse(apiRoute!),
          body: jsonEncode(feedBackParams),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          });
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Successfully gave Feedback',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<List<Painter>?> findPainter(
      double? latitude, double? longitude, BuildContext context) async {
    try {
      final api = ApiRoute().findPainter(latitude, longitude);
      final response = await http.get(Uri.parse(api!), headers: {
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        return painterFromJson(response.body);
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
      rethrow;
    }
  }

  static Future<void> postComplaints(
      String? name,
      String? userCode,
      String? phoneNumber,
      int? reasonForComplaint,
      String? complaint,
      BuildContext context) async {
    try {
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
      EasyLoading.instance.backgroundColor = Colors.black45;
      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
      EasyLoading.show(status: "Submitting Complaint....");
      String? token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString("userData");
      if (userData != null) {
        token = jsonDecode(userData)['token'];
      }
      final api = ApiRoute().complaints(
          name, userCode, phoneNumber, reasonForComplaint, complaint);
      final response = await http.post(Uri.parse(api!), headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer $token"
      });
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Complaint successfully submitted',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<void> bipanaPreviewGalleryData(
      String? name,
      String? email,
      String? phone,
      String? address,
      String? userCode,
      List<File> imagesData,
      BuildContext context) async {
    try {
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
      EasyLoading.instance.backgroundColor = Colors.black45;
      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
      EasyLoading.show(status: "Submitting Data....");
      final apiData =
          ApiRoute().BipanPreviewGallery(name, email, phone, address, userCode);
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(apiData!));
      Map<String, String> headers = {"Content-Type": "multipart/form-data"};

      for (int i = 0; i < imagesData.length; i++) {
        FileImage(File(imagesData[i].path.toString())).file.readAsBytesSync();
        request.files.add(await http.MultipartFile.fromPath(
            'image[]', imagesData[i].path,
            contentType: MediaType("image", "jpeg")));
      }
      request.headers.addAll(headers);
      request.fields['full_name'] = name!;
      request.fields['email'] = email!;
      request.fields['phone'] = phone!;
      request.fields['address'] = address!;
      request.fields['user_code'] = userCode!;

      http.StreamedResponse response = await request.send();
      response.stream.transform(utf8.decoder).listen((event) {});

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Details successfully submitted',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<void> bipanaPreviewCameraData(
      String? name,
      String? email,
      String? phone,
      String? address,
      String? userCode,
      File? imagesData,
      BuildContext context) async {
    try {
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.light;
      EasyLoading.instance.backgroundColor = Colors.black45;
      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
      EasyLoading.show(status: "Submitting Data....");
      final apiData =
          ApiRoute().BipanPreviewGallery(name, email, phone, address, userCode);
      //here multipart
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(apiData!));
      Map<String, String> headers = {"Content-Type": "multipart/form-data"};

      FileImage(File(imagesData!.path.toString())).file.readAsBytesSync();
      request.files.add(await http.MultipartFile.fromPath(
          'image[]', imagesData.path,
          contentType: MediaType("image", "jpeg")));

      request.headers.addAll(headers);
      request.fields['full_name'] = name!;
      request.fields['email'] = email!;
      request.fields['phone'] = phone!;
      request.fields['address'] = address!;
      request.fields['user_code'] = userCode!;

      http.StreamedResponse response = await request.send();
      response.stream.transform(utf8.decoder).listen((event) {});

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Details successfully submitted',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<BipanaPreviewSaved?> getBipanPreviewSaved(
      String? emailAddress, String? phone, BuildContext context) async {
    try {
      final apiData = ApiRoute().BipanPreviewSaved(emailAddress, phone);
      final response = await http.get(Uri.parse(apiData!));
      if (response.statusCode == 200) {
        return bipanaPreviewSavedFromJson(response.body);
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
      rethrow;
    }
  }

  static Future<UserNotification?> getUserNotification() async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
    try {
      final apiData = ApiRoute().userNotification();
      final response = await http.get(Uri.parse(apiData!), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        return userNotificationFromJson(response.body);
      } else {
        print("Error occurred");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<PriceList?> getPriceList(BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    } else {
      return null;
    }
    try {
      final apiData = ApiRoute().priceList();
      final response = await http.get(Uri.parse(apiData!), headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer $token"
      });
      if (response.statusCode == 200) {
        return priceListFromJson(response.body);
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
      rethrow;
    }
  }

  //schemeList and price list ko data module same xa tai vhaya ra price list kai model use garaya ko scheme list ko lagi ne and scheme list ko controller price list controller mai xa
  static Future<PriceList?> getSchemeList(BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    } else {
      return null;
    }
    try {
      final apiData = ApiRoute().schemeList();
      final response = await http.get(Uri.parse(apiData!), headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer $token"
      });
      if (response.statusCode == 200) {
        return priceListFromJson(response.body);
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
      rethrow;
    }
  }

  static Future<StatementList?> getStatementList(BuildContext context) async {
    String? token;
    String? dealerId;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
      dealerId = jsonDecode(userData)['dealer_id'];
    } else {
      return null;
    }

    try {
      final apiData = ApiRoute().statementList(dealerId);
      final response = await http.get(Uri.parse(apiData!), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        print("This is data ${response.body}");
        return statementListFromJson(response.body);
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
      rethrow;
    }
  }

  static Future<String?> deleteCartItem(
      int? cartId, BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
    try {
      final apiUrl = ApiRoute().deleteCart(cartId);
      final response = await http.delete(Uri.parse(apiUrl!), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'cart Item deleted successfully',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<String?> addToCart(
      int? itemId, int? quantity, BuildContext context) async {
    String? dealerId;
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      dealerId = jsonDecode(userData)['dealer_code'];
      token = jsonDecode(userData)['token'];
    }
    try {
      final apiUrl = ApiRoute().addToCart(dealerId, itemId, quantity);
      final response = await http.post(Uri.parse(apiUrl!), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Item added to cart successfully',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<void> confirmOrder(int? itemId, int? quantity, int? cartId,
      String? date, BuildContext context) async {
    String? token;
    int? userId;
    String? dealerCode;
    int? due;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
      userId = jsonDecode(userData)['user_id'];
      dealerCode = jsonDecode(userData)['dealer_code'];
      due = jsonDecode(userData)['due_amount'];
    } else {
      return null;
    }
    print("This is token $token");
    print("userId $userId");
    print("dealer code $dealerCode");
    print("due $due");
    print("${date}");
    try {
      final apiUrl = ApiRoute()
          .confirmOrder(userId!, dealerCode, itemId, quantity, cartId, date);
      final response = await http.post(Uri.parse(apiUrl!),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({
            "purpose_id": 1,
            'dealer_code': dealerCode,
            'user_id': userId,
            'date': date,
            'due': due,
            'orders': [
              {'cart_id': cartId, 'items_id': itemId, 'quantity': quantity}
            ]
          }));

      if (response.statusCode == 200) {
        final SnackBar snackBar = SnackBar(
          content: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Order Confirmed',
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
        snackBarKey.currentState?.showSnackBar(snackBar);
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
      rethrow;
    }
  }

  static Future<String?> sendMessage(
      String? message, List<File> galleryImages, BuildContext context) async {
    int? userId;
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      userId = jsonDecode(userData)['user_id'];
      token = jsonDecode(userData)['token'];
    }
    try {
      final apiUrl = ApiRoute().chat(userId, message);
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(apiUrl!));
      Map<String, String> jsonData = {
        "Content-Type": "multipart/form-data",
        "Authorization": "Bearer $token"
      };

      for (int i = 0; i < galleryImages.length; i++) {
        FileImage(File(galleryImages[i].path.toString()))
            .file
            .readAsBytesSync();
        request.files.add(await http.MultipartFile.fromPath(
            'files[]', galleryImages[i].path,
            contentType: MediaType("image", "jpeg")));
      }
      request.headers.addAll(jsonData);
      request.fields['message'] = message!;
      request.fields['user_id'] = userId.toString();

      http.StreamedResponse response = await request.send();
      response.stream.transform(utf8.decoder).listen((event) {});

      if (response.statusCode == 200) {
        print("Success");
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
      rethrow;
    }
  }

  static Future<Message?> getMessage(BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }
    try {
      final apiUrl = ApiRoute().getChat();
      final response = await http.get(Uri.parse(apiUrl!), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        print("This is response ${response.body}");
        return messageFromJson(response.body);
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
      rethrow;
    }
  }

  static Future<NoticeLog?> NoticeLogData(BuildContext context) async {
    String? token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      token = jsonDecode(userData)['token'];
    }

    try {
      final apiUrl = ApiRoute().noticeLog();
      final response = await http.get(Uri.parse(apiUrl!), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

      if (response.statusCode == 200) {
        print("sucess");
        return noticeLogFromJson(response.body);
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
      rethrow;
    }
  }
}
