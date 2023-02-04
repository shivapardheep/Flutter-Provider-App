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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      // color: Color(
                      //         (math.Random().nextDouble() * 0xFFFFF).toInt())
                      //     .withOpacity(1.0),
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffcc2b5e),
                          Color(0xff753a88),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        data[i].name.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ), //declare your widget here
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 10,
                color: Colors.deepOrange,
              ),
            ),
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
