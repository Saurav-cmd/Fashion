class SavedCustomerDetail {
  int? id;
  String? customerName;
  String? address;
  String? contact;
  String? colorName;
  SavedCustomerDetail({
    this.id,
    this.customerName,
    this.address,
    this.contact,
    this.colorName
  });

  factory SavedCustomerDetail.fromMap(Map<String,dynamic>json)=>SavedCustomerDetail(
    id: json["id"],
    customerName: json["customerName"],
    address: json["address"],
    contact: json["contact"],
    colorName: json["colorName"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "customerName":customerName,
      "address":address,
      "contact":contact,
      "colorName":colorName
    };
  }
}
