import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_testapp/models/stream_data.dart';

class StreamServiceClass {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<StreamData>> getUserData() {
    print("hi");
    return FirebaseFirestore.instance.collection("users").snapshots().map(
        (QuerySnapshot snapshot) => snapshot.docs
            .map((doc) =>
                StreamData.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
