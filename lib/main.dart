import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/views/mainPage/mainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => AppModel())
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
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: MainPage(),
    );
  }
}
