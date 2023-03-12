class GetCityModel {
  int? blockId;
  String? city;
  String? area;
  Null? blockName;

  GetCityModel({this.blockId, this.city, this.area, this.blockName});

  GetCityModel.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
  }
}
