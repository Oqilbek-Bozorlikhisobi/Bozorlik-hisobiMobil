class NotificationResponse {
  String? message;
  int? statusCode;
  NotificationResponseData? data;

  NotificationResponse({this.message, this.statusCode, this.data});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? NotificationResponseData.fromJson(json['data']) : null;
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

class NotificationResponseData {
  List<NotificationResponseDataItems>? items;
  int? page;
  int? limit;
  int? total;
  int? totalPages;

  NotificationResponseData({this.items, this.page, this.limit, this.total, this.totalPages});

  NotificationResponseData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <NotificationResponseDataItems>[];
      json['items'].forEach((v) {
        items!.add(NotificationResponseDataItems.fromJson(v));
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

class NotificationResponseDataItems {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? titleEn;
  String? titleRu;
  String? titleUz;
  String? titleUzk;
  String? messageEn;
  String? messageRu;
  String? messageUz;
  String? messageUzk;
  bool? isRead;
  bool? isGlobal;
  bool? isSent;
  Null? note;
  Null? market;
  Receiver? receiver;
  Null? sender;

  NotificationResponseDataItems(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.titleEn,
        this.titleRu,
        this.titleUz,
        this.titleUzk,
        this.messageEn,
        this.messageRu,
        this.messageUz,
        this.messageUzk,
        this.isRead,
        this.isGlobal,
        this.isSent,
        this.note,
        this.market,
        this.receiver,
        this.sender});

  NotificationResponseDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    titleEn = json['titleEn'];
    titleRu = json['titleRu'];
    titleUz = json['titleUz'];
    titleUzk = json['titleUzk'];
    messageEn = json['messageEn'];
    messageRu = json['messageRu'];
    messageUz = json['messageUz'];
    messageUzk = json['messageUzk'];
    isRead = json['isRead'];
    isGlobal = json['isGlobal'];
    isSent = json['isSent'];
    note = json['note'];
    market = json['market'];
    receiver = json['receiver'] != null
        ? Receiver.fromJson(json['receiver'])
        : null;
    sender = json['sender'];
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
    data['messageEn'] = messageEn;
    data['messageRu'] = messageRu;
    data['messageUz'] = messageUz;
    data['messageUzk'] = messageUzk;
    data['isRead'] = isRead;
    data['isGlobal'] = isGlobal;
    data['isSent'] = isSent;
    data['note'] = note;
    data['market'] = market;
    if (receiver != null) {
      data['receiver'] = receiver!.toJson();
    }
    data['sender'] = sender;
    return data;
  }
}

class Receiver {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? fullName;
  String? region;
  String? gender;
  String? phoneNumber;
  String? hashedPassword;
  String? hashedRefreshToken;

  Receiver(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.fullName,
        this.region,
        this.gender,
        this.phoneNumber,
        this.hashedPassword,
        this.hashedRefreshToken});

  Receiver.fromJson(Map<String, dynamic> json) {
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
