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
    this.totalPrice,
    this.numOfOrder,
    this.id,
    this.dealerCode,
    this.date,
    this.status,
    this.remarks,
    this.orders,
  });

  int? totalPrice;
  int? numOfOrder;
  int? id;
  DealerCode? dealerCode;
  DateTime? date;
  String? status;
  String? remarks;
  List<Order>? orders;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        totalPrice: json["total_price"],
        numOfOrder: json["num_of_order"],
        id: json["id"],
        dealerCode: dealerCodeValues.map[json["dealerCode"]],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "num_of_order": numOfOrder,
        "id": id,
        "dealerCode": dealerCodeValues.reverse[dealerCode],
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "remarks": remarks == null ? null : remarks,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

enum DealerCode { TEST, DEALER_CODE_TEST, AAA }

final dealerCodeValues = EnumValues({
  "aaa": DealerCode.AAA,
  "test": DealerCode.DEALER_CODE_TEST,
  "Test": DealerCode.TEST
});

class Order {
  Order({
    this.id,
    this.orderId,
    this.itemsId,
    this.name,
    this.quantity,
    this.price,
    this.sizeId,
    this.productId,
    this.size,
    this.image,
  });

  int? id;
  int? orderId;
  int? itemsId;
  Name? name;
  int? quantity;
  int? price;
  int? sizeId;
  int? productId;
  DealerCode? size;
  List<dynamic>? image;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderId: json["order_id"],
        itemsId: json["items_id"],
        name: nameValues.map[json["name"]],
        quantity: json["quantity"],
        price: json["price"],
        sizeId: json["size_id"],
        productId: json["product_id"],
        size: dealerCodeValues.map[json["size"]],
        image: List<dynamic>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "items_id": itemsId,
        "name": nameValues.reverse[name],
        "quantity": quantity,
        "price": price,
        "size_id": sizeId,
        "product_id": productId,
        "size": dealerCodeValues.reverse[size],
        "image": List<dynamic>.from(image!.map((x) => x)),
      };
}

enum Name { TEST1 }

final nameValues = EnumValues({"Test1": Name.TEST1});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
