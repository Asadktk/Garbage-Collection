class GetAllStaff {
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
  Null? longitude;
  Null? latitude;
  int? blockId;

  GetAllStaff(
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
      this.blockId});

  GetAllStaff.fromJson(Map<String, dynamic> json) {
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
    blockId = json['Block_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = this.userId;
    data['Name'] = this.name;
    data['User_name'] = this.userName;
    data['Email'] = this.email;
    data['Phone_no'] = this.phoneNo;
    data['Pasword'] = this.pasword;
    data['City'] = this.city;
    data['Area'] = this.area;
    data['Street'] = this.street;
    data['House_no'] = this.houseNo;
    data['Utype'] = this.utype;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['Block_id'] = this.blockId;
    return data;
  }
}
