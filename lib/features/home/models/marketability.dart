class MarketabilityResponse {
  String? message;
  int? statusCode;
  List<MarketabilityResponseData>? data;

  MarketabilityResponse({this.message, this.statusCode, this.data});

  MarketabilityResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <MarketabilityResponseData>[];
      json['data'].forEach((v) {
        data!.add(new MarketabilityResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarketabilityResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  bool? isAllBuy;
  List<Users>? users;
  String? marketCreator;
  Null? pendingUsers;
  List<MarketLists>? marketLists;
  int? totalPrice;
  Null? location;
  MarketType? marketType;
  bool? isCurrent;

  MarketabilityResponseData(
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

  MarketabilityResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    isAllBuy = json['isAllBuy'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    marketCreator = json['marketCreator'];
    pendingUsers = json['pendingUsers'];
    if (json['marketLists'] != null) {
      marketLists = <MarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(new MarketLists.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    location = json['location'];
    marketType = json['marketType'] != null
        ? new MarketType.fromJson(json['marketType'])
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
  Null? product;
  String? productName;
  int? quantity;
  int? price;
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
    isBuying = json['isBuying'];
    description = json['description'];
    user = json['user'] != null ? new Users.fromJson(json['user']) : null;
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
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
    data['isBuying'] = isBuying;
    data['description'] = description;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
  String? name;

  Unit({this.id, this.createdAt, this.updatedAt, this.name});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['name'] = name;
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
