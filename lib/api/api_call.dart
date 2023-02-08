import 'dart:convert';

import 'package:flutter_testapp/models/User_response.dart';
import 'package:http/http.dart' as http;

class ApiClass {
  UserResponse Datas = UserResponse.fromJson({"username": ""});
  Future<UserResponse> getDataFun() async {
    try {
      var response = await http.get(Uri.parse(
          'https://maccode.in/adhoccars/mypanel/api_adhocCars/user_profile_update_list.php?user_id=1'));
      if (response.statusCode == 200) {
        var instance = json.decode(response.body)['data'][0];
        print("data is : $instance");
        Datas = UserResponse.fromJson(instance);
        return Datas;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      return UserResponse.fromJson({"username": e.toString()});
    }
  }
}
