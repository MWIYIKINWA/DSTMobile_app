class AllOrders {
  String? id;
  String? auuid;
  String? sofNo;
  String? customerName;
  String? customerAddress;
  String? contactPerson;
  String? contact;
  String? alternativeContact;
  String? billingEmail;
  String? productType;
  String? customerType;
  String? requestType;
  String? serviceCategory;
  String? productName;
  String? billingCountry;
  String? contractPrice;
  String? currency;
  String? kamName;
  String? kamEmail;
  String? tid;
  String? requestSource;
  String? remarks;
  String? sofDoc;
  String? submissionDate;

  AllOrders(
      {this.id,
      this.auuid,
      this.sofNo,
      this.customerName,
      this.customerAddress,
      this.contactPerson,
      this.contact,
      this.alternativeContact,
      this.billingEmail,
      this.productType,
      this.customerType,
      this.requestType,
      this.serviceCategory,
      this.productName,
      this.billingCountry,
      this.contractPrice,
      this.currency,
      this.kamName,
      this.kamEmail,
      this.tid,
      this.requestSource,
      this.remarks,
      this.sofDoc,
      this.submissionDate});

  AllOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    auuid = json['auuid'].toString();
    sofNo = json['sof_no'].toString();
    customerName = json['customer_name'];
    customerAddress = json['customer_address'];
    contactPerson = json['contact_person'];
    contact = json['contact'];
    alternativeContact = json['alternative_contact'];
    billingEmail = json['billing_email'];
    productType = json['product_type'];
    customerType = json['customer_type'];
    requestType = json['request_type'];
    serviceCategory = json['service_category'];
    productName = json['product_name'];
    billingCountry = json['billing_country'];
    contractPrice = json['contract_price'].toString();
    currency = json['currency'];
    kamName = json['kam_name'];
    kamEmail = json['kam_email'];
    tid = json['tid'].toString();
    requestSource = json['request_source'];
    remarks = json['remarks'];
    sofDoc = json['sof_doc'];
    submissionDate = json['submission_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auuid'] = auuid;
    data['sof_no'] = sofNo;
    data['customer_name'] = customerName;
    data['customer_address'] = customerAddress;
    data['contact_person'] = contactPerson;
    data['contact'] = contact;
    data['alternative_contact'] = alternativeContact;
    data['billing_email'] = billingEmail;
    data['product_type'] = productType;
    data['customer_type'] = customerType;
    data['request_type'] = requestType;
    data['service_category'] = serviceCategory;
    data['product_name'] = productName;
    data['billing_country'] = billingCountry;
    data['contract_price'] = contractPrice;
    data['currency'] = currency;
    data['kam_name'] = kamName;
    data['kam_email'] = kamEmail;
    data['tid'] = tid;
    data['request_source'] = requestSource;
    data['remarks'] = remarks;
    data['sof_doc'] = sofDoc;
    data['submission_date'] = submissionDate;
    return data;
  }
}
