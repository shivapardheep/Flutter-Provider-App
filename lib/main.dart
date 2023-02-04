import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testapp/classes/stream_class.dart';
import 'package:flutter_testapp/models/user.dart';
import 'package:flutter_testapp/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyAa5tHllUPrdARrnzS_Y_dyejErILIB_ws",
      appId: "1:457346831022:android:23916cff9c95b29efb133f",
      messagingSenderId: "",
      projectId: "flutter-projects-2cf73",
    ),
  );
  runApp(StreamProvider<List<UserData>>.value(
    value: StreamServiceClass().getUserData(),
    initialData: const <UserData>[],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
