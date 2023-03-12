class GetAreaModel {
  int? blockId;
  Null? city;
  String? area;
  Null? blockName;

  GetAreaModel({this.blockId, this.city, this.area, this.blockName});

  GetAreaModel.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Block_id'] = this.blockId;
    data['City'] = this.city;
    data['Area'] = this.area;
    data['Block_name'] = this.blockName;
    return data;
  }
}
