import 'package:flutter/material.dart';
import 'package:flutter_testapp/api/api_call.dart';
import 'package:flutter_testapp/models/login_response.dart';

import '../classes/loginDataClass.dart';
import '../screens/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  bool visiblePass = true;
  void GoToHome(loginResponse) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => HomeScreen(
                // loginResponse: loginResponse,
                )),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: emailControl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "email",
                    hintText: "enter your emial",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: passControl,
                  obscureText: visiblePass,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            visiblePass = !visiblePass;
                          });
                        },
                        child: visiblePass
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "enter your Password",
                  ),
                  onSubmitted: (email) {},
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        LoginDataClass obj =
                            LoginDataClass(emailControl.text, passControl.text);
                        ApiCall login = ApiCall();
                        LoginResponse loginResponse = await login.loginFun(obj);
                        if (loginResponse.status == "Success") {
                          GoToHome(loginResponse);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Wrong"),
                                content: const Text(
                                    "Please enter correct email & Password"),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                              ;
                            },
                          );
                        }
                      },
                      child: const Text("Login"))),
            ],
          ),
        ),
      ),
    );
  }
}
