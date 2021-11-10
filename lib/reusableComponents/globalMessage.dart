import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class GlobalMessage {

  static dismissMessage ( BuildContext context) {

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
  test() => print("Test");
  showMessage( BuildContext? context , String message, {int duration = 7, Color backgroundColor = blueColor}) {

    dismissMessage(context!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.fromLTRB(200.0, 0.0, 200.0, 32.0),
        padding: EdgeInsets.symmetric(
          vertical: 32.0
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0))
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        elevation: 5.0,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(

                fontSize: 18
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
      )
    );
  }
}