import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/data/model/user_model.dart';

abstract class AuthenticationDom{

  Future<UserModel?> createNewAccount({
    required CollectionReference collection,
    required Map<String,dynamic> body});

  Future<UserModel?> logInAccount({
    required String userType,
    required String email,
    required String password
  });


  Future<String?> profilePictureUpload({required File imageFile});

  Future<UserModel?> updateUserProfileInfo({
    required int userId,
    required CollectionReference collections,
    required Map<String, dynamic> updatedData
  });


}