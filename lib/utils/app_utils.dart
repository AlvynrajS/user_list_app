import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  static Future alert(BuildContext context, String errorString) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.lightBlue, title: Text(errorString));
        });
  }

  static errorSnackbar(String errorCode, String errorMsg, bool isError) {
    return Get.snackbar(
      (isError == true) ? "Error $errorCode" : "Success",
      errorMsg,
      margin: EdgeInsets.all(20),
      backgroundColor: isError == true ? Colors.red : Colors.green,
      icon: const Icon(Icons.error),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class $errorCode {}