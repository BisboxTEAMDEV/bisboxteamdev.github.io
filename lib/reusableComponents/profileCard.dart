import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableMethods/localStorageController.dart';

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
          Icon(
            Icons.person,
            color: Colors.black,
          ),
          if ( !Responsive.isMobile(context) )
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8
              ),
              child: Text(
                LocalStorageController().getStoredInfo()["fullname"],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
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

