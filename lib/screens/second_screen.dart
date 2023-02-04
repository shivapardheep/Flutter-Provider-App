import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<UserData> data = Provider.of<List<UserData>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page "),
      ),
      body: Center(
        child: Text(data[1].email.toString()),
      ),
    );
  }
}
