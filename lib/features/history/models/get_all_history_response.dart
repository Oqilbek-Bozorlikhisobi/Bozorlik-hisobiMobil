import 'package:bozorlik/features/cart/models/cart_response.dart';

class HistoryResponse {
  String? message;
  int? statusCode;
  HistoryResponseData? data;

  HistoryResponse({this.message, this.statusCode, this.data});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? HistoryResponseData.fromJson(json['data']) : null;
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

class HistoryResponseData {
  List<HistoryResponseDataData>? data;
  int? total;
  int? page;
  int? limit;
  int? totalPages;

  HistoryResponseData({this.data, this.total, this.page, this.limit, this.totalPages});

  HistoryResponseData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HistoryResponseDataData>[];
      json['data'].forEach((v) {
        data!.add(HistoryResponseDataData.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    return data;
  }
}

class HistoryResponseDataData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<Users>? users;
  List<MarketLists>? marketLists;
  MarketType? marketType;
  String? totalPrice;
  String? location;

  HistoryResponseDataData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.users,
        this.marketLists,
        this.marketType,
        this.totalPrice,
        this.location});

  HistoryResponseDataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    if (json['marketLists'] != null) {
      marketLists = <MarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(MarketLists.fromJson(v));
      });
    }
    marketType = json['marketType'] != null
        ? MarketType.fromJson(json['marketType'])
        : null;
    totalPrice = json['totalPrice'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (marketLists != null) {
      data['marketLists'] = marketLists!.map((v) => v.toJson()).toList();
    }
    if (marketType != null) {
      data['marketType'] = marketType!.toJson();
    }
    data['totalPrice'] = totalPrice;
    data['location'] = location;
    return data;
  }
}

class Users {
  String? id;
  String? gender;
  String? region;
  String? fullName;
  String? createdAt;
  String? updatedAt;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;

  Users(
      {this.id,
        this.gender,
        this.region,
        this.fullName,
        this.createdAt,
        this.updatedAt,
        this.phoneNumber,
        this.hashedPassword,
        this.hashedRefreshToken});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    region = json['region'];
    fullName = json['fullName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    phoneNumber = json['phoneNumber'];
    hashedPassword = json['hashedPassword'];
    hashedRefreshToken = json['hashedRefreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['region'] = region;
    data['fullName'] = fullName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['phoneNumber'] = phoneNumber;
    data['hashedPassword'] = hashedPassword;
    data['hashedRefreshToken'] = hashedRefreshToken;
    return data;
  }
}

class MarketLists {
  String? id;
  Unit? unit;
  Users? user;
  int? price;
  Product? product;
  bool? isBuying;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? productName;
  String? calculationType;

  MarketLists(
      {this.id,
        this.unit,
        this.user,
        this.price,
        this.product,
        this.isBuying,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.productName,
        this.calculationType});

  MarketLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    user = json['user'] != null ? Users.fromJson(json['user']) : null;
    price = json['price'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;

    // product = json['product'];
    isBuying = json['isBuying'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    productName = json['productName'];
    calculationType = json['calculationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['price'] = price;
    data['product'] = product;
    data['isBuying'] = isBuying;
    data['quantity'] = quantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['productName'] = productName;
    data['calculationType'] = calculationType;
    return data;
  }
}

class Unit {
  String? id;
  String? nameEn;
  String? nameRu;
  String? nameUz;
  String? nameUzk;
  String? createdAt;
  String? updatedAt;

  Unit(
      {this.id,
        this.nameEn,
        this.nameRu,
        this.nameUz,
        this.nameUzk,
        this.createdAt,
        this.updatedAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameRu = json['nameRu'];
    nameUz = json['nameUz'];
    nameUzk = json['nameUzk'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameRu'] = nameRu;
    data['nameUz'] = nameUz;
    data['nameUzk'] = nameUzk;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MarketType {
  String? id;
  String? image;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? createdAt;
  String? updatedAt;

  MarketType(
      {this.id,
        this.image,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.createdAt,
        this.updatedAt});

  MarketType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['titleEn'] = titleEn;
    data['titleRu'] = titleRu;
    data['titleUz'] = titleUz;
    data['titleUzk'] = titleUzk;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
