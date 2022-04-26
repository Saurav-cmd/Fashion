// To parse  this JSON data, do
//
//     final doubledfenceee = doubledfenceeeFromJson(jsonString);

import 'dart:convert';

Doubledfenceee doubledfenceeeFromJson(String str) => Doubledfenceee.fromJson(json.decode(str));

String doubledfenceeeToJson(Doubledfenceee data) => json.encode(data.toJson());

class Doubledfenceee {
  Doubledfenceee({
     this.doubledefenceee,
  });

  List<Doubledefenceee>? doubledefenceee;

  factory Doubledfenceee.fromJson(Map<String, dynamic> json) => Doubledfenceee(
    doubledefenceee: List<Doubledefenceee>.from(json["doubledefenceee"].map((x) => Doubledefenceee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "doubledefenceee": List<dynamic>.from(doubledefenceee!.map((x) => x.toJson())),
  };
}

class Doubledefenceee {
  Doubledefenceee({
     this.id,
     this.colorName,
     this.colorCode,
     this.xt,
     this.tt,
     this.ls,
     this.ms,
     this.rt,
     this.ft,
     this.ks,
     this.mm,
     this.rs,
     this.vt,
     this.pp,
     this.zt,
     this.mt,
     this.lt,
     this.us,
     this.st,
     this.base,
     this.bVolume,
     this.fandeck,

  });

  int? id;
  String? colorName;
  String? colorCode;
  String? xt;
  String? tt;
  String? ls;
  String? ms;
  String? rt;
  String? ft;
  String? ks;
  String? mm;
  String? rs;
  String? vt;
  String? pp;
  String? zt;
  String? mt;
  String? lt;
  String? us;
  String? st;
  int? base;
  String? bVolume;
  int? fandeck;

  factory Doubledefenceee.fromJson(Map<String, dynamic> json) => Doubledefenceee(
    id: json["id"],
    colorName: json["colorName"],
    colorCode: json["colorCode"],
    xt: json["XT"],
    tt: json["TT"],
    ls: json["LS"],
    ms: json["MS"],
    rt: json["RT"],
    ft: json["FT"],
    ks: json["KS"],
    mm: json["MM"],
    rs: json["RS"],
    vt: json["VT"],
    pp: json["PP"],
    zt: json["ZT"],
    mt: json["MT"],
    lt: json["LT"],
    us: json["US"],
    st: json["ST"],
    base: json["base"],
    bVolume: json["bVolume"],
    fandeck: json["fandeck"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "colorName": colorName,
    "colorCode": colorCode,
    "XT": xt,
    "TT": tt,
    "LS": ls,
    "MS": ms,
    "RT": rt,
    "FT": ft,
    "KS": ks,
    "MM": mm,
    "RS": rs,
    "VT": vt,
    "PP": pp,
    "ZT": zt,
    "MT": mt,
    "LT": lt,
    "US": us,
    "ST": st,
    "base": base,
    "bVolume": bVolume,
    "fandeck": fandeck,
  };
}
