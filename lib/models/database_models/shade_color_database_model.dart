class ShadeColorDatabase {
  int?columnId;
  int? id;
  int? sId;
  String? colorCode;
  String? colorName;
  double? doubleDefenceEe;
  double? elegaIe;
  double? newBarpimoIe;
  double? newShangrilaEe;
  double? newShangrilaIe;
  double? newUltraProtecEe;
  double? protecEe;
  double? relianceDist;
  double? shangrilaDist;
  double? rValue;
  double? gValue;
  double? bValue;

  ShadeColorDatabase({
    this.columnId,
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
        this.bValue
  });

  factory ShadeColorDatabase.fromMap(Map<String,dynamic>json)=>ShadeColorDatabase(
      columnId:json["columnId"],
      id:json["id"],
      sId:json["sId"],
      colorCode:json["colorCode"],
      colorName:json["colorName"],
      doubleDefenceEe:json["doubleDefenceEe"],
      elegaIe:json["elegaIe"],
      newBarpimoIe:json["newBarpimoIe"],
      newShangrilaEe:json["newShangrilaEe"],
      newShangrilaIe:json["newShangrilaIe"],
      newUltraProtecEe:json["newUltraProtecEe"],
      protecEe:json["protecEe"],
      relianceDist:json["relianceDist"],
      shangrilaDist:json["shangrilaDist"],
      rValue:json["rValue"],
      gValue:json["gValue"],
      bValue:json["bValue"]
  );

  Map<String,dynamic> toMap(){
    return{
      "columnId":columnId,
      "id":id,
      "sId":sId,
      "colorCode":colorCode,
      "colorName":colorName,
      "doubleDefenceEe":doubleDefenceEe,
      "elegaIe":elegaIe,
      "newBarpimoIe":newBarpimoIe,
      "newShangrilaEe":newShangrilaEe,
      "newShangrilaIe":newShangrilaIe,
      "newUltraProtecEe":newUltraProtecEe,
      "protecEe":protecEe,
      "relianceDist":relianceDist,
      "shangrilaDist":shangrilaDist,
      "rValue":rValue,
      "gValue":gValue,
      "bValue":bValue,
    };
  }
}
