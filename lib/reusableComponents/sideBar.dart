import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
    
          DrawerHeader(
            child: Text("Hi")
          ),
    
          DrawerListTiles(
            title: "Dashboard",
            imageLink: "Icon",
            onTap: (){},
          )
        ],
      ),
    );
  }
}

class DrawerListTiles extends StatelessWidget {

  final String title, imageLink;
  final VoidCallback onTap;

  const DrawerListTiles({
    required this.title,
    required this.imageLink,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: blueColor,
      onTap: onTap,
      horizontalTitleGap: 0.0,
      leading: Text(imageLink),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white54
        ),
      ),
    );
  }
}