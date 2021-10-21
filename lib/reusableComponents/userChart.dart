import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class UserChart extends StatelessWidget {
  const UserChart({
    Key? key,
    required this.pieChartSectionsData,
  }) : super(key: key);

  final List<PieChartSectionData> pieChartSectionsData;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var appModel = Provider.of<AppModel>(context, listen: false);

    return Row(
      mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [

        // Pie chart diagram and label
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Responsive(
              desktop: Chart(
                pieChartSectionsData: pieChartSectionsData,
              ),
              tablet: Chart(
                pieChartSectionsData: pieChartSectionsData,
                width: 120,
              ),
              mobile: Chart(
                pieChartSectionsData: pieChartSectionsData
              ),
            ),

            SizedBox(
              height: 8.0,
            ),

            Text(
              "Users per city",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            )
          ],
        ),

        SizedBox(
          width: 8.0,
        ),

        // Cities and colors
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(appModel.getUsersPerCities().length, (index) {

            return Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: appModel.getChartSectionColors()[index],
                ),

                SizedBox(
                  width: 8.0,
                ),

                Text(
                  appModel.getUsersPerCities()[index]["_id"],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            );

          }),
        )
      ],
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    this.centerSpaceRadius = 30,
    required this.pieChartSectionsData, 
    this.height = 130, 
    this.width = 150,
  }) : super(key: key);

  final double centerSpaceRadius;
  final List<PieChartSectionData> pieChartSectionsData;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: PieChart(
        PieChartData(
          startDegreeOffset: -90,
          sectionsSpace: 0,
          centerSpaceRadius: centerSpaceRadius,
          sections: pieChartSectionsData
        )
      ),
    );
  }
}