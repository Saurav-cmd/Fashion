class Colorants {
  int id;
  String colorantName;
  String colorantCode;
  double unitPrice;
  double rValue;
  double gValue;
  double bValue;
  DateTime createdAt;
  DateTime updatedAt;

  Colorants({
      required this.id,
      required this.colorantName,
      required this.colorantCode,
      required this.unitPrice,
      required this.rValue,
      required this.gValue,
      required this.bValue,
      required this.createdAt,
      required this.updatedAt
  });

  factory Colorants.fromMap(Map<String,dynamic>json)=>Colorants(
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
