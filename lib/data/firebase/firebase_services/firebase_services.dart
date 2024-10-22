import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/data/firebase/firbase_methods/firebase_methods.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/model/user_model.dart';

class FirebaseServices {

  static Future<UserModel?> createNewAccount({required Map<String,dynamic> body}) async {
    Map<String,dynamic>? firebaseResponse = await FirebaseMethods().add(
        collection: FirebaseCollections.users,
        body: body
    );
    if(firebaseResponse != null){
      UserModel userModel = UserModel.fromJson(firebaseResponse);
      return userModel;
    }else{
      return null;
    }
  }


  static Future<UserModel?> checkUserCredentials({
    required String userType,
    required String email,
    required String password
  }) async {

    // Query the collection for a document where 'email', 'password', and 'user_type' match
    QuerySnapshot querySnapshot = await FirebaseCollections.users
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .where("user_type", isEqualTo: userType)
        .limit(1) // Limit to 1 document as there should only be one matching user
        .get();

    // Check if any documents match the query
    if (querySnapshot.docs.isNotEmpty) {
      // User exists, return the first matching document data as a Map<String, dynamic>
      Map<String, dynamic> response = querySnapshot.docs.first.data() as Map<String, dynamic>;
      UserModel userModel = UserModel.fromJson(response);
      return userModel;
    } else {
      // No matching user found, return null
      return null;
    }
  }




}