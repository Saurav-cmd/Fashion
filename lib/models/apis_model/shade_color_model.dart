// To parse this JSON data, do
//
//     final shadeColor = shadeColorFromJson(jsonString);

import 'dart:convert';

ShadeColor shadeColorFromJson(String str) =>
    ShadeColor.fromJson(json.decode(str));

String shadeColorToJson(ShadeColor data) => json.encode(data.toJson());

class ShadeColor {
  ShadeColor({
    this.shadeColor,
  });

  List<ShadeColorElement>? shadeColor;

  factory ShadeColor.fromJson(Map<String, dynamic> json) => ShadeColor(
        shadeColor: List<ShadeColorElement>.from(
            json["shadeColor"].map((x) => ShadeColorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shadeColor": List<dynamic>.from(shadeColor!.map((x) => x.toJson())),
      };
}

class ShadeColorElement {
  ShadeColorElement({
    this.id,
    this.s_id,
    this.colorCode,
    this.colorName,
    this.styledist,
    this.weatherproofextemulsion,
    this.smartdist,
    this.cosmeticintemulsion,
    this.magnetextemulsion,
    this.rValue,
    this.gValue,
    this.bValue,
  });

  int? id;
  int? s_id;
  String? colorCode;
  String? colorName;
  int? styledist;
  int? weatherproofextemulsion;
  int? smartdist;
  int? cosmeticintemulsion;
  int? magnetextemulsion;
  int? rValue;
  int? gValue;
  int? bValue;

  factory ShadeColorElement.fromJson(Map<String, dynamic> json) =>
      ShadeColorElement(
        id: json["id"],
        s_id: json["s_id"],
        colorCode: json["colorCode"],
        colorName: json["colorName"],
        styledist: json["styledist"],
        weatherproofextemulsion: json["weatherproofextemulsion"],
        smartdist: json["smartdist"],
        cosmeticintemulsion: json["cosmeticintemulsion"],
        magnetextemulsion: json["magnetextemulsion"],
        rValue: json["rValue"],
        gValue: json["gValue"],
        bValue: json["bValue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "s_id": s_id,
        "colorCode": colorCode,
        "colorName": colorName,
        "styledist": styledist,
        "weatherproofextemulsion": weatherproofextemulsion,
        "smartdist": smartdist,
        "cosmeticintemulsion": cosmeticintemulsion,
        "magnetextemulsion": magnetextemulsion,
        "rValue": rValue,
        "gValue": gValue,
        "bValue": bValue,
      };
}
