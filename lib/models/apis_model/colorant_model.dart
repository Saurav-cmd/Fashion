// To parse this JSON data, do
//
//     final colorColorant = colorColorantFromJson(jsonString);

import 'dart:convert';

ColorColorant colorColorantFromJson(String str) => ColorColorant.fromJson(json.decode(str));

String colorColorantToJson(ColorColorant data) => json.encode(data.toJson());

class ColorColorant {
  ColorColorant({
    this.colorColorant,
  });

  List<ColorColorantElement>? colorColorant;

  factory ColorColorant.fromJson(Map<String, dynamic> json) => ColorColorant(
    colorColorant: List<ColorColorantElement>.from(json["colorColorant"].map((x) => ColorColorantElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "colorColorant": List<dynamic>.from(colorColorant!.map((x) => x.toJson())),
  };
}

class ColorColorantElement {
  ColorColorantElement({
    this.id,
    this.colorantName,
    this.colorantCode,
    this.unitPrice,
    this.rValue,
    this.gValue,
    this.bValue,
  });

  int? id;
  String? colorantName;
  String? colorantCode;
  double? unitPrice;
  int? rValue;
  int? gValue;
  int? bValue;


  factory ColorColorantElement.fromJson(Map<String, dynamic> json) => ColorColorantElement(
    id: json["id"],
    colorantName: json["colorantName"],
    colorantCode: json["colorantCode"],
    unitPrice: json["unitPrice"].toDouble(),
    rValue: json["rValue"],
    gValue: json["gValue"],
    bValue: json["bValue"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "colorantName": colorantName,
    "colorantCode": colorantCode,
    "unitPrice": unitPrice,
    "rValue": rValue,
    "gValue": gValue,
    "bValue": bValue,
  };
}
