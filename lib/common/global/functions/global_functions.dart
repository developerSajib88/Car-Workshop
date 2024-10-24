import 'dart:math';

import 'package:feature_first/app/app.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalFunctions {

  static int generateRandomUserId() {
    int randomId = 100000 + Random().nextInt(900000);
    return randomId;
  }

  void showWarningToast(String message) {
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


}