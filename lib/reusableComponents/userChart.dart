import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:provider/provider.dart';

class UserChart extends StatelessWidget {
  const UserChart({
    Key? key,
    required this.pieChartSectionsData,
  }) : super(key: key);

  final List<PieChartSectionData> pieChartSectionsData;

  @override
  Widget build(BuildContext context) {
    var appModel = Provider.of<AppModel>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // Pie chart diagram and label
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: PieChart(
                PieChartData(
                  startDegreeOffset: -90,
                  sectionsSpace: 0,
                  centerSpaceRadius: 50,
                  sections: pieChartSectionsData
                )
              ),
            ),

            Text(
              "Users per city",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: blueColor
              ),
            )
          ],
        ),

        SizedBox(
          width: 16.0,
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
                  width: 16.0,
                ),

                Text(
                  appModel.getUsersPerCities()[index]["_id"],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            );

          }),
        )
        
        // Row(
        //   children: [
        //     SizedBox.square(
        //       child: appModel.getUsersPerCities(),
        //     )
        //     Text(
        //       "Users per city",
        //       overflow: TextOverflow.ellipsis,
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w500
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}