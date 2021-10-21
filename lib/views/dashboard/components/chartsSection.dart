
import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/userChart.dart';
import 'package:giz_admin_dashboard/views/dashboard/dashboardController.dart';
import 'package:provider/provider.dart';

class ChartsSection extends StatelessWidget {
  const ChartsSection({
    Key? key,
    required this.dashboardController,
  }) : super(key: key);

  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}