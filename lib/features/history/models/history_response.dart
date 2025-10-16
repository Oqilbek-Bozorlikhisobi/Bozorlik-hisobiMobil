class HistoryResponse {
  String? message;
  int? statusCode;
  List<HistoryResponseData>? data;

  HistoryResponse({this.message, this.statusCode, this.data});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <HistoryResponseData>[];
      json['data'].forEach((v) {
        data!.add(HistoryResponseData.fromJson(v));
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

class HistoryResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<HistoryResponseDataUsers>? users;
  List<HistoryResponseDataMarketLists>? marketLists;
  String? totalPrice;
  String? location;

  HistoryResponseData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.users,
        this.marketLists,
        this.totalPrice,
        this.location});

  HistoryResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    if (json['users'] != null) {
      users = <HistoryResponseDataUsers>[];
      json['users'].forEach((v) {
        users!.add(HistoryResponseDataUsers.fromJson(v));
      });
    }
    if (json['marketLists'] != null) {
      marketLists = <HistoryResponseDataMarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(HistoryResponseDataMarketLists.fromJson(v));
      });
    }
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
    data['totalPrice'] = totalPrice;
    data['location'] = location;
    return data;
  }
}

class HistoryResponseDataUsers {
  String? id;
  String? gender;
  String? region;
  String? fullName;
  String? createdAt;
  String? updatedAt;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;

  HistoryResponseDataUsers(
      {this.id,
        this.gender,
        this.region,
        this.fullName,
        this.createdAt,
        this.updatedAt,
        this.phoneNumber,
        this.hashedPassword,
        this.hashedRefreshToken});

  HistoryResponseDataUsers.fromJson(Map<String, dynamic> json) {
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

class HistoryResponseDataMarketLists {
  String? id;
  Null? unit;
  HistoryResponseDataUsers? user;
  int? price;
  Null? product;
  bool? isBuying;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? productName;

  HistoryResponseDataMarketLists(
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
        this.productName});

  HistoryResponseDataMarketLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unit = json['unit'];
    user = json['user'] != null ? HistoryResponseDataUsers.fromJson(json['user']) : null;
    price = json['price'];
    product = json['product'];
    isBuying = json['isBuying'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit'] = unit;
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
    return data;
  }
}
