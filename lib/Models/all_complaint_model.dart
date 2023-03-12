class AllComplaintModel {
  int? cid;
  int? userId;
  Null? complaint;
  Null? status;
  String? userName;
  String? city;
  String? description;
  String? area;
  int? qty;
  String? date;

  AllComplaintModel(
      {this.cid,
      this.userId,
      this.complaint,
      this.status,
      this.userName,
      this.city,
      this.description,
      this.area,
      this.qty,
      this.date});

  AllComplaintModel.fromJson(Map<String, dynamic> json) {
    cid = json['Cid'];
    userId = json['User_id'];
    complaint = json['Complaint'];
    status = json['Status'];
    userName = json['User_name'];
    city = json['City'];
    description = json['Description'];
    area = json['Area'];
    qty = json['Qty'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cid'] = cid;
    data['User_id'] = userId;
    data['Complaint'] = complaint;
    data['Status'] = status;
    data['User_name'] = userName;
    data['City'] = city;
    data['Description'] = description;
    data['Area'] = area;
    data['Qty'] = qty;
    data['date'] = date;
    return data;
  }
}
