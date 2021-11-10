import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class CreateAccountModel extends ChangeNotifier {

 
  bool? _loading = false;

  getLoading() => _loading;

  updateLoading( newValue ) {

    _loading = newValue;
    notifyListeners();
  }
}