import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class FormInputWidget extends StatelessWidget {

  String? Function(String?)? validator;
  TextEditingController? inputController = TextEditingController();
  TextInputType? keyboardType;
  bool obscureText;
  int? maxLength;
  String? placeholder;

  FormInputWidget({

    Key? key,
    this.obscureText = false,
    this.validator,
    this.inputController,
    this.keyboardType,
    this.maxLength,
    this.placeholder

  }) : super(key: key);

  OutlineInputBorder customOutlineBorderStyle( Color color ) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: color,
          width: 1.0
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: inputController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      maxLength: maxLength,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: customOutlineBorderStyle( secondaryColor ),
        errorBorder: customOutlineBorderStyle( redColor ),
        focusedErrorBorder: customOutlineBorderStyle( secondaryColor )

      ),
    );
  }

}