// To parse this JSON data, do
//
//     final orderHistory = orderHistoryFromJson(jsonString);

import 'dart:convert';

List<OrderHistory> orderHistoryFromJson(String str) => List<OrderHistory>.from(
    json.decode(str).map((x) => OrderHistory.fromJson(x)));

String orderHistoryToJson(List<OrderHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistory {
  OrderHistory({
    required this.totalPrice,
    required this.numOfOrder,
    required this.id,
    required this.dealerCode,
    required this.date,
    required this.status,
    required this.remarks,
    required this.orders,
  });

  final int totalPrice;
  final int numOfOrder;
  final int id;
  final DealerCode dealerCode;
  final DateTime date;
  final String status;
  final dynamic remarks;
  final List<Order> orders;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
    totalPrice: json["total_price"],
    numOfOrder: json["num_of_order"],
    id: json["id"],
    dealerCode: dealerCodeValues.map[json["dealerCode"]]!,
    date: DateTime.parse(json["date"]),
    status: json["status"],
    remarks: json["remarks"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_price": totalPrice,
    "num_of_order": numOfOrder,
    "id": id,
    "dealerCode": dealerCodeValues.reverse![dealerCode],
    "date":
    "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "status": status,
    "remarks": remarks,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

enum DealerCode { BT001 }

final dealerCodeValues = EnumValues({"BT001": DealerCode.BT001});

class Order {
  Order({
    required this.id,
    required this.orderId,
    required this.itemsId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.sizeId,
    required this.productId,
    required this.size,
    required this.image,
  });

  final int id;
  final int orderId;
  final int itemsId;
  final Name name;
  final int quantity;
  final int price;
  final int sizeId;
  final int productId;
  final Size size;
  final List<dynamic> image;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    orderId: json["order_id"],
    itemsId: json["items_id"],
    name: nameValues.map[json["name"]]!,
    quantity: json["quantity"],
    price: json["price"],
    sizeId: json["size_id"],
    productId: json["product_id"],
    size: sizeValues.map[json["size"]]!,
    image: List<dynamic>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "items_id": itemsId,
    "name": nameValues.reverse![name],
    "quantity": quantity,
    "price": price,
    "size_id": sizeId,
    "product_id": productId,
    "size": sizeValues.reverse![size],
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}

enum Name {
  ACRYLIC_WALL_PUTTY_20_KG,
  ACRYLIC_WALL_PUTTY_10_KG,
  ACRYLIC_WALL_PUTTY_1_KG
}

final nameValues = EnumValues({
  "ACRYLIC WALL PUTTY 10 KG": Name.ACRYLIC_WALL_PUTTY_10_KG,
  "ACRYLIC WALL PUTTY 1 KG": Name.ACRYLIC_WALL_PUTTY_1_KG,
  "ACRYLIC WALL PUTTY 20 KG": Name.ACRYLIC_WALL_PUTTY_20_KG
});

enum Size { PCS, CTN, BAG, DRUM }

final sizeValues = EnumValues(
    {"BAG": Size.BAG, "CTN": Size.CTN, "DRUM": Size.DRUM, "PCS": Size.PCS});

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
