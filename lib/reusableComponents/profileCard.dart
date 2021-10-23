import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12
      ),
      decoration: BoxDecoration(
        color: sblueColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/relaxed.png",
            height: 24,
          ),
          if ( !Responsive.isMobile(context) )
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8
              ),
              child: Text(
                "Smiley",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
              ),
            ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

