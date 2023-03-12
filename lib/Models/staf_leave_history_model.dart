class StaffLeaveHistoryModel {
  int? userId;
  String? userName;
  String? city;
  String? area;
  String? fromDate;
  String? toDate;
  String? reason;
  int? status;
  int? leaveId;

  StaffLeaveHistoryModel(
      {this.userId,
      this.userName,
      this.city,
      this.area,
      this.fromDate,
      this.toDate,
      this.reason,
      this.status,
      this.leaveId});

  StaffLeaveHistoryModel.fromJson(Map<String, dynamic> json) {
    userId = json['User_id'];
    userName = json['User_name'];
    city = json['City'];
    area = json['Area'];
    fromDate = json['From_date'];
    toDate = json['To_date'];
    reason = json['Reason'];
    status = json['Status'];
    leaveId = json['Leave_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = this.userId;
    data['User_name'] = this.userName;
    data['City'] = this.city;
    data['Area'] = this.area;
    data['From_date'] = this.fromDate;
    data['To_date'] = this.toDate;
    data['Reason'] = this.reason;
    data['Status'] = this.status;
    data['Leave_id'] = this.leaveId;
    return data;
  }
}
