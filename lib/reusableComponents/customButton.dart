
import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const CustomButton({
    Key? key,
    required this.text,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(blueColor),
        fixedSize: MaterialStateProperty.all<Size>(Size(screenSize.width / 8, 64)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ))
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          // horizontal: 16,
          vertical: 16
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700
          ),
        )
      )
    );
  }
}