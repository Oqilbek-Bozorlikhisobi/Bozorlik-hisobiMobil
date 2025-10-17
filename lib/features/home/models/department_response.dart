class DepartmentResponse {
  String? message;
  int? statusCode;
  DepartmentResponseData? data;

  DepartmentResponse({this.message, this.statusCode, this.data});

  DepartmentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new DepartmentResponseData.fromJson(json['data']) : null;
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

class DepartmentResponseData {
  List<DepartmentResponseDataItems>? items;
  int? page;
  int? limit;
  int? total;
  int? totalPages;

  DepartmentResponseData({this.items, this.page, this.limit, this.total, this.totalPages});

  DepartmentResponseData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <DepartmentResponseDataItems>[];
      json['items'].forEach((v) {
        items!.add(new DepartmentResponseDataItems.fromJson(v));
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

class DepartmentResponseDataItems {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? image;
  List<Markets>? markets;

  DepartmentResponseDataItems(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.image,
        this.markets});

  DepartmentResponseDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    image = json['image'];
    if (json['markets'] != null) {
      markets = <Markets>[];
      json['markets'].forEach((v) {
        markets!.add(new Markets.fromJson(v));
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
    data['image'] = image;
    if (markets != null) {
      data['markets'] = markets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Markets {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  bool? isAllBuy;
  String? marketCreator;
  Null? pendingUsers;
  String? totalPrice;
  Null? location;
  bool? isCurrent;

  Markets(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.isAllBuy,
        this.marketCreator,
        this.pendingUsers,
        this.totalPrice,
        this.location,
        this.isCurrent});

  Markets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    isAllBuy = json['isAllBuy'];
    marketCreator = json['marketCreator'];
    pendingUsers = json['pendingUsers'];
    totalPrice = json['totalPrice'];
    location = json['location'];
    isCurrent = json['isCurrent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['isAllBuy'] = isAllBuy;
    data['marketCreator'] = marketCreator;
    data['pendingUsers'] = pendingUsers;
    data['totalPrice'] = totalPrice;
    data['location'] = location;
    data['isCurrent'] = isCurrent;
    return data;
  }
}
