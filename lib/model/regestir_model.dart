class LoginModel {
  String? status;
  String? message;
  User? user;
  Authorisation? authorisation;

  LoginModel({this.status, this.message, this.user, this.authorisation});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? new Authorisation.fromJson(json['authorisation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.authorisation != null) {
      data['authorisation'] = this.authorisation!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? googleId;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.googleId });


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // التحقق من وجود المفتاح 'emailVerifiedAt' قبل الوصول إليه
    emailVerifiedAt = json['email_verified_at'] ;
    phone = json['phone'];
    googleId = "284247512039 - gjfr37rtflc1r3ata9u2uc0673o6usrp . apps . googleusercontent . com";
   // googleId = json.containsKey('googleId') && json['googleId'] != null ? json['googleId']?.toString() ?? '' : '';
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['google_id'] = this.googleId;
    return data;
  }
}

class Authorisation {
  String? token;

  Authorisation({this.token});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
