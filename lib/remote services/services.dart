import 'dart:convert';

import 'package:fashion_paints/Apis/api_Routes.dart';
import 'package:fashion_paints/models/apis_model/login_model.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/get_cart_data_controller.dart';
import '../main.dart';
import '../models/apis_model/add_to_cart_model.dart';
import '../models/apis_model/confirm_order_model.dart';
import '../models/apis_model/get_cart_data_model.dart';
import '../models/apis_model/notice_model.dart';
import '../models/apis_model/order_history_model.dart';
import '../models/apis_model/product_model.dart';

class Services {
  static Future<LoginModel?> loginData(String userCode, String password,
      String deviceId, String fcmId, BuildContext context) async {
    String? token;
    print("This is token ${token}");
    try {
      String? apiRoute =
          ApiRoute().getLoginUrl(userCode, password, deviceId, fcmId);
      final response = await http.post(Uri.parse(apiRoute!));
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode({
          'message': responseData['message'],
          'token': responseData['token']
        });
        prefs.setString('userData', userData);
        Navigator.of(context)
            .pushReplacementNamed("Dealer_button_Navigation_Bar");
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

  static Future<List<GetCartData>?>? getCartData(BuildContext context) async {
    const url = "http://reliancetint.bihanitech.com/api/getCart";
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        print('all product data 99 ${response.body}');
        return getCartDataFromJson(jsonEncode(responseData));
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

  static Future<List<OrderHistory>?>? getOrderHistory(
      BuildContext context) async {
    const url = "http://reliancetint.bihanitech.com/api/orderHistory";
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        print('order history services ${response.body}');
        return orderHistoryFromJson(jsonEncode(responseData));
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
        print('error403');
      } else if (response.statusCode == 400) {
        print('error400');
      } else if (response.statusCode == 401) {
        print('error401');
      } else if (response.statusCode == 500) {
        print('error500');
      } else if (response.statusCode == 503) {
      } else {
        print('error503');
      }
    } catch (e) {
      print('errorcatche');
    }
  }

  static Future<ProductList?> getProduct(BuildContext context) async {
    const url = "http://reliancetint.bihanitech.com/api/products";
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9yZWxpYW5jZXRpbnQuYmloYW5pdGVjaC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2NTE1NjEyODgsIm5iZiI6MTY1MTU2MTI4OCwianRpIjoiQWF2T0tVR2F4dkZjSnppeSIsInN1YiI6MjA5LCJwcnYiOiJjMWUxNGVhNzk5NjA4MDdkNmEyYjE3ZGEyYWYwYzM5MzQ1ZmNjYTdhIn0.w-ZKQGkW2lgfm_tpFwWBXUXpPzYikC-Hg89n9sKttgM",
        'Content-Type': 'application/json'
      });
      final responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        print('all product data 99 ${response.body}');
        return productListFromJson(jsonEncode(responseData));
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
        print('error403');
      } else if (response.statusCode == 400) {
        print('error400');
      } else if (response.statusCode == 401) {
        print('error401');
      } else if (response.statusCode == 500) {
        print('error500');
      } else if (response.statusCode == 503) {
      } else {
        print('error503');
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
        print('error403');
      } else if (response.statusCode == 400) {
        print('error400');
      } else if (response.statusCode == 401) {
        print('error401');
      } else if (response.statusCode == 500) {
        print('error500');
      } else if (response.statusCode == 503) {
      } else {
        print('error503');
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
      String? createdAt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString("userData");
    String? token = json.decode(userData!)["token"];
    try {
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
      } else {
        print("error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
