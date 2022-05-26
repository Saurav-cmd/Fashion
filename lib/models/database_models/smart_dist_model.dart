class SmartDist {
  int? id;
  int? smartId;
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
  double? base;
  String? bVolume;
  double? fandeck;

  SmartDist({
    this.id,
    this.smartId,
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

  factory SmartDist.fromMap(Map<String, dynamic> json) => SmartDist(
        id: json["id"],
        smartId: json["smartId"],
        colorName: json["colorName"],
        colorCode: json["colorCode"],
        whf: json["whf"],
        fbf: json["fbf"],
        fgf: json["fgf"],
        fef: json["fef"],
        yof: json["yof"],
        fvf: json["fvf"],
        iyf: json["iyf"],
        mgf: json["mgf"],
        irf: json["irf"],
        rof: json["rof"],
        erf: json["erf"],
        myf: json["myf"],
        lbf: json["lbf"],
        lgf: json["lgf"],
        eyf: json["eyf"],
        ruf: json["ruf"],
        base: json["base"],
        bVolume: json["bVolume"],
        fandeck: json["fandeck"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "smartId": smartId,
      "colorName": colorName,
      "colorCode": colorCode,
      "whf": whf,
      "fbf": fbf,
      "fgf": fgf,
      "fef": fef,
      "yof": yof,
      "fvf": fvf,
      "iyf": iyf,
      "mgf": mgf,
      "irf": irf,
      "rof": rof,
      "erf": erf,
      "myf": myf,
      "lbf": lbf,
      "lgf": lgf,
      "eyf": eyf,
      "ruf": ruf,
      "base": base,
      "bVolume": bVolume,
      "fandeck": fandeck,
    };
  }
}
