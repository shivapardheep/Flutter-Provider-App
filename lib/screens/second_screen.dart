import 'package:flutter/material.dart';
import 'package:flutter_testapp/providers/users_data_provider_future.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    // UserDataProvider().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var dataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page "),
      ),
      body: Center(
          child: dataProvider.isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 15, color: Colors.deepOrange)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dataProvider.userData.username.toString().toUpperCase(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<UserDataProvider>(context, listen: false)
                              .getData();
                        },
                        child: const Text("Update")),
                  ],
                )),
    );
  }
}
