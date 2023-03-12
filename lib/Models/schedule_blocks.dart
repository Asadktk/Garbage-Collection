class ScheduleAllBlocksModel {
  int? blockId;
  String? c1userName;
  String? c2userName;
  String? duserName;
  String? vehicleRegno;
  String? days;
  String? blockName;
  String? city;
  String? area;
  String? shift;

  ScheduleAllBlocksModel(
      {this.blockId,
      this.c1userName,
      this.c2userName,
      this.duserName,
      this.vehicleRegno,
      this.days,
      this.blockName,
      this.city,
      this.area,
      this.shift});

  ScheduleAllBlocksModel.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    c1userName = json['C1user_name'];
    c2userName = json['C2user_name'];
    duserName = json['Duser_name'];
    vehicleRegno = json['Vehicle_regno'];
    days = json['Days'];
    blockName = json['Block_name'];
    city = json['City'];
    area = json['Area'];
    shift = json['Shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Block_id'] = blockId;
    data['C1user_name'] = c1userName;
    data['C2user_name'] = c2userName;
    data['Duser_name'] = duserName;
    data['Vehicle_regno'] = vehicleRegno;
    data['Days'] = days;
    data['Block_name'] = blockName;
    data['City'] = city;
    data['Area'] = area;
    data['Shift'] = shift;
    return data;
  }
}
