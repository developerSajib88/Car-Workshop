import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalFunctions {

  static int generateRandomUserId() {
    int randomId = 100000 + Random().nextInt(900000);
    return randomId;
  }

  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    return formatter.format(date);
  }

  static Future<File?> pickImage() async {

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }

  }


  static void showWarningToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorPalates.primaryColor,
        textColor: ColorPalates.defaultWhite,
        fontSize: 10.sp
    );
  }


  static void showSuccessToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: ColorPalates.defaultWhite,
        fontSize: 10.sp
    );
  }


}