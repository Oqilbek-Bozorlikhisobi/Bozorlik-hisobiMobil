class PostProductResponse {
  String? message;
  int? statusCode;
  PostProductResponseData? data;

  PostProductResponse({this.message, this.statusCode, this.data});

  PostProductResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? PostProductResponseData.fromJson(json['data']) : null;
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

class PostProductResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  Market? market;
  Null? product;
  String? productName;
  int? quantity;
  Null? price;
  String? calculationType;
  bool? isBuying;
  String? description;
  Unit? unit;
  String? marketId;
  String? unitId;

  PostProductResponseData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.market,
        this.product,
        this.productName,
        this.quantity,
        this.price,
        this.calculationType,
        this.isBuying,
        this.description,
        this.unit,
        this.marketId,
        this.unitId});

  PostProductResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    market =
    json['market'] != null ? Market.fromJson(json['market']) : null;
    product = json['product'];
    productName = json['productName'];
    quantity = json['quantity'];
    price = json['price'];
    calculationType = json['calculationType'];
    isBuying = json['isBuying'];
    description = json['description'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    marketId = json['marketId'];
    unitId = json['unitId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (market != null) {
      data['market'] = market!.toJson();
    }
    data['product'] = product;
    data['productName'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['calculationType'] = calculationType;
    data['isBuying'] = isBuying;
    data['description'] = description;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    data['marketId'] = marketId;
    data['unitId'] = unitId;
    return data;
  }
}

class Market {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  bool? isAllBuy;
  List<Users>? users;
  String? marketCreator;
  Null? pendingUsers;
  List<MarketLists>? marketLists;
  String? totalPrice;
  String? location;
  MarketType? marketType;
  bool? isCurrent;

  Market(
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

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    isAllBuy = json['isAllBuy'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    marketCreator = json['marketCreator'];
    pendingUsers = json['pendingUsers'];
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

class Users {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  String? region;
  String? gender;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;

  Users(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.fullName,
        this.region,
        this.gender,
        this.phoneNumber,
        this.hashedPassword,
        this.hashedRefreshToken});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    fullName = json['fullName'];
    region = json['region'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    hashedPassword = json['hashedPassword'];
    hashedRefreshToken = json['hashedRefreshToken'];
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
    return data;
  }
}

class MarketLists {
  String? id;
  String? createdAt;
  String? updatedAt;
  dynamic product;  // Changed from Null? to dynamic
  String? productName;
  int? quantity;
  num? price;
  String? calculationType;
  bool? isBuying;
  String? description;
  dynamic user;  // Changed from Null? to dynamic
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
    product = json['product'];  // Now can accept any type
    productName = json['productName'];
    quantity = json['quantity'];
    price = json['price'];
    calculationType = json['calculationType'];
    isBuying = json['isBuying'];
    description = json['description'];
    user = json['user'];  // Now can accept any type
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
