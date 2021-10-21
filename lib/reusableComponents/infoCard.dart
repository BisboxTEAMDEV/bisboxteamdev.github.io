import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class InfoCard extends StatelessWidget {
  late String? totalUsers;

  InfoCard({
    Key? key,
    required this.totalUsers
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Icon(
                Icons.person,
                color: Colors.black45,
              ),
            ),
          ],
        ),

        Text(
          "Users",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),

        Text(
          "Total users: ${totalUsers == "null" ? "..." : totalUsers}",
          style: TextStyle(

            // fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}