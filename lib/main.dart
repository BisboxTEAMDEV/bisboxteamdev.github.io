import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/admin.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/globalContext.dart';
import 'package:giz_admin_dashboard/reusableMethods/localStorageController.dart';
import 'package:giz_admin_dashboard/views/createAccount/createAccount.dart';
import 'package:giz_admin_dashboard/views/createAccount/createAccountModel.dart';
import 'package:giz_admin_dashboard/views/mainPage/mainPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(AdminAdapter());
  await Hive.openBox<Admin>("admins");

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => AppModel()),
        ChangeNotifierProvider(create: (context) => CreateAccountModel())
      ],
      child: MyApp(),
    )
    
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalContext.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: sblueColor,
        scaffoldBackgroundColor: backgroundColor,
        splashColor: redColor,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
        // highlightColor: Colors.black87
      ),
      home: LocalStorageController().isLogged() != null ? MainPage() : CreateAccount(),
    );
  }
}
