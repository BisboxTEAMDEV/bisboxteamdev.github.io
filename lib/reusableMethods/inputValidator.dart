
import 'package:giz_admin_dashboard/reusableMethods/verifyNetworkProvider.dart';

class InputValidator {

  static validateFullName( String? userInput ){

    if( userInput!.isEmpty ) {

      return "Please enter your full name";
    }
  }

  static validatePassword( String? userInput ){

    if( userInput!.isEmpty ) {

      return "Please enter your password";
    } 
    else if ( userInput.length < 8 ){

      return "Your password must be atleast 8 character";
    }
  }

  static validatePhoneNumber( String? userInput ){

    var network = NetworkProvider().verifyNetworkProvider(userInput);

    if( userInput!.isEmpty ) {

      return "Please enter your phone number";
    } 
    else if ( userInput.length < 9 ){

      return "Please check your phone number";
    }
    else if ( !network!["Success"] ) {
      
      return "Please check your phone number";
    }
  }

  static validateAmount( String? userInput ){
    print(userInput);
    if( userInput!.isEmpty ) {

      return "Please enter an amount";
    } 
    else if ( int.parse(userInput) < 250 ){

      return "Please the amount should be more than 250";
    }
  }
}