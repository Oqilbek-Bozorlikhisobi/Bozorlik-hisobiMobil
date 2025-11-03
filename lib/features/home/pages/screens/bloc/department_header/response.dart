class StatisticResponse {
  String? message;
  int? statusCode;
  StatisticResponseData? data;

  StatisticResponse({this.message, this.statusCode, this.data});

  StatisticResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new StatisticResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class StatisticResponseData {
  int? totalMarkets;
  int? totalSpent;
  int? monthlyMarkets;
  int? monthlySpent;
  String? compareToPrevMonth;

  StatisticResponseData(
      {this.totalMarkets,
        this.totalSpent,
        this.monthlyMarkets,
        this.monthlySpent,
        this.compareToPrevMonth});

  StatisticResponseData.fromJson(Map<String, dynamic> json) {
    totalMarkets = json['totalMarkets'];
    totalSpent = json['totalSpent'];
    monthlyMarkets = json['monthlyMarkets'];
    monthlySpent = json['monthlySpent'];
    compareToPrevMonth = json['compareToPrevMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalMarkets'] = this.totalMarkets;
    data['totalSpent'] = this.totalSpent;
    data['monthlyMarkets'] = this.monthlyMarkets;
    data['monthlySpent'] = this.monthlySpent;
    data['compareToPrevMonth'] = this.compareToPrevMonth;
    return data;
  }
}
