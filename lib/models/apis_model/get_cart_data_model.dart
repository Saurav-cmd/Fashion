// To parse this JSON data, do
//
//     final getCartData = getCartDataFromJson(jsonString);

import 'dart:convert';

List<GetCartData> getCartDataFromJson(String str) => List<GetCartData>.from(
    json.decode(str).map((x) => GetCartData.fromJson(x)));

String getCartDataToJson(List<GetCartData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCartData {
  GetCartData({
    this.id,
    this.productId,
    this.pid,
    this.price,
    this.size,
    this.categoryName,
    this.productName,
    this.quantity,
  });

  int? id;
  int? productId;
  int? pid;
  int? price;
  String? size;
  String? categoryName;
  String? productName;
  int? quantity;

  factory GetCartData.fromJson(Map<String, dynamic> json) => GetCartData(
        id: json["id"],
        productId: json["product_id"],
        pid: json["pid"],
        price: json["price"],
        size: json["size"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "pid": pid,
        "price": price,
        "size": size,
        "category_name": categoryName,
        "product_name": productName,
        "quantity": quantity,
      };
}
