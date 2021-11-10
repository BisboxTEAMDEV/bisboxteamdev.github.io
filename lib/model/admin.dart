import 'package:hive/hive.dart';

part 'admin.g.dart';

@HiveType(typeId: 0)
class Admin extends HiveObject{

  @HiveField(0)
  late String fullname;

  @HiveField(1)
  late String phone;

  @HiveField(2)
  late DateTime dateCreated;
  
  @HiveField(3)
  late String token;

  Admin();

    /// Getting the value of the keys
  Admin.fromMap(Map adminrMap) {
    this.fullname = adminrMap["fullname"];
    this.phone = adminrMap["phone"];
    this.dateCreated = adminrMap["dateCreated"];
    this.token = adminrMap["token"];
  }

   /// Convert data gotten to Map object 
  Map<String, dynamic> toMap(Admin admin) {
    Map<String, dynamic> adminMap = Map();
    adminMap["fullname"] = admin.fullname;
    adminMap["phone"] = admin.phone;
    adminMap["dateCreated"] = admin.dateCreated;
    adminMap["token"] = admin.token;
    
    return adminMap;
  }
}