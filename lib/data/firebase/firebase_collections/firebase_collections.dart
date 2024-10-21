import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static CollectionReference users = FirebaseFirestore.instance.collection("users");

}