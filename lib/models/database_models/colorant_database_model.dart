class Colorants {
  int? columnId;
  int? id;
  String? colorantName;
  String? colorantCode;
  double? unitPrice;
  double? rValue;
  double? gValue;
  double? bValue;
  DateTime? createdAt;
  DateTime? updatedAt;

  Colorants({
      this.columnId,
       this.id,
       this.colorantName,
       this.colorantCode,
       this.unitPrice,
       this.rValue,
       this.gValue,
       this.bValue,
       this.createdAt,
       this.updatedAt
  });

  factory Colorants.fromMap(Map<String,dynamic>json)=>Colorants(
      columnId: json["columnId"],
      id:json["id"],
      colorantName:json["colorantName"],
      colorantCode:json["colorantCode"],
      unitPrice:json["unitPrice"],
      rValue:json["rValue"],
      gValue:json["gValue"],
      bValue:json["bValue"],
      createdAt:json["createdAt"],
      updatedAt:json["updatedAt"]
  );

  Map<String,dynamic> toMap(){
    return{
      "columnId":columnId,
      "id":id,
      "colorantName":colorantName,
      "colorantCode":colorantCode,
      "unitPrice":unitPrice,
      "rValue":rValue,
      "gValue":gValue,
      "bValue":bValue,
      "createdAt":createdAt,
      "updatedAt":updatedAt
    };
  }

}
