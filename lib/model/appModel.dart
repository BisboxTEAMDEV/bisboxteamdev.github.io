import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class AppModel extends ChangeNotifier {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int? _numberOfUsers = 0;
  bool? _dashboardSelected = true;
  bool? _loading;
  List? _userPerCities;
  List<Color>? _chartSectionColors = [
    blueColor,
    redColor,
    greenColor,
    yellowColor,
    Colors.purple
  ];

  final StreamController<Map<String, dynamic>> _currentUsersStreamCtrl = StreamController.broadcast(); // An object listener that listen to any change
  Stream<Map<String, dynamic>> get onCurrentUsersChanged => _currentUsersStreamCtrl.stream; // Getting the value of the listener Object
  void updateCurrentUserUI( newValue ) { _currentUsersStreamCtrl.sink.add( newValue ); notifyListeners();} // Update the value of the listener
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  getNumberOfUsers() => _numberOfUsers;
  getDashboardSelected() => _dashboardSelected;
  getLoading() => _loading;
  getUsersPerCities() => _userPerCities;
  getChartSectionColors() => _chartSectionColors;

  controlMenu() {
    if ( !_scaffoldKey.currentState!.isDrawerOpen ){

      _scaffoldKey.currentState!.openDrawer();
    }
  }
  updateUsersPerCities( newValue ) {

    _userPerCities = newValue;
    notifyListeners();
  }
  updateLoading( newValue ) {

    _loading = newValue;
    notifyListeners();
  }
  updateNumberOfUsers( newValue ) {

    _numberOfUsers = newValue;
    notifyListeners();
  }
  updateDashboardSelected( newValue ){

    _dashboardSelected = newValue;
    notifyListeners();
  }

  @override
  void dispose() {
    _currentUsersStreamCtrl.close();
    super.dispose();
  }
}