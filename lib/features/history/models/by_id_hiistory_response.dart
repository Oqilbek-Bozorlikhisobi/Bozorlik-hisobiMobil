import 'package:bozorlik/features/cart/models/cart_response.dart';

class GetHistoryByIdResponse {
  String? message;
  int? statusCode;
  GetHistoryByIdResponseData? data;

  GetHistoryByIdResponse({this.message, this.statusCode, this.data});

  GetHistoryByIdResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? GetHistoryByIdResponseData.fromJson(json['data']) : null;
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

class GetHistoryByIdResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<GetHistoryByIdResponseUsers>? users;
  List<GetHistoryByIdResponseMarketLists>? marketLists;
  GetHistoryByIdResponseMarketType? marketType;
  String? totalPrice;
  String? location;

  GetHistoryByIdResponseData({this.id, this.createdAt, this.updatedAt, this.name, this.users, this.marketLists, this.marketType, this.totalPrice, this.location});

  GetHistoryByIdResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    if (json['users'] != null) {
      users = <GetHistoryByIdResponseUsers>[];
      json['users'].forEach((v) {
        users!.add(GetHistoryByIdResponseUsers.fromJson(v));
      });
    }
    if (json['marketLists'] != null) {
      marketLists = <GetHistoryByIdResponseMarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(GetHistoryByIdResponseMarketLists.fromJson(v));
      });
    }
    marketType = json['marketType'] != null ? GetHistoryByIdResponseMarketType.fromJson(json['marketType']) : null;
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

class GetHistoryByIdResponseUsers {
  String? id;
  String? gender;
  String? region;
  String? fullName;
  String? createdAt;
  String? updatedAt;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;

  GetHistoryByIdResponseUsers({
    this.id,
    this.gender,
    this.region,
    this.fullName,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
    this.hashedPassword,
    this.hashedRefreshToken,
  });

  GetHistoryByIdResponseUsers.fromJson(Map<String, dynamic> json) {
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

class GetHistoryByIdResponseMarketLists {
  String? id;
  Unit? unit;
  GetHistoryByIdResponseUsers? user;
  int? price;
  Product? product;
  bool? isBuying;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? productName;
  String? calculationType;

  GetHistoryByIdResponseMarketLists({
    this.id,
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
    this.calculationType,
  });

  GetHistoryByIdResponseMarketLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    user = json['user'] != null ? GetHistoryByIdResponseUsers.fromJson(json['user']) : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
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

  Unit({this.id, this.nameEn, this.nameRu, this.nameUz, this.nameUzk, this.createdAt, this.updatedAt});

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

class GetHistoryByIdResponseMarketType {
  String? id;
  String? image;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? createdAt;
  String? updatedAt;

  GetHistoryByIdResponseMarketType({this.id, this.image, this.titleEn, this.titleRu, this.titleUz, this.titleUzk, this.createdAt, this.updatedAt});

  GetHistoryByIdResponseMarketType.fromJson(Map<String, dynamic> json) {
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
