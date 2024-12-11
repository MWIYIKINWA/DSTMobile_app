class AllResizing {
  bool? success;
  String? message;
  List<Resizing>? resizing;

  AllResizing({this.success, this.message, this.resizing});

  AllResizing.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      resizing = <Resizing>[];
      json['data'].forEach((v) {
        resizing!.add(Resizing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (resizing != null) {
      data['data'] = resizing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resizing {
  int? id;
  String? dstName;
  String? resCustomer;
  String? resCurrentIsp;
  String? resCurrentService;
  String? resCurrentBw;
  String? resAmount;
  String? resLocation;
  String? resStreet;

  Resizing(
      {this.id,
      this.dstName,
      this.resCustomer,
      this.resCurrentIsp,
      this.resCurrentService,
      this.resCurrentBw,
      this.resAmount,
      this.resLocation,
      this.resStreet});

  Resizing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dstName = json['dst_name'];
    resCustomer = json['res_customer'];
    resCurrentIsp = json['res_current_isp'];
    resCurrentService = json['res_current_service'];
    resCurrentBw = json['res_current_bw'];
    resAmount = json['res_amount'];
    resLocation = json['res_location'];
    resStreet = json['res_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dst_name'] = dstName;
    data['res_customer'] = resCustomer;
    data['res_current_isp'] = resCurrentIsp;
    data['res_current_service'] = resCurrentService;
    data['res_current_bw'] = resCurrentBw;
    data['res_amount'] = resAmount;
    data['res_location'] = resLocation;
    data['res_street'] = resStreet;
    return data;
  }
}
