class PackageRequests {
  int? packageId;
  String? packageName;
  int? recycleBag;
  int? nonrecycleBag;
  int? price;
  int? userId;
  int? upId;
  String? userName;

  PackageRequests(
      {this.packageId,
      this.packageName,
      this.recycleBag,
      this.nonrecycleBag,
      this.price,
      this.userId,
      this.upId,
      this.userName});

  PackageRequests.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Package_id'] = this.packageId;
    data['Package_name'] = this.packageName;
    data['Recycle_bag'] = this.recycleBag;
    data['Nonrecycle_bag'] = this.nonrecycleBag;
    data['Price'] = this.price;
    data['User_id'] = this.userId;
    data['Up_id'] = this.upId;
    data['User_name'] = this.userName;
    return data;
  }
}
