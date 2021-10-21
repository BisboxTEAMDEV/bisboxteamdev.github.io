import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/sideBar.dart';
import 'package:giz_admin_dashboard/views/dashboard/dashboard.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if ( Responsive.isDesktop(context))
              Expanded(
                child: SideBar(),
              ),

            Expanded(

              flex: 5,
              child: Dashboard()
            )
          ],
        ),
      ),
    );
  }
}

