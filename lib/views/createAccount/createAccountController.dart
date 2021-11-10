import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/admin.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/globalContext.dart';
import 'package:giz_admin_dashboard/reusableComponents/globalMessage.dart';
import 'package:giz_admin_dashboard/reusableMethods/localStorageController.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';
import 'package:giz_admin_dashboard/views/createAccount/createAccountModel.dart';
import 'package:giz_admin_dashboard/views/dashboard/dashboard.dart';
import 'package:giz_admin_dashboard/views/mainPage/mainPage.dart';
import 'package:provider/provider.dart';

class CreateAccountController {

  createAccount( Map<String, dynamic> body ) async{
    var createAccountStatus = {};
    try {

      var createdAdminInfo = await ApiServices.createAccount( body ); // Store data in database

      if ( createdAdminInfo["success"] ){

        var adminInfo = Admin()
          ..fullname = createdAdminInfo["data"]["fullname"]
          ..phone = createdAdminInfo["data"]["phone"]
          ..dateCreated = DateTime.parse(createdAdminInfo["data"]["dateCreated"])
          ..token = createdAdminInfo["token"];

        LocalStorageController().saveAdminInfo( adminInfo ); //Store data locally

        createAccountStatus = {

          "success": createdAdminInfo["success"],
          "message": createdAdminInfo["message"].toString()
        };

        GlobalMessage().showMessage(GlobalContext.navigatorKey.currentContext!, "Successfully signed up", duration: 3);

        Future.delayed(Duration(seconds: 4), () {

          Navigator.pushReplacement(GlobalContext.navigatorKey.currentContext!, MaterialPageRoute(builder: (BuildContext context) => MainPage()));
        });
        
      } else if ( !createdAdminInfo["success"] ){

        createAccountStatus = {

          "success": createdAdminInfo["success"],
          "message": createdAdminInfo["message"].toString()
        };

        GlobalMessage().showMessage(GlobalContext.navigatorKey.currentContext!, createdAdminInfo["message"].toString(), duration: 5, backgroundColor: redColor);
        
      }

    } catch ( error ) {

      createAccountStatus = {

        "success": false,
        "message": error.toString()
      };
      GlobalMessage().showMessage(GlobalContext.navigatorKey.currentContext!, "Catched error" + error.toString(), duration: 5, backgroundColor: redColor);
    } 
    
    return createAccountStatus;
  }
}