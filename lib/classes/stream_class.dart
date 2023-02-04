import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_testapp/models/user.dart';

class StreamServiceClass {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<UserData>> getUserData() {
    return FirebaseFirestore.instance.collection("users").snapshots().map(
        (QuerySnapshot snapshot) => snapshot.docs
            .map((doc) => UserData.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<UserData>> getUserData2() async* {
    await Future.delayed(const Duration(seconds: 2));
    // yield UserData2(name: "shiva pardheep", age: "20");
    yield <UserData>[
      UserData.fromJson({
        "name": "Shiva",
      }),
      UserData.fromJson({
        "name": "Nive",
      })
    ];
  }
}
