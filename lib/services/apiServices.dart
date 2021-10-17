import 'dart:convert';

import 'package:giz_admin_dashboard/reusableComponents/apiEndPoints.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static Future<Map<String, dynamic>> getAllUsers() async {

    var response = await http.get( 
      Uri.parse(allUsers),
      headers: {
        "Content-Type": "Application/json; Charset=UTF-8"
      },
    );
    var allUsersMap = jsonDecode(response.body);

    return allUsersMap;
  }
}