import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMSG({required String message}) {
  if (message.isNotEmpty) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 18.sp);
  }
}
void navigateTo(BuildContext context, {required Widget route}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ));
}