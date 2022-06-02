// To parse this JSON data, do
//
//     final priceList = priceListFromJson(jsonString);

import 'dart:convert';

PriceList priceListFromJson(String str) => PriceList.fromJson(json.decode(str));

String priceListToJson(PriceList data) => json.encode(data.toJson());

class PriceList {
  PriceList({
    this.status,
    this.errorCode,
    this.updatedDate,
    this.imageUrl,
  });

  String? status;
  String? errorCode;
  DateTime? updatedDate;
  List<ImageUrl>? imageUrl;

  factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        status: json["status"],
        errorCode: json["error_code"],
        updatedDate: DateTime.parse(json["updated_date"]),
        imageUrl: List<ImageUrl>.from(
            json["image_url"].map((x) => ImageUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error_code": errorCode,
        "updated_date": updatedDate!.toIso8601String(),
        "image_url": List<dynamic>.from(imageUrl!.map((x) => x.toJson())),
      };
}

class ImageUrl {
  ImageUrl({
    this.id,
    this.title,
    this.content,
    this.startingFrom,
    this.endingOn,
    this.image,
    this.type,
    this.createdBy,
    this.status,
    this.publish,
    this.createdAt,
    this.updatedAt,
    this.urlLink,
  });

  int? id;
  String? title;
  String? content;
  DateTime? startingFrom;
  DateTime? endingOn;
  String? image;
  int? type;
  int? createdBy;
  int? status;
  int? publish;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? urlLink;

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        startingFrom: DateTime.parse(json["starting_from"]),
        endingOn: DateTime.parse(json["ending_on"]),
        image: json["image"],
        type: json["type"],
        createdBy: json["created_by"],
        status: json["status"],
        publish: json["publish"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        urlLink: json["url_link"] == null ? null : json["url_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "starting_from":
            "${startingFrom!.year.toString().padLeft(4, '0')}-${startingFrom!.month.toString().padLeft(2, '0')}-${startingFrom!.day.toString().padLeft(2, '0')}",
        "ending_on":
            "${endingOn!.year.toString().padLeft(4, '0')}-${endingOn!.month.toString().padLeft(2, '0')}-${endingOn!.day.toString().padLeft(2, '0')}",
        "image": image,
        "type": type,
        "created_by": createdBy,
        "status": status,
        "publish": publish,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "url_link": urlLink == null ? null : urlLink,
      };
}
