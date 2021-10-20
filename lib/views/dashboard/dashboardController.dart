import 'dart:io';
import 'dart:js_util';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/globalContext.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';

import 'package:provider/provider.dart';
class DashboardController {

  DashboardController();

  numberOfUsers() async{
    
    var response;
    try {
      response = await ApiServices.getAllUsers();
      Provider.of<AppModel>(GlobalContext.navigatorKey.currentContext!, listen: false).updateNumberOfUsers( response["counts"]);
      Provider.of<AppModel>(GlobalContext.navigatorKey.currentContext!, listen: false).updateCurrentUserUI( response );
      
    } on SocketException {

      print('No Internet connection 😑');
    } on HttpException {
      
      print("Couldn't find the post 😱");

    } on FormatException {
      print("Bad response format 👎");

    }
    
    return response;
  }

  getUsersPerCity() async{
    var response;
    
    try {
      response = await ApiServices.getUsersPerCity();
      Provider.of<AppModel>(GlobalContext.navigatorKey.currentContext!, listen: false).updateUsersPerCities( response["usersPerCity"]);
      
    } on SocketException {

      print('No Internet connection 😑');
    } on HttpException {
      
      print("Couldn't find the post 😱");

    } on FormatException {
      print("Bad response format 👎");

    }

    return response;
  }

  generatingPieChartSection ( AppModel model, TextStyle textStyle ) {

    List<PieChartSectionData>? pieChartSectionsData;

    // Generate a list of PieChartSection
    pieChartSectionsData = List<PieChartSectionData>.generate(model.getUsersPerCities().length, (index) {

      return PieChartSectionData(
        value: model.getUsersPerCities()[index]["count"], // The number of users in a city as circle length
        color: model.getChartSectionColors()[index], // Color to differentiate each city
        title: model.getUsersPerCities()[index]["count"].toString(), // Displaying the sum of users per city
        titleStyle: textStyle,
        radius: 35
      );

    });

    return pieChartSectionsData;
  }
}