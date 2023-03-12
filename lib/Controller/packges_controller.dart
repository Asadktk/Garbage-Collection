// import 'package:garbage_collection/Models/user_mypackage.dart';

import 'package:garbage_collection/Models/all_garbage_request_model.dart';
import 'package:garbage_collection/Models/package_request.dart';
import 'package:garbage_collection/Models/staf_leave_history_model.dart';
import 'package:garbage_collection/api/adminApis/apiPost.dart';
import 'package:garbage_collection/api/userapi/apiPost.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/admin_packages.dart';
import '../Models/admin_vehicle_model.dart';
import '../Models/all_area_model.dart';
import '../Models/all_assign_block_for_user_model.dart';
import '../Models/all_block_model.dart';
import '../Models/all_city_model.dart';
import '../Models/all_complaint_model.dart';
import '../Models/all_garbagerequest_status_model.dart.dart';
import '../Models/all_missing_token_adminside.dart';
import '../Models/all_scheduleBlock_list.dart';
import '../Models/all_staff_model.dart';
import '../Models/all_user_model.dart';
import '../Models/staff_leave.dart';
import '../Models/user_mypackage.dart';
import '../api/adminApis/apiGet.dart';
import '../api/userapi/apiGet.dart';

class PackgeController {
  AdminApiGetRequest? adminapiGetRequest;
  UserApiGetRequest? userApiGetRequest;
  AdminApiPost? apiPostRequest;

