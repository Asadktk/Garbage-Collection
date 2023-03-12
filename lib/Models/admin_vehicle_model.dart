class AdminAllVehicle {
  String? vehicleName;
  String? vehicleRegno;

  AdminAllVehicle({this.vehicleName, this.vehicleRegno});

  AdminAllVehicle.fromJson(Map<String, dynamic> json) {
    vehicleName = json['Vehicle_name'];
    vehicleRegno = json['Vehicle_regno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Vehicle_name'] = this.vehicleName;
    data['Vehicle_regno'] = this.vehicleRegno;
    return data;
  }
}
