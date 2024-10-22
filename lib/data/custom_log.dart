 // ignore_for_file: avoid_print

import 'dart:developer';

class CustomLog {
  static bool isPrint = true;

  /// For Warning
  static String warning =
      "[🚫][Provider] : Debug print is encoded, please follow the code of conduct. [🚫] ";

  /// For printing stuff.
  static void customPrinter(dynamic object) {
    if (isPrint) {
      log("[🌶️] : ${object.toString()}");
    } else {
      print(warning);
    }
  }

  /// For printing white stuff.
  static void customPrinterWhite(dynamic object) {
    if (isPrint) {
      log('\x1b[37m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  /// For printing yellow stuff.
  static void customPrinterYellow(dynamic object) {
    if (isPrint) {
      log('\x1b[93m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  /// For printing green stuff.
  static void customPrinterGreen(dynamic object) {
    if (isPrint) {
      log('\x1b[32m$object\x1b[0m');
    } else {
      print(warning);
    }
  }

  /// For printing error
  static void errorPrint(dynamic object) {
    log("", error: '\x1b[41m\x1b[47m [Error] : $object \x1b[0m');
  }
}
