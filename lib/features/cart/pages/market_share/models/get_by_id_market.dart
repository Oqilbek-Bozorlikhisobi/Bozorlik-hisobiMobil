import 'package:bozorlik/features/cart/models/cart_response.dart';

class GetByIdMarketResponse {
  String? message;
  int? statusCode;
  GetByIdMarketResponseData? data;

  GetByIdMarketResponse({this.message, this.statusCode, this.data});

  GetByIdMarketResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? GetByIdMarketResponseData.fromJson(json['data']) : null;
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

class GetByIdMarketResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  bool? isAllBuy;
  List<GetByIdMarketResponseDataUsers>? users;
  String? marketCreator;
  List<GetByIdMarketResponseDataUsers>? pendingUsers;
  List<MarketLists>? marketLists;
  dynamic? totalPrice;
  String? location;
  MarketType? marketType;
  bool? isCurrent;

  GetByIdMarketResponseData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.isAllBuy,
        this.users,
        this.marketCreator,
        this.pendingUsers,
        this.marketLists,
        this.totalPrice,
        this.location,
        this.marketType,
        this.isCurrent});

  GetByIdMarketResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    isAllBuy = json['isAllBuy'];
    if (json['users'] != null) {
      users = <GetByIdMarketResponseDataUsers>[];
      json['users'].forEach((v) {
        users!.add(GetByIdMarketResponseDataUsers.fromJson(v));
      });
    }
    if (json['pendingUsers'] != null) {
      pendingUsers = <GetByIdMarketResponseDataUsers>[];
      json['pendingUsers'].forEach((v) {
        pendingUsers!.add(GetByIdMarketResponseDataUsers.fromJson(v));
      });
    }
    marketCreator = json['marketCreator'];
    // pendingUsers = json['pendingUsers'];
    if (json['marketLists'] != null) {
      marketLists = <MarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(MarketLists.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    location = json['location'];
    marketType = json['marketType'] != null
        ? MarketType.fromJson(json['marketType'])
        : null;
    isCurrent = json['isCurrent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
    data['isAllBuy'] = isAllBuy;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    data['marketCreator'] = marketCreator;
    data['pendingUsers'] = pendingUsers;
    if (marketLists != null) {
      data['marketLists'] = marketLists!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['location'] = location;
    if (marketType != null) {
      data['marketType'] = marketType!.toJson();
    }
    data['isCurrent'] = isCurrent;
    return data;
  }
}

class GetByIdMarketResponseDataUsers {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  String? region;
  String? gender;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;
  String? fcmToken;

  GetByIdMarketResponseDataUsers(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.fullName,
        this.region,
        this.gender,
        this.phoneNumber,
        this.hashedPassword,
        this.hashedRefreshToken,
        this.fcmToken});

  GetByIdMarketResponseDataUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fullName = json['fullName'];
    region = json['region'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    hashedPassword = json['hashedPassword'];
    hashedRefreshToken = json['hashedRefreshToken'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['fullName'] = fullName;
    data['region'] = region;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['hashedPassword'] = hashedPassword;
    data['hashedRefreshToken'] = hashedRefreshToken;
    data['fcmToken'] = fcmToken;
    return data;
  }
}

class MarketLists {
  String? id;
  String? createdAt;
  String? updatedAt;
  Product? product;
  String? productName;
  int? quantity;
  double? price;
  String? calculationType;
  bool? isBuying;
  String? description;
  Users? user;
  Unit? unit;

  MarketLists(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.product,
        this.productName,
        this.quantity,
        this.price,
        this.calculationType,
        this.isBuying,
        this.description,
        this.user,
        this.unit});

  MarketLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product = json['product'];
    productName = json['productName'];
    quantity = json['quantity'];
    price = json['price'];
    calculationType = json['calculationType'];
    isBuying = json['isBuying'];
    description = json['description'];
    user = json['user'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['product'] = product;
    data['productName'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['calculationType'] = calculationType;
    data['isBuying'] = isBuying;
    data['description'] = description;
    data['user'] = user;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    return data;
  }
}

class Unit {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameRu;
  String? nameUz;
  String? nameUzk;

  Unit(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameRu,
        this.nameUz,
        this.nameUzk});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nameEn = json['nameEn'];
    nameRu = json['nameRu'];
    nameUz = json['nameUz'];
    nameUzk = json['nameUzk'];
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
    return data;
  }
}

class MarketType {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? image;

  MarketType(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.image});

  MarketType.fromJson(Map<String, dynamic> json) {
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
