// To parse this JSON data, do
//
//     final colorBase = colorBaseFromJson(jsonString);

import 'dart:convert';

ColorBase colorBaseFromJson(String str) => ColorBase.fromJson(json.decode(str));

String colorBaseToJson(ColorBase data) => json.encode(data.toJson());

class ColorBase {
  ColorBase({
    this.colorBase,
  });

  List<ColorBaseElement>? colorBase;

  factory ColorBase.fromJson(Map<String, dynamic> json) => ColorBase(
    colorBase: List<ColorBaseElement>.from(json["colorBase"].map((x) => ColorBaseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "colorBase": List<dynamic>.from(colorBase!.map((x) => x.toJson())),
  };
}

class ColorBaseElement {
  ColorBaseElement({
    this.id,
    this.base,
    this.unitPrice1,
    this.unitPrice2,
    this.unitPrice3,
    this.unitPrice4,
    this.kgLtrFlag,
  });

  int? id;
  String? base;
  int? unitPrice1;
  int? unitPrice2;
  int? unitPrice3;
  int? unitPrice4;
  int? kgLtrFlag;

  factory ColorBaseElement.fromJson(Map<String, dynamic> json) => ColorBaseElement(
    id: json["id"],
    base: json["base"],
    unitPrice1: json["unitPrice1"],
    unitPrice2: json["unitPrice2"],
    unitPrice3: json["unitPrice3"],
    unitPrice4: json["unitPrice4"],
    kgLtrFlag: json["kgLtrFlag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "base": base,
    "unitPrice1": unitPrice1,
    "unitPrice2": unitPrice2,
    "unitPrice3": unitPrice3,
    "unitPrice4": unitPrice4,
    "kgLtrFlag": kgLtrFlag,
  };
}
