import 'cart_response.dart';

class GetInnerCartResponse {
  String? message;
  int? statusCode;
  CartResponseData? data;

  GetInnerCartResponse({this.message, this.statusCode, this.data});

  GetInnerCartResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? CartResponseData.fromJson(json['data']) : null;
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

