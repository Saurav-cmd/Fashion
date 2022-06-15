// To parse this JSON data, do
//
//     final noticeLog = noticeLogFromJson(jsonString);

import 'dart:convert';

NoticeLog noticeLogFromJson(String str) => NoticeLog.fromJson(json.decode(str));

String noticeLogToJson(NoticeLog data) => json.encode(data.toJson());

class NoticeLog {
  NoticeLog({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory NoticeLog.fromJson(Map<String, dynamic> json) => NoticeLog(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.flag,
    this.title,
    this.notice,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.expiryDate,
    this.noticeType,
    this.createdBy,
    this.publish,
  });

  int? id;
  dynamic userId;
  String? flag;
  String? title;
  String? notice;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic image;
  DateTime? expiryDate;
  String? noticeType;
  dynamic createdBy;
  int? publish;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        flag: json["flag"],
        title: json["title"],
        notice: json["notice"],
        date: DateTime.parse(json["date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        expiryDate: json["expiry_date"] == null
            ? null
            : DateTime.parse(json["expiry_date"]),
        noticeType: json["notice_type"] == null ? null : json["notice_type"],
        createdBy: json["created_by"],
        publish: json["publish"] == null ? null : json["publish"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "flag": flag,
        "title": title,
        "notice": notice,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "image": image,
        "expiry_date": expiryDate == null
            ? null
            : "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
        "notice_type": noticeType == null ? null : noticeType,
        "created_by": createdBy,
        "publish": publish == null ? null : publish,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
