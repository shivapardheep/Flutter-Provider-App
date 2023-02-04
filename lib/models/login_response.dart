class LoginResponse {
  String? status;
  String? user;
  String? role;
  String? name;
  String? colid;
  String? regno;
  String? section;
  String? semester;
  String? department;
  String? programcode;
  String? token;

  LoginResponse(
      {this.status,
      this.user,
      this.role,
      this.name,
      this.colid,
      this.regno,
      this.section,
      this.semester,
      this.department,
      this.programcode,
      this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'];
    role = json['role'];
    name = json['name'];
    colid = json['colid'];
    regno = json['regno'];
    section = json['section'];
    semester = json['semester'];
    department = json['department'];
    programcode = json['programcode'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user'] = user;
    data['role'] = role;
    data['name'] = name;
    data['colid'] = colid;
    data['regno'] = regno;
    data['section'] = section;
    data['semester'] = semester;
    data['department'] = department;
    data['programcode'] = programcode;
    data['token'] = token;
    return data;
  }
}
