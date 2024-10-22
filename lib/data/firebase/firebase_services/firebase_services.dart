import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/custom_log.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/model/user_model.dart';

class FirebaseServices {

  static Future<UserModel?> createNewAccount({
    required CollectionReference collection,
    required Map<String, dynamic> body,
  }) async {

    String email = body['email'];

    QuerySnapshot querySnapshot = await collection.where("email", isEqualTo: email).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      CustomLog.errorPrint("Account already exists with the email: $email");
      GlobalFunctions().showWarningToast("Account already exists with the email: $email");
      return null;
    }

    DocumentReference value = await collection.add(body);
    DocumentSnapshot docSnapshot = await value.get();
    if (docSnapshot.exists) {
      CustomLog.customPrinterGreen(docSnapshot.data());
      UserModel userModel = UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
      return userModel;
    } else {
      return null;
    }

  }



  static Future<UserModel?> checkUserCredentials({
    required String userType,
    required String email,
    required String password
  }) async {

    // Query the collection for a document where 'email', 'password', and 'user_type' match
    CollectionReference collection = userType == "Admin" ? FirebaseCollections.admin : FirebaseCollections.mechanic;
    QuerySnapshot querySnapshot = await collection
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