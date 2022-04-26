class DoubleDefenceee {
  int? id;
  String? colorName;
  String? colorCode;
  String? xT;
  String? tT;
  String? lS;
  String? mS;
  String? rT;
  String? fT;
  String? kS;
  String? mM;
  String? rS;
  String? vT;
  String? pP;
  String? zT;
  String? mT;
  String? lT;
  String? uS;
  String? sT;
  double? base;
  String? bVolume;
  double? fanDeck;

  DoubleDefenceee({
      this.id,
       this.colorName,
       this.colorCode,
       this.xT,
       this.tT,
       this.lS,
       this.mS,
       this.rT,
       this.fT,
       this.kS,
       this.mM,
       this.rS,
       this.vT,
       this.pP,
       this.zT,
       this.mT,
       this.lT,
       this.uS,
       this.sT,
       this.base,
       this.bVolume,
       this.fanDeck,
      });

  factory DoubleDefenceee.fromMap(Map<String,dynamic>json)=>DoubleDefenceee(
      id: json["id"],
      colorName:json["colorName"],
      colorCode: json["colorCode"],
      xT: json["xT"],
      tT: json["tT"],
      lS: json["lS"],
      mS: json["mS"],
      rT: json["rT"],
      fT: json["fT"],
      kS: json["kS"],
      mM: json["mM"],
      rS: json["rS"],
      vT: json["vT"],
      pP: json["pP"],
      zT: json["zT"],
      mT: json["mT"],
      lT: json["lT"],
      uS: json["uS"],
      sT: json["sT"],
      base: json["base"],
      bVolume: json["bVolume"],
      fanDeck: json["fanDeck"],
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "colorName":colorName,
      "colorCode":colorCode,
      "xT":xT,
      "tT":tT,
      "lS":lS,
      "mS":mS,
      "rT":rT,
      "fT":fT,
      "kS":kS,
      "mM":mM,
      "rS":rS,
      "vT":vT,
      "pP":pP,
      "zT":zT,
      "mT":mT,
      "lT":lT,
      "uS":uS,
      "sT":sT,
      "base":base,
      "bVolume":bVolume,
      "fanDeck":fanDeck,
    };
  }
}
