class GetAllGarbageRequestModel {
  int? garbageId;
  String? userName;
  String? city;
  String? area;
  String? blockName;
  int? status;

  GetAllGarbageRequestModel(
      {this.garbageId,
      this.userName,
      this.city,
      this.area,
      this.blockName,
      this.status});

  GetAllGarbageRequestModel.fromJson(Map<String, dynamic> json) {
    garbageId = json['Garbage_id'];
    userName = json['User_name'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Garbage_id'] = garbageId;
    data['User_name'] = userName;
    data['City'] = city;
    data['Area'] = area;
    data['Block_name'] = blockName;
    data['Status'] = status;
    return data;
  }
}
