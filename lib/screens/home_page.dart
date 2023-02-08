import 'package:flutter/material.dart';
import 'package:flutter_testapp/models/stream_data.dart';
import 'package:flutter_testapp/providers/users_data_provider_future.dart';
import 'package:flutter_testapp/screens/movies.dart';
import 'package:flutter_testapp/screens/second_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StreamData> data = Provider.of<List<StreamData>>(context);
    final userResponse = Provider.of<UserDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("User ${userResponse.userData.username}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MoviesScreen()));
              },
              icon: const Icon(
                Icons.movie_filter,
                color: Colors.white,
              ))
        ],
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
