// To parse this JSON data, do
//
//     final shadeColor = shadeColorFromJson(jsonString);

import 'dart:convert';

ShadeColor shadeColorFromJson(String str) => ShadeColor.fromJson(json.decode(str));

String shadeColorToJson(ShadeColor data) => json.encode(data.toJson());

class ShadeColor {
  ShadeColor({
    this.shadeColor,
  });

  List<ShadeColorElement>? shadeColor;

  factory ShadeColor.fromJson(Map<String, dynamic> json) => ShadeColor(
    shadeColor: List<ShadeColorElement>.from(json["shadeColor"].map((x) => ShadeColorElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shadeColor": List<dynamic>.from(shadeColor!.map((x) => x.toJson())),
  };
}

class ShadeColorElement {
  ShadeColorElement({
    this.id,
    this.sId,
    this.colorCode,
    this.colorName,
    this.doubleDefenceEe,
    this.elegaIe,
    this.newBarpimoIe,
    this.newShangrilaEe,
    this.newShangrilaIe,
    this.newUltraProtecEe,
    this.protecEe,
    this.relianceDist,
    this.shangrilaDist,
    this.rValue,
    this.gValue,
    this.bValue,
  });

  int? id;
  int? sId;
  String? colorCode;
  String? colorName;
  int? doubleDefenceEe;
  int? elegaIe;
  int? newBarpimoIe;
  int? newShangrilaEe;
  int? newShangrilaIe;
  int? newUltraProtecEe;
  int? protecEe;
  int? relianceDist;
  int? shangrilaDist;
  int? rValue;
  int? gValue;
  int? bValue;

  factory ShadeColorElement.fromJson(Map<String, dynamic> json) => ShadeColorElement(
    id: json["id"],
    sId: json["s_id"],
    colorCode: json["colorCode"],
    colorName: json["colorName"],
    doubleDefenceEe: json["doubleDefenceEE"],
    elegaIe: json["elegaIE"],
    newBarpimoIe: json["newBarpimoIE"],
    newShangrilaEe: json["newShangrilaEE"],
    newShangrilaIe: json["newShangrilaIE"],
    newUltraProtecEe: json["newUltraProtecEE"],
    protecEe: json["protecEE"],
    relianceDist: json["relianceDist"],
    shangrilaDist: json["shangrilaDist"],
    rValue: json["rValue"],
    gValue: json["gValue"],
    bValue: json["bValue"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "s_id": sId,
    "colorCode": colorCode,
    "colorName": colorName,
    "doubleDefenceEE": doubleDefenceEe,
    "elegaIE": elegaIe,
    "newBarpimoIE": newBarpimoIe,
    "newShangrilaEE": newShangrilaEe,
    "newShangrilaIE": newShangrilaIe,
    "newUltraProtecEE": newUltraProtecEe,
    "protecEE": protecEe,
    "relianceDist": relianceDist,
    "shangrilaDist": shangrilaDist,
    "rValue": rValue,
    "gValue": gValue,
    "bValue": bValue,
  };
}
