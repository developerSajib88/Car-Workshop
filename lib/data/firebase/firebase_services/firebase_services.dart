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

}