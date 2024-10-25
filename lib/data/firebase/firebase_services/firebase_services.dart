import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/custom_log.dart';
import 'package:feature_first/data/firebase/firbase_methods/firebase_methods.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/model/booking_model.dart';
import 'package:feature_first/data/model/user_model.dart';

class FirebaseServices {

  static Future<UserModel?> createNewAccount({
    required CollectionReference collection,
    required Map<String, dynamic> body,
  }) async {

    String email = body["email"];

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

    try {
      CollectionReference collection = userType == "Admin" ? FirebaseCollections.admin : FirebaseCollections.mechanic;
      QuerySnapshot querySnapshot = await collection
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .where("user_type", isEqualTo: userType)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> response = querySnapshot.docs.first.data() as Map<String, dynamic>;
        UserModel userModel = UserModel.fromJson(response);
        return userModel;
      } else {
        return null;
      }
    }catch(e){
      CustomLog.errorPrint(e);
      return null;
    }

  }


  static Future<List<UserModel>?> getAllMechanic() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseCollections.mechanic.get();
      List<UserModel> allDocuments = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return allDocuments;
    } catch (e) {
      CustomLog.errorPrint(e);
      return null;
    }
  }

  static Future<bool?> createBookingServices({required Map<String,dynamic> body})async{
    try{
      await FirebaseMethods().add(
          collection: FirebaseCollections.bookings,
          body: body
      );
      return true;
    }catch(e){
      CustomLog.errorPrint(e);
      return null;
    }
  }


  static Future<List<BookingModel>?> fetchAdminBookings({required int adminId}) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseCollections.bookings.where("admin_id", isEqualTo: adminId).get();
      List<BookingModel> bookings = querySnapshot.docs.map((doc) {
        return BookingModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return bookings;
    } catch (e) {
      CustomLog.errorPrint(e);
      return null;
    }
  }

 static Future<List<BookingModel>?> fetchMechanicBookingsJob({required int mechanicId}) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseCollections.bookings.where("mechanic_id", isEqualTo: mechanicId).get();
      List<BookingModel> bookings = querySnapshot.docs.map((doc) {
        return BookingModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return bookings;
    } catch (e) {
      CustomLog.errorPrint(e);
      return null;
    }
  }












}