class LoginModel {
  Data? data;

  LoginModel({this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? memberId;
  String? name;
  String? email;
  String? mobileNo;
  dynamic gender;
  String? dob;
  String? address;
  dynamic languageKnown;
  dynamic nationality;
  String? qualification;
  int? professionId;
  dynamic otherProfession;
  int? countryId;
  dynamic profilePic;
  String? activeStatus;
  String? lastLoginDated;
  dynamic addedBy;
  String? addedDate;
  String? education;
  String? surname;
  String? currentworking;
  String? currentworkingOther;
  String? qualificationOther;
  String? apiToken;
  String? phoneId;

  Data(
      {this.memberId,
        this.name,
        this.email,
        this.mobileNo,
        this.gender,
        this.dob,
        this.address,
        this.languageKnown,
        this.nationality,
        this.qualification,
        this.professionId,
        this.otherProfession,
        this.countryId,
        this.profilePic,
        this.activeStatus,
        this.lastLoginDated,
        this.addedBy,
        this.addedDate,
        this.education,
        this.surname,
        this.currentworking,
        this.currentworkingOther,
        this.qualificationOther,
        this.apiToken,
        this.phoneId});

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    gender = json['gender'];
    dob = json['dob'];
    address = json['address'];
    languageKnown = json['language_known'];
    nationality = json['nationality'];
    qualification = json['qualification'];
    professionId = json['profession_id'];
    otherProfession = json['other_profession'];
    countryId = json['country_id'];
    profilePic = json['profile_pic'];
    activeStatus = json['active_status'];
    lastLoginDated = json['last_login_dated'];
    addedBy = json['addedBy'];
    addedDate = json['addedDate'];
    education = json['education'];
    surname = json['surname'];
    currentworking = json['currentworking'];
    currentworkingOther = json['currentworking_other'];
    qualificationOther = json['qualification_other'];
    apiToken = json['api_token'];
    phoneId = json['phone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['language_known'] = this.languageKnown;
    data['nationality'] = this.nationality;
    data['qualification'] = this.qualification;
    data['profession_id'] = this.professionId;
    data['other_profession'] = this.otherProfession;
    data['country_id'] = this.countryId;
    data['profile_pic'] = this.profilePic;
    data['active_status'] = this.activeStatus;
    data['last_login_dated'] = this.lastLoginDated;
    data['addedBy'] = this.addedBy;
    data['addedDate'] = this.addedDate;
    data['education'] = this.education;
    data['surname'] = this.surname;
    data['currentworking'] = this.currentworking;
    data['currentworking_other'] = this.currentworkingOther;
    data['qualification_other'] = this.qualificationOther;
    data['api_token'] = this.apiToken;
    data['phone_id'] = this.phoneId;
    return data;
  }
}