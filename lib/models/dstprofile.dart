class DstProfile {
  int? id;
  String? dstName;
  String? dstEmail;
  String? dstPassword;
  String? dstPhone;
  String? auuid;

  DstProfile({
    this.id,
    this.dstName,
    this.dstEmail,
    this.dstPassword,
    this.dstPhone,
    this.auuid,
  });

  DstProfile.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    dstName = json['dst_name'];
    dstEmail = json['dst_email'];
    dstPassword = json['dst_password'];
    dstPhone = json['dst_phone']?.toString();
    auuid = json['auuid']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dst_name'] = dstName;
    data['dst_email'] = dstEmail;
    data['dst_password'] = dstPassword;
    data['dst_phone'] = dstPhone;
    data['auuid'] = auuid;
    return data;
  }
}
