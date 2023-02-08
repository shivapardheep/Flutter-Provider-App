class StreamData {
  String? name;
  String? email;
  int? phone;
  String? userid;

  StreamData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.userid});

  StreamData.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? 0;
    userid = json['userid'] ?? "";
  }
}
