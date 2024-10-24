import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static CollectionReference get admin => FirebaseFirestore.instance.collection("admin");
  static CollectionReference get mechanic => FirebaseFirestore.instance.collection("mechanic");
  static CollectionReference get bookings => FirebaseFirestore.instance.collection("bookings");

}