class BrendsResponse {
  String? message;
  int? statusCode;
  BrendsResponseData? data;

  BrendsResponse({this.message, this.statusCode, this.data});

  BrendsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? BrendsResponseData.fromJson(json['data']) : null;
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

class BrendsResponseData {
  List<BrendsResponseDataItems>? items;
  int? page;
  int? limit;
  int? total;
  int? totalPages;

  BrendsResponseData({this.items, this.page, this.limit, this.total, this.totalPages});

  BrendsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <BrendsResponseDataItems>[];
      json['items'].forEach((v) {
        items!.add(BrendsResponseDataItems.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['totalPages'] = totalPages;
    return data;
  }
}

class BrendsResponseDataItems {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  List<BrendsResponseDataItemsProducts>? products;
  String? image;
  List<BrendsResponseDataItemsChildren>? children;

  BrendsResponseDataItems(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.products,
        this.image,
        this.children});

  BrendsResponseDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    if (json['products'] != null) {
      products = <BrendsResponseDataItemsProducts>[];
      json['products'].forEach((v) {
        products!.add(BrendsResponseDataItemsProducts.fromJson(v));
      });
    }
    image = json['image'];
    if (json['children'] != null) {
      children = <BrendsResponseDataItemsChildren>[];
      json['children'].forEach((v) {
        children!.add(BrendsResponseDataItemsChildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['titleEn'] = titleEn;
    data['titleRu'] = titleRu;
    data['titleUz'] = titleUz;
    data['titleUzk'] = titleUzk;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrendsResponseDataItemsProducts {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? descriptionEn;
  String? descriptionRu;
  String? descriptionUz;
  String? descriptionUzk;
  String? images;

  BrendsResponseDataItemsProducts(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.descriptionEn,
        this.descriptionRu,
        this.descriptionUz,
        this.descriptionUzk,
        this.images});

  BrendsResponseDataItemsProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    descriptionEn = json['descriptionEn'];
    descriptionRu = json['descriptionRu'];
    descriptionUz = json['descriptionUz'];
    descriptionUzk = json['descriptionUzk'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['titleEn'] = titleEn;
    data['titleRu'] = titleRu;
    data['titleUz'] = titleUz;
    data['titleUzk'] = titleUzk;
    data['descriptionEn'] = descriptionEn;
    data['descriptionRu'] = descriptionRu;
    data['descriptionUz'] = descriptionUz;
    data['descriptionUzk'] = descriptionUzk;
    data['images'] = images;
    return data;
  }
}

class BrendsResponseDataItemsChildren {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  List<BrendsResponseDataItemsProducts>? products;
  String? image;
  Parent? parent;

  BrendsResponseDataItemsChildren(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.products,
        this.image,
        this.parent});

  BrendsResponseDataItemsChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    if (json['products'] != null) {
      products = <BrendsResponseDataItemsProducts>[];
      json['products'].forEach((v) {
        products!.add(BrendsResponseDataItemsProducts.fromJson(v));
      });
    }
    image = json['image'];
    parent =
    json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['titleEn'] = titleEn;
    data['titleRu'] = titleRu;
    data['titleUz'] = titleUz;
    data['titleUzk'] = titleUzk;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    return data;
  }
}

class Parent {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? image;

  Parent(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.image});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['titleEn'] = titleEn;
    data['titleRu'] = titleRu;
    data['titleUz'] = titleUz;
    data['titleUzk'] = titleUzk;
    data['image'] = image;
    return data;
  }
}
