class MyPackage {
  int? packageId;
  String? packageName;
  int? recycleBag;
  int? nonrecycleBag;
  int? price;
  int? userId;

  MyPackage(
      {this.packageId,
      this.packageName,
      this.recycleBag,
      this.nonrecycleBag,
      this.price,
      this.userId});

  MyPackage.fromJson(Map<String, dynamic> json) {
    packageId = json['Package_id'];
    packageName = json['Package_name'];
    recycleBag = json['Recycle_bag'];
    nonrecycleBag = json['Nonrecycle_bag'];
    price = json['Price'];
    userId = json['User_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_id'] = this.packageId;
    data['Package_name'] = this.packageName;
    data['Recycle_bag'] = this.recycleBag;
    data['Nonrecycle_bag'] = this.nonrecycleBag;
    data['Price'] = this.price;
    data['User_id'] = this.userId;
    return data;
  }
}
