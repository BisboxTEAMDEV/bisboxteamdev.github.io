import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/model/user.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/displayUsers.dart';
import 'package:giz_admin_dashboard/reusableComponents/userWidget.dart';
import 'package:giz_admin_dashboard/reusableComponents/header.dart';
import 'package:giz_admin_dashboard/reusableComponents/infoCard.dart';
import 'package:giz_admin_dashboard/services/apiServices.dart';
import 'package:giz_admin_dashboard/reusableMethods/usersMethods.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // late UsersMethods usersMethods;
  
  Future<Map<String, dynamic>> numberOfUsers() async{
    print("NumberofUsers Stream");
    var response = await ApiServices.getAllUsers();
    Provider.of<AppModel>(context, listen: false).updateNumberOfUsers( response["counts"]);
    Provider.of<AppModel>(context, listen: false).updateCurrentUserUI( response );
    return response;
  }


  @override
  void initState() {
    super.initState();
    numberOfUsers();
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

                         await numberOfUsers();
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
                    height: 500,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                    ),
                    child: Column(
                      children: [
                        
                        Text(
                          "Number of users",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 32,),

                        Consumer<AppModel>(
                          builder: ( context, model, child ) {

                            return SizedBox(
                              height: 200,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      value: model.getNumberOfUsers() == null ? 1 : model.getNumberOfUsers(),
                                      color: redColor,
                                    )
                                  ]
                                )
                              ),
                            );
                          },
                        )
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