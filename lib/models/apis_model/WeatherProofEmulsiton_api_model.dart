// To parse this JSON data, do
//
//     final weatherProofEmulsion = weatherProofEmulsionFromJson(jsonString);

import 'dart:convert';

WeatherProofEmulsion weatherProofEmulsionFromJson(String str) =>
    WeatherProofEmulsion.fromJson(json.decode(str));

String weatherProofEmulsionToJson(WeatherProofEmulsion data) =>
    json.encode(data.toJson());

class WeatherProofEmulsion {
  WeatherProofEmulsion({
    this.weatherproofextemulsion,
  });

  List<Weatherproofextemulsion>? weatherproofextemulsion;

  factory WeatherProofEmulsion.fromJson(Map<String, dynamic> json) =>
      WeatherProofEmulsion(
        weatherproofextemulsion: List<Weatherproofextemulsion>.from(
            json["weatherproofextemulsion"]
                .map((x) => Weatherproofextemulsion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "weatherproofextemulsion":
            List<dynamic>.from(weatherproofextemulsion!.map((x) => x.toJson())),
      };
}

class Weatherproofextemulsion {
  Weatherproofextemulsion({
    this.id,
    this.colorName,
    this.colorCode,
    this.whf,
    this.fbf,
    this.fgf,
    this.fef,
    this.yof,
    this.fvf,
    this.iyf,
    this.mgf,
    this.irf,
    this.rof,
    this.erf,
    this.myf,
    this.lbf,
    this.lgf,
    this.eyf,
    this.ruf,
    this.base,
    this.bVolume,
    this.fandeck,
  });

  int? id;
  String? colorName;
  String? colorCode;
  String? whf;
  String? fbf;
  String? fgf;
  String? fef;
  String? yof;
  String? fvf;
  String? iyf;
  String? mgf;
  String? irf;
  String? rof;
  String? erf;
  String? myf;
  String? lbf;
  String? lgf;
  String? eyf;
  String? ruf;
  int? base;
  String? bVolume;
  int? fandeck;

  factory Weatherproofextemulsion.fromJson(Map<String, dynamic> json) =>
      Weatherproofextemulsion(
        id: json["id"],
        colorName: json["colorName"],
        colorCode: json["colorCode"],
        whf: json["WHF"],
        fbf: json["FBF"],
        fgf: json["FGF"],
        fef: json["FEF"],
        yof: json["YOF"],
        fvf: json["FVF"],
        iyf: json["IYF"],
        mgf: json["MGF"],
        irf: json["IRF"],
        rof: json["ROF"],
        erf: json["ERF"],
        myf: json["MYF"],
        lbf: json["LBF"],
        lgf: json["LGF"],
        eyf: json["EYF"],
        ruf: json["RUF"],
        base: json["base"],
        bVolume: json["bVolume"].toString(),
        fandeck: json["fandeck"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "colorName": colorName,
        "colorCode": colorCode,
        "WHF": whf,
        "FBF": fbf,
        "FGF": fgf,
        "FEF": fef,
        "YOF": yof,
        "FVF": fvf,
        "IYF": iyf,
        "MGF": mgf,
        "IRF": irf,
        "ROF": rof,
        "ERF": erf,
        "MYF": myf,
        "LBF": lbf,
        "LGF": lgf,
        "EYF": eyf,
        "RUF": ruf,
        "base": base,
        "bVolume": bVolume.toString(),
        "fandeck": fandeck,
      };
}