  //Admin All Pckages Show
  // Future<AdminPackages> getAdminPackges() async {
  //   try {
  //     dynamic responce = await adminapiGetRequest!.getadminPackages();
  //     return responce = AdminPackages.fromJson(responce);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  List<AdminPackages> adminPackges = <AdminPackages>[];
  Future<List<AdminPackages>> adminPackagesListController() async {
    AdminApiGetRequest api = AdminApiGetRequest();
    var data = await api.getadminPackages();
    print('Data $data');
    List<AdminPackages> adlist = [];
    print('length ${data.length}');
    data.forEach((element) {
      adlist.add(AdminPackages.fromJson(element));
    });
    print('List ${adlist.length}');
    print('Admin ${adminPackges.length}');
    return adlist;
  }

//user my packages
  List<MyPackage> userPackges = <MyPackage>[];
  Future<List<MyPackage>> userPackagesListController() async {
    UserApiGetRequest api = UserApiGetRequest();

    var data = await api.getmyPackages();
    print('DAta $data');
    List<MyPackage> adlist = [];
    print('length ${data.length}');
    data.forEach((element) {
      adlist.add(MyPackage.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

// All Package Request From User
  Future<List<PackageRequests>> userPackagesRequestController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getpackageRequest();
    print('DAta $data');
    List<PackageRequests> adlist = [];
    print('length ${data.length}');
    data.forEach((element) {
      adlist.add(PackageRequests.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

//Admin Packge request
  Future<dynamic> postUserPackage({var packgeID, var userId}) async {
    UserApiPost api = UserApiPost();
    var data = await api.postUserPackge(packgeID, userId);
    print('Data $data');
    if (data == 'true') print('data store sccessfully');
    return data;
  }

  //User GarbageRequestPackgeStatus
  List<UserGarbageRequestStatusModel> garbageRequestStatus =
      <UserGarbageRequestStatusModel>[];
  Future<List<UserGarbageRequestStatusModel>> getGarbageRequestStatusController(
      {uid}) async {
    UserApiGetRequest api = UserApiGetRequest();

    var data = await api.getUserGarbageRequestStatus(userid: uid);
    print('DAta $data');
    List<UserGarbageRequestStatusModel> adlist = [];
    print('length ${data.length}');
    data.forEach((element) {
      adlist.add(UserGarbageRequestStatusModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //User MissingToken admin side
  List<GetAllMissingTokenModel> missinToken = <GetAllMissingTokenModel>[];
  Future<List<GetAllMissingTokenModel>> getMissingTokenController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllMissingToken();
    print('DAta $data');
    List<GetAllMissingTokenModel> adlist = [];
    print('length ${data.length}');
    data.forEach((element) {
      adlist.add(GetAllMissingTokenModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //User Send Compalints
  Future<dynamic> userSendComplaintController(
      {var userId, var complaint, var Qty, var date}) async {
    UserApiPost api = UserApiPost();
    var data = await api.sentUserComplaint(userId, complaint, Qty, date);
    print('Data $data');
    if (data == 'true') print('data store sccessfully');
    return data;
  }

  //  //User Send GrbageRequest
  // Future<dynamic> userSendGarbageRequestController(
  //     {var userId}) async {
  //   UserApiPost api = UserApiPost();
  //   var data = await api.sendUserGarbageRequest(userId);
  //   print('Data $data');
  //   if (data == 'true') print('data store sccessfully');
  //   return data;
  // }

  //generate token
  Future<dynamic> postGenerateTokenController({
    var upId,
    var recycleBag,
    var nonrecycleBag,
  }) async {
    AdminApiPost api = AdminApiPost();
    var data = await api.postGenerateToken(
      upId,
      recycleBag,
      nonrecycleBag,
    );
    print('Data $data');
    if (data == 'true') print('data store sccessfully');
    return data;
  }

  //Get All Vehicle
  List<AdminAllVehicle> adminVehicle = <AdminAllVehicle>[];
  Future<List<AdminAllVehicle>> getAllVehicleController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllVehicle();
    print('DAta $data');
    List<AdminAllVehicle> adlist = [];
    data.forEach((element) {
      adlist.add(AdminAllVehicle.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All Collector
  List<GetAllStaff> allCollector = <GetAllStaff>[];
  Future<List<GetAllStaff>> getAllCollectorController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllCollector();
    List<GetAllStaff> adlist = [];
    data.forEach((element) {
      adlist.add(GetAllStaff.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All Driver
  List<GetAllStaff> allDriver = <GetAllStaff>[];
  Future<List<GetAllStaff>> getAllDriverController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllDriver();
    List<GetAllStaff> adlist = [];
    data.forEach((element) {
      adlist.add(GetAllStaff.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All Pending User
  List<GetAllUserModel> allPendingUser = <GetAllUserModel>[];
  Future<List<GetAllUserModel>> allPendingUserController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllPendingUser();
    List<GetAllUserModel> adlist = [];
    data.forEach((element) {
      adlist.add(GetAllUserModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All  User Admin Side
  List<GetAllUserModel> allUser = <GetAllUserModel>[];
  Future<List<GetAllUserModel>> allUserController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllUser();
    List<GetAllUserModel> adlist = [];
    data.forEach((element) {
      adlist.add(GetAllUserModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All  Garbage Request Admin Side
  List<GetAllGarbageRequestModel> allGRequest = <GetAllGarbageRequestModel>[];
  Future<List<GetAllGarbageRequestModel>> allGarbageRequestController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllGarbageRequest();
    List<GetAllGarbageRequestModel> adlist = [];
    data.forEach((element) {
      adlist.add(GetAllGarbageRequestModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All  Admin Side Complaint
  List<AllComplaintModel> allComplaint = <AllComplaintModel>[];
  Future<List<AllComplaintModel>> allComplaintController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllComplaint();
    List<AllComplaintModel> adlist = [];
    data.forEach((element) {
      adlist.add(AllComplaintModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All Block
  List<BlockModel> allBlock = <BlockModel>[];
  Future<List<BlockModel>> getAllBlockController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getAllBlock();
    List<BlockModel> adlist = [];
    data.forEach((element) {
      adlist.add(BlockModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  //Get All Staff Leave Request
  List<StaffLeaveModel> StaffLeave = <StaffLeaveModel>[];
  Future<List<StaffLeaveModel>> LeaveRequestController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.staffLeaveRequest();
    List<StaffLeaveModel> adlist = [];
    data.forEach((element) {
      adlist.add(StaffLeaveModel.fromJson(element));
    });
    print('List ${adlist.length}');
    return adlist;
  }

  AdminApiGetRequest api = AdminApiGetRequest();
  List<StaffLeaveHistoryModel> adlist = [];
  Future<List<StaffLeaveHistoryModel>> allLeaveRequestController() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = pref.getString('User_id');
    var data = await api.staffHistoryLeaveRequest(userId: userId);
    print('here entry56654');
    data.forEach((element) {
      adlist.add(StaffLeaveHistoryModel.fromJson(element));
    });
    print('List ${adlist[0].fromDate}');
    return adlist;
  }

  //get All staf record
  // List<StaffLeaveModel> allleaverequest = <StaffLeaveModel>[];
  // Future<List<StaffLeaveModel>> historyStaffReord() async {
  //   AdminApiGetRequest api = AdminApiGetRequest();

  //   var data = await api.staffLeaveRequest();
  //   List<StaffLeaveModel> adlist = [];
  //   data.forEach((element) {
  //     adlist.add(StaffLeaveModel.fromJson(element));
  //   });
  //   print('List ${adlist.length}');
  //   return adlist;
  // }
  //Get All Schedule BlockList
  // List<ScheduleBlockList> allScheduleBlock = <ScheduleBlockList>[];
  // Future<List<ScheduleBlockList>> getScheduleBlockController() async {
  //   AdminApiGetRequest api = AdminApiGetRequest();

  //   var data = await api.getScheduleBlockList();
  //   List<ScheduleBlockList> adlist = [];
  //   data.forEach((element) {
  //     adlist.add(ScheduleBlockList.fromJson(element));
  //   });
  //   print('List ${adlist.length}');
  //   return adlist;
  // }

  //Get City drop down
  List<GetCityModel> cityDropDown = <GetCityModel>[];
  Future<List<GetCityModel>> getCityDropDownDataController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    var data = await api.getCity().then((value) {
      value.forEach((element) {
        cityDropDown.add(GetCityModel.fromJson(element));
      });
    });
    //  GetCityModel.fromJson(data);
    // data.forEach((element) {
    // cityDropDown.add(GetCityModel.fromJson(data[0]));

    //  print('List ${cityDropDown}');
    return cityDropDown;
  }

  //Get Area drop down
  List<GetAreaModel> areaDropDown = <GetAreaModel>[];
  Future<List<GetAreaModel>> getAreaDropDownDataController({city}) async {
    AdminApiGetRequest api = AdminApiGetRequest();

    await api.getArea(city: city).then((value) {
      // print('List ${value.toString()}');
      areaDropDown.clear();
      value.forEach((element) {
        areaDropDown.add(GetAreaModel.fromJson(element));
      });
    });
    print('List ${areaDropDown[0].area}');
    return areaDropDown;
  }

  //Get Area drop down
  List<GetAssignBlockForUser> assignBlockForUser = <GetAssignBlockForUser>[];
  Future<List<GetAssignBlockForUser>> getAllAssignBlockForUserController(
      {city, area}) async {
    AdminApiGetRequest api = AdminApiGetRequest();

    await api.getAllAssignBlockForUser(City: city, Area: area).then((value) {
      // print('List ${value.toString()}');
      assignBlockForUser.clear();
      value.forEach((element) {
        assignBlockForUser.add(GetAssignBlockForUser.fromJson(element));
      });
    });
    print('List ${assignBlockForUser[0].blockName}');
    return assignBlockForUser;
  }
}
