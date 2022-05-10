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
    required this.id,
    required this.productId,
    required this.price,
    required this.size,
    required this.categoryName,
    required this.productName,
    required this.quantity,
    required this.images,
  });

  final int id;
  final int productId;
  final int price;
  final String size;
  final CategoryName categoryName;
  final String productName;
  final int quantity;
  final List<dynamic> images;

  factory GetCartData.fromJson(Map<String, dynamic> json) => GetCartData(
    id: json["id"],
    productId: json["product_id"],
    price: json["price"],
    size: json["size"],
    categoryName: categoryNameValues.map[json["category_name"]]!,
    productName: json["product_name"],
    quantity: json["quantity"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "price": price,
    "size": size,
    "category_name": categoryNameValues.reverse![categoryName],
    "product_name": productName,
    "quantity": quantity,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

enum CategoryName { ACRYLIC_WALL_PUTTY, BARPIMO_INT_EMULSION, OTHERS }

final categoryNameValues = EnumValues({
  "ACRYLIC WALL PUTTY": CategoryName.ACRYLIC_WALL_PUTTY,
  "BARPIMO INT EMULSION": CategoryName.BARPIMO_INT_EMULSION,
  "OTHERS": CategoryName.OTHERS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
