import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/model/user.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/displayUsers.dart';
import 'package:giz_admin_dashboard/reusableComponents/userChart.dart';
import 'package:giz_admin_dashboard/reusableComponents/userWidget.dart';
import 'package:giz_admin_dashboard/reusableComponents/header.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserWidget(),
                      SizedBox(
                        height: 16,
                      ),
                      DisplayUsers(
                        width: screenSize.width,
                        listenableStream: appModel.onCurrentUsersChanged,
                        refresh: () async{

                         await dashboardController.numberOfUsers();
                         await dashboardController.getUsersPerCity();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // height: 500,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                    ),
                    child: Column(
                      children: [
                        Consumer<AppModel>(
                          builder: ( context, model, child ) {

                            // Verifying if the cities is not yet gotten
                            if ( model.getUsersPerCities() == null ) {

                              return CircularProgressIndicator();
                            } else {

                              // Generate a list of PieChartSection
                              var generatedPieChartSection = dashboardController.generatingPieChartSection( model, chartSectionTitleStyle );

                              // Display a pie charts of users information
                              return UserChart(pieChartSectionsData: generatedPieChartSection);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}