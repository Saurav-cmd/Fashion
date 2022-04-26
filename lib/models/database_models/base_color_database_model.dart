class BaseColor {
  int id;
  String base;
  double unitPrice1;
  double unitPrice2;
  double unitPrice3;
  double unitPrice4;
  double kGLtrFlag;

  BaseColor({
      required this.id,
      required this.base,
      required this.unitPrice1,
      required this.unitPrice2,
      required this.unitPrice3,
      required this.unitPrice4,
      required this.kGLtrFlag
  });

  factory BaseColor.fromMap(Map<String,dynamic>json)=>BaseColor(
      id:json["id"] ,
      base:json["base"],
      unitPrice1:json["unitPrice1"],
      unitPrice2:json["unitPrice2"],
      unitPrice3:json["unitPrice3"],
      unitPrice4:json["unitPrice4"],
      kGLtrFlag:json["kGLtrFlag"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "base":base,
      "unitPrice1":unitPrice1,
      "unitPrice2":unitPrice2,
      "unitPrice3":unitPrice3,
      "unitPrice4":unitPrice4,
      "kGLtrFlag":kGLtrFlag
    };
  }
}
