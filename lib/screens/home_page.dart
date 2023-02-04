import 'package:flutter/material.dart';
import 'package:flutter_testapp/models/user.dart';
import 'package:flutter_testapp/screens/second_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<UserData> data = Provider.of<List<UserData>>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Card(
              child: Container(
                height: 100,
                width: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepOrange,
                      Colors.orangeAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(data[i].name.toString()),
                ), //declare your widget here
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SecondPage()));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
