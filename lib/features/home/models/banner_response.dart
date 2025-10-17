class BannerResponse {
  String? message;
  int? statusCode;
  BannerResponseData? data;

  BannerResponse({this.message, this.statusCode, this.data});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? BannerResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BannerResponseData {
  List<BannerResponseDataItems>? items;
  int? page;
  int? limit;
  int? total;

  BannerResponseData({this.items, this.page, this.limit, this.total});

  BannerResponseData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <BannerResponseDataItems>[];
      json['items'].forEach((v) {
        items!.add(BannerResponseDataItems.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    return data;
  }
}

class BannerResponseDataItems {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameRu;
  String? nameUz;
  String? nameUzk;
  String? image;
  String? link;

  BannerResponseDataItems(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameRu,
        this.nameUz,
        this.nameUzk,
        this.image,
        this.link});

  BannerResponseDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nameEn = json['nameEn'];
    nameRu = json['nameRu'];
    nameUz = json['nameUz'];
    nameUzk = json['nameUzk'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['nameEn'] = nameEn;
    data['nameRu'] = nameRu;
    data['nameUz'] = nameUz;
    data['nameUzk'] = nameUzk;
    data['image'] = image;
    data['link'] = link;
    return data;
  }
}
