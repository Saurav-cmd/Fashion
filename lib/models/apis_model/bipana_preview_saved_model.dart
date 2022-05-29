import 'dart:convert';

BipanaPreviewSaved bipanaPreviewSavedFromJson(String str) =>
    BipanaPreviewSaved.fromJson(json.decode(str));

String bipanaPreviewSavedToJson(BipanaPreviewSaved data) =>
    json.encode(data.toJson());

class BipanaPreviewSaved {
  String? status;
  String? errorCode;
  List<ImageUrl>? imageUrl;

  BipanaPreviewSaved({this.status, this.errorCode, this.imageUrl});

  BipanaPreviewSaved.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    if (json['image_url'] != null) {
      imageUrl = <ImageUrl>[];
      json['image_url'].forEach((v) {
        imageUrl!.add(ImageUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error_code'] = errorCode;
    if (imageUrl != null) {
      data['image_url'] = imageUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageUrl {
  int? id;
  String? types;
  String? image;
  String? createdAt;
  String? updatedAt;
  User? user;

  ImageUrl(
      {this.id,
      this.types,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.user});

  ImageUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    types = json['types'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['types'] = types;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
