import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/inputWidget.dart';
import 'package:giz_admin_dashboard/reusableMethods/inputValidator.dart';

class CustomForm extends StatelessWidget {

  CustomForm({
    Key? key,
    required this.fullNameController,
    required this.phoneController,
    required this.passwordController,
    required this.formKey
  }) : super(key: key);

  final TextEditingController? fullNameController;
  final TextEditingController? phoneController;
  final TextEditingController? passwordController;
  final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FormInputWidget(
            inputController: fullNameController,
            validator: ( userInput ) {
              return InputValidator.validateFullName(userInput);
            },
            keyboardType: TextInputType.name,
            placeholder: "Full name",

          ),

          FormInputWidget(
            inputController: phoneController,
            validator: ( userInput ) {
              return InputValidator.validatePhoneNumber(userInput);
            },
            keyboardType: TextInputType.name,
            placeholder: "Phone number",

          ),

          FormInputWidget(
            inputController: passwordController,
            validator: ( userInput ) {
              return InputValidator.validatePassword(userInput);
            },
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            placeholder: "Password",

          ),
          
        ],
      )
    );
  }
}

