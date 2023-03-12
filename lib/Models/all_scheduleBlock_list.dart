class ScheduleBlockList {
  int? blockId;
  Null? city;
  Null? area;
  String? blockName;
  Null? days;
  Null? shift;

  ScheduleBlockList(
      {this.blockId,
      this.city,
      this.area,
      this.blockName,
      this.days,
      this.shift});

  ScheduleBlockList.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
    days = json['Days'];
    shift = json['Shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Block_id'] = this.blockId;
    data['City'] = this.city;
    data['Area'] = this.area;
    data['Block_name'] = this.blockName;
    data['Days'] = this.days;
    data['Shift'] = this.shift;
    return data;
  }
}
