import 'dart:convert';

List<Painter> painterFromJson(String str) =>
    List<Painter>.from(json.decode(str).map((x) => Painter.fromJson(x)));

String painterToJson(List<Painter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Painter {
  Painter({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.feeAmt,
    this.status,
    this.phone2,
    this.address2,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.distance,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? phone;
  String? feeAmt;
  int? status;
  dynamic phone2;
  String? address2;
  String? latitude;
  String? longitude;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? distance;

  factory Painter.fromJson(Map<String, dynamic> json) => Painter(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        feeAmt: json["fee_amt"],
        status: json["status"],
        phone2: json["phone2"],
        address2: json["address2"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "address": address,
        "phone": phone,
        "fee_amt": feeAmt,
        "status": status,
        "phone2": phone2,
        "address2": address2,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "distance": distance,
      };
}
