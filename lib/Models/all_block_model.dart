class BlockModel {
  int? blockId;
  String? city;
  String? area;
  String? blockName;

  BlockModel({this.blockId, this.city, this.area, this.blockName});

  BlockModel.fromJson(Map<String, dynamic> json) {
    blockId = json['Block_id'];
    city = json['City'];
    area = json['Area'];
    blockName = json['Block_name'];
  }
}
