import 'package:flutter/cupertino.dart';
import 'package:flutter_testapp/api/api_call.dart';
import 'package:flutter_testapp/models/User_response.dart';

class UserDataProvider extends ChangeNotifier {
  bool isLoading = true;
  UserResponse userData = UserResponse.fromJson({"username": ""});
  getData() async {
    userData = await ApiClass().getDataFun().whenComplete(() {
      updateFun();
    });
  }

  void updateFun() {
    isLoading = false;
    notifyListeners();
  }
}
