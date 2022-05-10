// To parse this JSON data, do
//
//     final addCart = addCartFromJson(jsonString);

import 'dart:convert';

AddCart addCartFromJson(String str) =>  AddCart.fromJson(json.decode(str));

String addCartToJson(List<AddCart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddCart {
  AddCart({
    this.id,
    this.productId,
    this.price,
    this.size,
    this.categoryName,
    this.productName,
    this.quantity,
    this.images,
  });

  int ?id;
  int ?productId;
  int ?price;
  String ?size;
  String ?categoryName;
  String ?productName;
  int ?quantity;
  List<dynamic> ?images;

  factory AddCart.fromJson(Map<String, dynamic> json) => AddCart(
    id: json["id"],
    productId: json["product_id"],
    price: json["price"],
    size: json["size"],
    categoryName: json["category_name"],
    productName: json["product_name"],
    quantity: json["quantity"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "price": price,
    "size": size,
    "category_name": categoryName,
    "product_name": productName,
    "quantity": quantity,
    "images": List<dynamic>.from(images!.map((x) => x)),
  };
}
