// To parse this JSON data, do
//
//     final confirmOrder = confirmOrderFromJson(jsonString);

import 'dart:convert';

OrderId orderIdFromJson(String str) =>  OrderId.fromJson(json.decode(str));

String orderIdToJson(List<OrderId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class OrderId {
  OrderId({
    this.dealerCode,
    this.tintUser,
    this.date,
    this.status,
    this.userType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String ?dealerCode;
  int ?tintUser;
  DateTime ?date;
  String ?status;
  String ?userType;
  DateTime ?updatedAt;
  DateTime ?createdAt;
  int ?id;

  factory OrderId.fromJson(Map<String, dynamic> json) => OrderId(
    dealerCode: json["dealer_code"],
    tintUser: json["tint_user"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
    userType: json["user_type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "dealer_code": dealerCode,
    "tint_user": tintUser,
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "status": status,
    "user_type": userType,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
