
class Student {
 // late int id;
 // late String fullName;
 // late String email;
 // late String gender;
 // late String? fcmToken;
 // late String token;
 // late String refreshToken;
 // late bool isActive;
 // late String passsword;
 //

 late int id;
 late String name;
 late String mobile;
 late String gender;
 late String token;
 // late String tokenType;
 late String refreshToken;


 Student();

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    gender = json['gender'];
    token = json['token'];
    //tokenType = json['tokenType'];
    refreshToken = json['refresh_token'];
  }
}