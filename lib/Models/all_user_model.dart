class GetAllUserModel {
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
  Null? blockName;
  int? blockId;

  GetAllUserModel(
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

  GetAllUserModel.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = userId;
    data['Name'] = name;
    data['User_name'] = userName;
    data['Email'] = email;
    data['Phone_no'] = phoneNo;
    data['Pasword'] = pasword;
    data['City'] = city;
    data['Area'] = area;
    data['Street'] = street;
    data['House_no'] = houseNo;
    data['Utype'] = utype;
    data['Longitude'] = longitude;
    data['Latitude'] = latitude;
    data['Block_name'] = blockName;
    data['Block_id'] = blockId;
    return data;
  }
}
