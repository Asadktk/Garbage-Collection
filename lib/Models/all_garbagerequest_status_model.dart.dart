class UserGarbageRequestStatusModel {
  int? garbageId;
  Null? userName;
  Null? city;
  Null? area;
  Null? blockName;
  int? status;

  UserGarbageRequestStatusModel(
      {this.garbageId,
      this.userName,
      this.city,
      this.area,
      this.blockName,
      this.status});

  UserGarbageRequestStatusModel.fromJson(Map<String, dynamic> json) {
    garbageId = json['Garbage_id'];
    userName = json['User_name'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Garbage_id'] = garbageId;
    data['User_name'] = userName;
    data['City'] = city;
    data['Area'] = area;
    data['Block_name'] = blockName;
    data['Status'] = status;
    return data;
  }
}
