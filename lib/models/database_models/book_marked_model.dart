
import 'package:flutter/cupertino.dart';

class BookMarked {
  int? id;
  int? fandeckId;
  String? colorName;
  String? colorCode;
  String? productName;
  String? fandeckName;
  double? canSize;
  double? canColorR;
  double? canColorG;
  double? canColorB;

  BookMarked({
    this.id,
    this.fandeckId,
    this.colorName,
    this.colorCode,
    this.productName,
    this.fandeckName,
    this.canSize,
    this.canColorR,
    this.canColorG,
    this.canColorB,
  });

  factory BookMarked.fromMap(Map<String,dynamic> json)=>BookMarked(
    id: json["id"],
    fandeckId: json["fandeckId"],
    colorName: json["colorName"],
    colorCode: json["colorCode"],
    productName: json["productName"],
    fandeckName: json["fandeckName"],
    canSize: json["canSize"],
    canColorR: json["canColorR"],
    canColorG: json["canColorG"],
    canColorB: json["canColorB"],
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "fandeckId":fandeckId,
      "colorName":colorName,
      "colorCode":colorCode,
      "productName":productName,
      "fandeckName":fandeckName,
      "canSize":canSize,
      "canColorR":canColorR,
      "canColorG":canColorG,
      "canColorB":canColorB,
    };
  }
}