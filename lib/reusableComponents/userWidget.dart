import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/infoCard.dart';
import 'package:provider/provider.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          childAspectRatio: 1.4
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