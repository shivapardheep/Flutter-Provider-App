class UserResponse {
  String? userId;
  String? imageBinary;
  String? username;
  String? email;
  String? mobile;
  String? address;

  UserResponse(
      {this.userId,
      this.imageBinary,
      this.username,
      this.email,
      this.mobile,
      this.address});

  UserResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    imageBinary = json['imageBinary'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['imageBinary'] = imageBinary;
    data['username'] = username;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}
