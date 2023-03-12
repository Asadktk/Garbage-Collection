class ScanTokenModel {
  String? userName;
  String? blockName;
  int? street;
  int? houseNo;
  String? tokenNo;

  ScanTokenModel(
      {this.userName, this.blockName, this.street, this.houseNo, this.tokenNo});

  ScanTokenModel.fromJson(Map<String, dynamic> json) {
    userName = json['User_name'];
    blockName = json['Block_name'];
    street = json['Street'];
    houseNo = json['House_no'];
    tokenNo = json['Token_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_name'] = this.userName;
    data['Block_name'] = this.blockName;
    data['Street'] = this.street;
    data['House_no'] = this.houseNo;
    data['Token_no'] = this.tokenNo;
    return data;
  }
}
