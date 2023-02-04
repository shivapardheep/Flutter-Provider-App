class UserData {
  String? name;
  String? email;
  int? phone;
  String? userid;

  UserData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.userid});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? 0;
    userid = json['userid'] ?? "";
  }
}
