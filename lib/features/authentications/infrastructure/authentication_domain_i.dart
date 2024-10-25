import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/data/firebase/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user_model.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';

class AuthenticationDomI extends AuthenticationDom{

  @override
  Future<UserModel?> createNewAccount({
    required CollectionReference collection,
    required Map<String,dynamic> body}) async =>
      await FirebaseServices.createNewAccount(collection: collection, body: body);

  @override
  Future<UserModel?> logInAccount({required String userType, required String email, required String password}) async =>
      await FirebaseServices.checkUserCredentials(userType: userType, email: email, password: password);

  @override
  Future<String?> profilePictureUpload({required File imageFile}) async =>
      await FirebaseServices.uploadImageToFirebase(imageFile);

  @override
  Future<UserModel?> updateUserProfileInfo({
    required int userId,
    required CollectionReference<Object?> collections,
    required Map<String, dynamic> updatedData
  }) async => await FirebaseServices.updateUserInfo(
      userId: userId,
      collections: collections,
      updatedData: updatedData
  );
}