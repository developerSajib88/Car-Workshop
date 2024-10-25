import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/custom_log.dart';
import 'package:feature_first/data/firebase/firbase_methods/firebase_methods.dart';
import 'package:feature_first/data/firebase/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/model/booking_model.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';


class FirebaseServices {

  static Future<UserModel?> createNewAccount({
    required CollectionReference collection,
    required Map<String, dynamic> body,
  }) async {

    String email = body["email"];

    QuerySnapshot querySnapshot = await collection.where("email", isEqualTo: email).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      CustomLog.errorPrint("Account already exists with the email: $email");
      GlobalFunctions.showWarningToast("Account already exists with the email: $email");
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



  static Future<String?> uploadImageToFirebase(File image) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(image);

      String downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }


  static Future<UserModel?> updateUserInfo({
    required int userId,
    required CollectionReference collections,
    required Map<String, dynamic> updatedData
  }) async {
    try {
      QuerySnapshot querySnapshot = await collections.where("user_Id", isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        await collections.doc(userDoc.id).update(updatedData);
        CustomLog.errorPrint("User data updated successfully.");

        DocumentSnapshot updatedDoc = await collections.doc(userDoc.id).get();
        UserModel userModel = UserModel.fromJson(updatedDoc.data() as Map<String, dynamic>);
        return userModel;
      } else {
        CustomLog.errorPrint("No user found with this userId.");
        return null;
      }
    } catch (e) {
      CustomLog.errorPrint(e);
      return null;
    }
  }





}