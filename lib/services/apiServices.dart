import 'dart:convert';
import 'dart:io';

import 'package:giz_admin_dashboard/reusableComponents/apiEndPoints.dart';
import 'package:giz_admin_dashboard/reusableMethods/localStorageController.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static Future<Map<String, dynamic>> getAllUsers() async {
    
    var response = await http.get( 
      Uri.parse(allUsers),
      headers: {
        "Content-Type": "Application/json; Charset=UTF-8",
        "Authorization": "Bearer ${LocalStorageController().getStoredInfo()["token"].toString()}"
      },
    );
    var allUsersMap = jsonDecode(response.body);

    return allUsersMap;
  }

  static Future<Map<String, dynamic>> getUsersPerCity() async {

    var response = await http.get( 
      Uri.parse(usersPerCity),
      headers: {
        "Content-Type": "Application/json; Charset=UTF-8",
        "Authorization": "Bearer ${LocalStorageController().getStoredInfo()["token"].toString()}"
      },
    );
    var usersPerCityMap = jsonDecode(response.body);

    return usersPerCityMap;
  }

  static Future<Map<String, dynamic>> createAccount( Map<String, dynamic> body ) async {

    var adminCreatedMap;

    try {

      var response = await http.post( 
        Uri.parse(createAdmin),
        headers: {
          "Content-Type": "Application/json; Charset=UTF-8"
        },
        body: jsonEncode(body)
      );
      adminCreatedMap = jsonDecode(response.body);

      
      
    } on HttpException catch (error) {

      print("Network error: $error");

    } on FormatException catch ( error ) {

      print("Format exception: $error");
    } on Exception catch ( error ) {

      print("Exception: $error");
    }
    
    return adminCreatedMap;
  }
}