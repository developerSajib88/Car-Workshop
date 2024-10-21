import 'dart:math';

class GlobalFunctions {

  static int generateRandomUserId() {
    int randomId = 100000 + Random().nextInt(900000);
    return randomId;
  }

}