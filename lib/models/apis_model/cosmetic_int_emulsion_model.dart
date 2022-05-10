import 'dart:convert';

CosmeticEmulsion cosmeticEmulsionFromJson(String str) => CosmeticEmulsion.fromJson(json.decode(str));

String cosmeticEmulsionToJson(CosmeticEmulsion data) => json.encode(data.toJson());

class CosmeticEmulsion {
  List<Cosmeticintemulsion>? cosmeticintemulsion;

  CosmeticEmulsion({this.cosmeticintemulsion});

  CosmeticEmulsion.fromJson(Map<String, dynamic> json) {
    if (json['cosmeticintemulsion'] != null) {
      cosmeticintemulsion = <Cosmeticintemulsion>[];
      json['cosmeticintemulsion'].forEach((v) {
        cosmeticintemulsion!.add(Cosmeticintemulsion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cosmeticintemulsion != null) {
      data['cosmeticintemulsion'] =
          cosmeticintemulsion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cosmeticintemulsion {
  int? id;
  String? colorName;
  String? colorCode;
  String? WHF;
  String? FBF;
  String? FGF;
  String? FEF;
  String? YOF;
  String? FVF;
  String? IYF;
  String? MGF;
  String? IRF;
  String? ROF;
  String? ERF;
  String? MYF;
  String? LBF;
  String? LGF;
  String? EYF;
  String? RUF;
  int? base;
  String? bVolume;
  int? fandeck;
  String? formulation;

  Cosmeticintemulsion(
      {
        this.id,
        this.colorName,
        this.colorCode,
        this.WHF,
        this.FBF,
        this.FGF,
        this.FEF,
        this.YOF,
        this.FVF,
        this.IYF,
        this.MGF,
        this.IRF,
        this.ROF,
        this.ERF,
        this.MYF,
        this.LBF,
        this.LGF,
        this.EYF,
        this.RUF,
        this.base,
        this.bVolume,
        this.fandeck,
        this.formulation,
      });

  Cosmeticintemulsion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorName = json['colorName'];
    colorCode = json['colorCode'];
    WHF = json['WHF'];
    FBF = json['FBF'];
    FGF = json['FGF'];
    FEF = json['FEF'];
    YOF = json['YOF'];
    FVF = json['FVF'];
    IYF = json['IYF'];
    MGF = json['MGF'];
    IRF = json['IRF'];
    ROF = json['ROF'];
    ERF = json['ERF'];
    MYF = json['MYF'];
    LBF = json['LBF'];
    LGF = json['LGF'];
    EYF = json['EYF'];
    RUF = json['RUF'];
    base = json['base'];
    bVolume = json['bVolume'];
    fandeck = json['fandeck'];
    formulation = json['formulation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['colorName'] = colorName;
    data['colorCode'] = colorCode;
    data['WHF'] = WHF;
    data['FBF'] = FBF;
    data['FGF'] = FGF;
    data['FEF'] = FEF;
    data['YOF'] = YOF;
    data['FVF'] = FVF;
    data['IYF'] = IYF;
    data['MGF'] = MGF;
    data['IRF'] = IRF;
    data['ROF'] = ROF;
    data['ERF'] = ERF;
    data['MYF'] = MYF;
    data['LBF'] = LBF;
    data['LGF'] = LGF;
    data['EYF'] = EYF;
    data['RUF'] = RUF;
    data['base'] = base;
    data['bVolume'] = bVolume;
    data['fandeck'] = fandeck;
    data['formulation'] = formulation;
    return data;
  }
}