import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/model/user.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/displayUsers.dart';
import 'package:giz_admin_dashboard/reusableComponents/userChart.dart';
import 'package:giz_admin_dashboard/reusableComponents/userWidget.dart';
import 'package:giz_admin_dashboard/reusableComponents/header.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';
import 'package:giz_admin_dashboard/views/dashboard/components/chartsSection.dart';
import 'package:giz_admin_dashboard/views/dashboard/dashboardController.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashboardController = DashboardController();
  
  


  @override
  void initState() {
    super.initState();
    dashboardController.numberOfUsers();
    dashboardController.getUsersPerCity();
  }

  @override
  Widget build(BuildContext context) {
    var appModel = Provider.of<AppModel>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(

          children: [
            Header(),
            SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Left side of dashboard
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: Responsive.isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Responsive(
                        desktop: UserWidget(
                          childAspectRatio: screenSize.width < 1400 ? 1 : 1.4,
                        ),
                        tablet: UserWidget(),
                        mobile: UserWidget(
                          crossAxisCount: screenSize.width < 650 ? 2 : 4,
                          childAspectRatio: screenSize.width < 650 ? 1 : 1,
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      DisplayUsers(
                        width: screenSize.width,
                        tableHeaderFontSize: Responsive.isTablet(context) ? 18 : Responsive.isMobile(context) ? 16 : 21,
                        listenableStream: appModel.onCurrentUsersChanged,
                        refresh: () async{

                         await dashboardController.numberOfUsers();
                         await dashboardController.getUsersPerCity();
                        },
                      ),

                      // On mobile display the chart section under the users section
                      if ( Responsive.isMobile(context))
                        SizedBox(
                          height: 16,
                        ),

                      if ( Responsive.isMobile(context))
                        ChartsSection(dashboardController: dashboardController)
                    ],
                  ),
                ),

                // On mobile remove the chart section on the left
                if ( !Responsive.isMobile(context))
                  SizedBox(
                    width: 16,
                  ),

                if ( !Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: ChartsSection(dashboardController: dashboardController),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
