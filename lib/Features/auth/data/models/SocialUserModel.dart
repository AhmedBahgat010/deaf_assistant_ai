class SocialUserModel {
  String? name, email, uId ,userType;
  SocialUserModel({this.name, this.email, this.uId, this.userType });

  SocialUserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    uId = json["uId"];
    userType = json["userType"];
  }

  Map <String, dynamic > toMap (){
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "userType":userType,
    };
}

}