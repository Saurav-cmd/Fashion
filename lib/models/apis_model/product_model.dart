// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.dueLimit,
    required this.items,
  });

  late final int dueLimit;
  late final List<Items> items;

  ProductList.fromJson(Map<String, dynamic> json) {
    dueLimit = json['due_limit'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['due_limit'] = dueLimit;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.id,
    required this.productId,
    required this.sizeId,
    required this.price,
    required this.size,
    required this.categoryName,
    required this.categoryId,
    required this.productName,
    required this.images,
  });

  late final int id;
  late final int productId;
  late final int sizeId;
  late final int price;
  late final String size;
  late final String categoryName;
  late final int categoryId;
  late final String productName;
  late final List<dynamic> images;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    sizeId = json['size_id'];
    price = json['price'];
    size = json['size'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    images = List.castFrom<dynamic, dynamic>(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['size_id'] = sizeId;
    _data['price'] = price;
    _data['size'] = size;
    _data['category_name'] = categoryName;
    _data['category_id'] = categoryId;
    _data['product_name'] = productName;
    _data['images'] = images;
    return _data;
  }
}
