import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_testapp/api/datas.dart';
import 'package:flutter_testapp/models/login_response.dart';
import 'package:http/http.dart' as http;

import '../classes/loginDataClass.dart';

class ApiCall {
  loginFun(LoginDataClass obj) async {
    print(obj.email);
    print(obj.password);
    ApiData apiData = ApiData();
    var url = "${ApiData.loginApi}email=${obj.email}&password=${obj.password}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("response is : ${data.toString()}");
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    } else {
      var data = jsonDecode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    }
  }
}

class CounterFun extends ChangeNotifier {
  static int age = 20;
  void increment() {
    age++;
    notifyListeners();
    print(age);
  }

  int get getAge => age;
}

class Fruits extends ChangeNotifier {
  static List fruitsList = ["apple", "banana"];

  void addFruit(data) {
    fruitsList.add(data + (fruitsList.length + 1).toString());
    notifyListeners();
  }

  List get getFruits => fruitsList;
}
