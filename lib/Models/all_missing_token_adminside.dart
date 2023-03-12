class GetAllMissingTokenModel {
  int? packageId;
  String? packageName;
  int? recycleBag;
  int? nonrecycleBag;
  int? price;
  int? userId;
  int? upId;
  String? userName;

  GetAllMissingTokenModel(
      {this.packageId,
      this.packageName,
      this.recycleBag,
      this.nonrecycleBag,
      this.price,
      this.userId,
      this.upId,
      this.userName});

  GetAllMissingTokenModel.fromJson(Map<String, dynamic> json) {
    packageId = json['Package_id'];
    packageName = json['Package_name'];
    recycleBag = json['Recycle_bag'];
    nonrecycleBag = json['Nonrecycle_bag'];
    price = json['Price'];
    userId = json['User_id'];
    upId = json['Up_id'];
    userName = json['User_name'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Package_id'] = packageId;
    data['Package_name'] = packageName;
    data['Recycle_bag'] = recycleBag;
    data['Nonrecycle_bag'] = nonrecycleBag;
    data['Price'] = price;
    data['User_id'] = userId;
    data['Up_id'] = upId;
    data['User_name'] = userName;
    return data;
  }
}
