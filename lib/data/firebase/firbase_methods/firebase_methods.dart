import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethods{

  Future<Map<String,dynamic>?> add({
    required CollectionReference collection,
    required Map<String,dynamic> body
  })async{
    DocumentReference value = await collection.add(body);
    value.get().then((DocumentSnapshot docSnapshot){
      if(docSnapshot.exists){
        return docSnapshot.data();
      }
    });
    return null;
  }



}