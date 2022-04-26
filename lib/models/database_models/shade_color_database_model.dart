class ShadeColor {
  int id;
  int sId;
  String colorCode;
  String colorName;
  double colorLite;
  double laxmiDisTemper;
  double springDisTemper;
  double homeGuardMatt;
  double homeGuardExtra;
  double primEmulsion;
  double primeGoldEmulsion;
  double rValue;
  double gValue;
  double bValue;

  ShadeColor({
      required this.id,
      required this.sId,
      required this.colorCode,
      required this.colorName,
      required this.colorLite,
      required this.laxmiDisTemper,
      required this.springDisTemper,
      required this.homeGuardMatt,
      required this.homeGuardExtra,
      required this.primEmulsion,
      required this.primeGoldEmulsion,
      required this.rValue,
      required this.gValue,
      required this.bValue
  });

  factory ShadeColor.fromMap(Map<String,dynamic>json)=>ShadeColor(
      id:json["id"],
      sId:json["sId"],
      colorCode:json["colorCode"],
      colorName:json["colorName"],
      colorLite:json["colorLite"],
      laxmiDisTemper:json["laxmiDisTemper"],
      springDisTemper:json["springDisTemper"],
      homeGuardMatt:json["homeGuardMatt"],
      homeGuardExtra:json["homeGuardExtra"],
      primEmulsion:json["primEmulsion"],
      primeGoldEmulsion:json["primeGoldEmulsion"],
      rValue:json["rValue"],
      gValue:json["gValue"],
      bValue:json["bValue"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "sId":sId,
      "colorCode":colorCode,
      "colorName":colorName,
      "colorLite":colorLite,
      "laxmiDisTemper":laxmiDisTemper,
      "springDisTemper":springDisTemper,
      "homeGuardMatt":homeGuardMatt,
      "homeGuardExtra":homeGuardExtra,
      "primEmulsion":primEmulsion,
      "primeGoldEmulsion":primeGoldEmulsion,
      "rValue":rValue,
      "gValue":gValue,
      "bValue":bValue,
    };
  }
}
