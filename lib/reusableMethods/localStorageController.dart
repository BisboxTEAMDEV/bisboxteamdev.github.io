import 'package:giz_admin_dashboard/model/admin.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageController {

  saveAdminInfo( Admin admin ) {

    Box adminBox = Hive.box<Admin>("admins"); // Opening box

    adminBox.add(admin); // Saving admin

  }

  deleteAdminInfo( Admin admin ) {

    admin.delete(); // Saving admin

    getStoredInfo();

  }

  getStoredInfo(){
    var adminStoredMap;

    Box adminBox = Hive.box<Admin>("admins"); // Opening box

    var adminStored = adminBox.get(0);

    adminStoredMap = Admin().toMap(adminStored);
    return adminStoredMap;

  }

  isLogged() {

    Box adminBox = Hive.box<Admin>("admins");

    var adminStored = adminBox.get(0);

    return adminStored;
  }
}