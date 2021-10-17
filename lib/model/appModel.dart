import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';
import 'package:provider/provider.dart';

class AppModel extends ChangeNotifier {

  
  int? _numberOfUsers;
  final StreamController<Map<String, dynamic>> _currentUsersStreamCtrl = StreamController.broadcast(); // An object listener that listen to any change
  Stream<Map<String, dynamic>> get onCurrentUsersChanged => _currentUsersStreamCtrl.stream; // Getting the value of the listener Object
  void updateCurrentUserUI( newValue ) => _currentUsersStreamCtrl.sink.add( newValue ); // Update the value of the listener

  getNumberOfUsers() => _numberOfUsers;

  updateNumberOfUsers( newValue ) {

    _numberOfUsers = newValue;
    notifyListeners();
  }


}