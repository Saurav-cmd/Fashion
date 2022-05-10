// To parse this JSON data, do
//
//     final notices = noticesFromJson(jsonString);

import 'dart:convert';

Notices noticesFromJson(String str) => Notices.fromJson(json.decode(str));

String noticesToJson(Notices data) => json.encode(data.toJson());

class Notices {
  Notices({
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

  int ?currentPage;
  List<Datum> ?data;
  String ?firstPageUrl;
  int ?from;
  int ?lastPage;
  String ?lastPageUrl;
  List<Link> ?links;
  dynamic ?nextPageUrl;
  String ?path;
  int ?perPage;
  dynamic ?prevPageUrl;
  int ?to;
  int ?total;

  factory Notices.fromJson(Map<String, dynamic> json) => Notices(
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
    this.title,
    this.image,
    this.date,
    this.noticeType,
    this.notice,
    this.createdBy,
    this.expiryDate,
    this.publish,
    this.createdAt,
    this.updatedAt,
    this.noticeimage,
    this.tintnoticeimage,
    this.pdfimage,
  });

  int ?id;
  dynamic ?userId;
  String ?title;
  dynamic ?image;
  DateTime ?date;
  String ?noticeType;
  String ?notice;
  int ?createdBy;
  DateTime ?expiryDate;
  int ?publish;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  List<Noticeimage> ?noticeimage;
  List<Noticeimage> ?tintnoticeimage;
  List<Link> ?pdfimage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    image: json["image"],
    date: DateTime.parse(json["date"]),
    noticeType: json["notice_type"],
    notice: json["notice"],
    createdBy: json["created_by"],
    expiryDate: DateTime.parse(json["expiry_date"]),
    publish: json["publish"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    noticeimage: List<Noticeimage>.from(json["noticeimage"].map((x) => Noticeimage.fromJson(x))),
    tintnoticeimage: List<Noticeimage>.from(json["tintnoticeimage"].map((x) => Noticeimage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "image": image,
    "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "notice_type": noticeType,
    "notice": notice,
    "created_by": createdBy,
    "expiry_date": "${expiryDate?.year.toString().padLeft(4, '0')}-${expiryDate?.month.toString().padLeft(2, '0')}-${expiryDate?.day.toString().padLeft(2, '0')}",
    "publish": publish,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "noticeimage": List<dynamic>.from(noticeimage!.map((x) => x.toJson())),
    "tintnoticeimage": List<dynamic>.from(tintnoticeimage!.map((x) => x.toJson())),
  };
}

class Noticeimage {
  Noticeimage({
    this.id,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.noticeId,
  });

  int ?id;
  String ?file;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  int ?noticeId;

  factory Noticeimage.fromJson(Map<String, dynamic> json) => Noticeimage(
    id: json["id"],
    file: json["file"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    noticeId: json["notice_id"] == null ? null : json["notice_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "notice_id": noticeId == null ? null : noticeId,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String ?url;
  String ?label;
  bool ?active;

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
