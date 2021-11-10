
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/admin.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/customButton.dart';
import 'package:giz_admin_dashboard/reusableComponents/customForm.dart';
import 'package:giz_admin_dashboard/reusableMethods/localStorageController.dart';
import 'package:giz_admin_dashboard/views/createAccount/createAccountController.dart';
import 'package:giz_admin_dashboard/views/createAccount/createAccountModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController? fullName = TextEditingController();
  TextEditingController? phone = TextEditingController();
  TextEditingController? password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullName!.dispose();
    phone!.dispose();
    password!.dispose();

    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSize.width / 3,
                      height: screenSize.height / 1.8,
                      decoration: BoxDecoration(
                        color: sblueColor,
                        borderRadius: BorderRadius.all(Radius.circular(24.0))
                      ),
                      child: Row(
                        children: [

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(56.0, 40.0, 56.0, 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Create your account.",
                                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),

                                  Spacer(),

                                  Expanded(
                                    flex: 5,
                                    child: CustomForm(
                                      formKey: _formKey,  
                                      fullNameController: fullName, 
                                      phoneController: phone, 
                                      passwordController: password
                                    ),
                                  ),
                                  
                                  Spacer(),

                                  Consumer<CreateAccountModel>(
                                    builder: ( context, createAccountModel, child ) => createAccountModel.getLoading() ? Container(

                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        color: blueColor,
                                      )

                                    ) : CustomButton(
                                      text: "Create account",
                                      callback: () async{

                                        Provider.of<CreateAccountModel>(context, listen: false).updateLoading(true);

                                        if(_formKey.currentState!.validate()) {

                                          var adminToSave = {

                                            "fullname": fullName!.text,
                                            "phone": phone!.text.toString(),
                                            "password": password!.text,

                                          };

                                          await CreateAccountController().createAccount(adminToSave);
                                        }
                                        Provider.of<CreateAccountModel>(context, listen: false).updateLoading(false);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          // CustomButton(
                          //   text: "Delete",
                          //   callback: () {

                          //     // var admin = Admin()
                          //     //   ..fullname = "Actual testing"
                          //     //   ..phone = "654987321";

                          //     LocalStorageController().deleteAdminInfo(Admin());
                          //   },
                          // ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SvgPicture.asset(
                  "assets/createAccount/Background-Signup.svg",
                  height: screenSize.height / 1.5,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

