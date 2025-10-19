class GetAllUnitResponse {
  String? message;
  int? statusCode;
  List<GetAllUnitResponseData>? data;

  GetAllUnitResponse({this.message, this.statusCode, this.data});

  GetAllUnitResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <GetAllUnitResponseData>[];
      json['data'].forEach((v) {
        data!.add(GetAllUnitResponseData.fromJson(v));
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

class GetAllUnitResponseData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameRu;
  String? nameUz;
  String? nameUzk;
  List<MarketLists>? marketLists;

  GetAllUnitResponseData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameRu,
        this.nameUz,
        this.nameUzk,
        this.marketLists});

  GetAllUnitResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    nameEn = json['nameEn'];
    nameRu = json['nameRu'];
    nameUz = json['nameUz'];
    nameUzk = json['nameUzk'];
    if (json['marketLists'] != null) {
      marketLists = <MarketLists>[];
      json['marketLists'].forEach((v) {
        marketLists!.add(MarketLists.fromJson(v));
      });
    }
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
    if (marketLists != null) {
      data['marketLists'] = marketLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarketLists {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? productName;
  num? quantity;
  int? price;
  String? calculationType;
  bool? isBuying;
  String? description;

  MarketLists(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.productName,
        this.quantity,
        this.price,
        this.calculationType,
        this.isBuying,
        this.description});

  MarketLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productName = json['productName'];
    quantity = json['quantity'];
    price = json['price'];
    calculationType = json['calculationType'];
    isBuying = json['isBuying'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['productName'] = productName;
    data['quantity'] = quantity;
    data['price'] = price;
    data['calculationType'] = calculationType;
    data['isBuying'] = isBuying;
    data['description'] = description;
    return data;
  }
}
