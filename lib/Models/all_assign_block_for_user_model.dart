class GetAssignBlockForUser {
  int? blockId;
  Null? city;
  Null? area;
  String? blockName;
  Null? days;
  Null? shift;

  GetAssignBlockForUser(
      {this.blockId,
      this.city,
      this.area,
      this.blockName,
      this.days,
      this.shift});

  GetAssignBlockForUser.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
    days = json['Days'];
    shift = json['Shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Block_id'] = blockId;
    data['City'] = city;
    data['Area'] = area;
    data['Block_name'] = blockName;
    data['Days'] = days;
    data['Shift'] = shift;
    return data;
  }
}
