import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/infoCard.dart';
import 'package:provider/provider.dart';

class UserWidget extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const UserWidget({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: childAspectRatio
        ), 
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: InfoCard(totalUsers: Provider.of<AppModel>(context).getNumberOfUsers().toString()),
        )
      ),
    );
  }
}