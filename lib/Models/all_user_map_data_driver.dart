class UserMapLocationModel {
  int? userId;
  String? name;
  String? userName;
  String? email;
  String? phoneNo;
  String? pasword;
  String? city;
  String? area;
  int? street;
  int? houseNo;
  String? utype;
  String? longitude;
  String? latitude;
  String? blockName;
  int? blockId;

  UserMapLocationModel(
      {this.userId,
      this.name,
      this.userName,
      this.email,
      this.phoneNo,
      this.pasword,
      this.city,
      this.area,
      this.street,
      this.houseNo,
      this.utype,
      this.longitude,
      this.latitude,
      this.blockName,
      this.blockId});

  UserMapLocationModel.fromJson(Map<String, dynamic> json) {
    userId = json['User_id'];
    name = json['Name'];
    userName = json['User_name'];
    email = json['Email'];
    phoneNo = json['Phone_no'];
    pasword = json['Pasword'];
    city = json['City'];
    area = json['Area'];
    street = json['Street'];
    houseNo = json['House_no'];
    utype = json['Utype'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    blockName = json['Block_name'];
    blockId = json['Block_id'];
  }
}
