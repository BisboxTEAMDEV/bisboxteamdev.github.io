import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  
  SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(32.0)
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0
            ),
            children: [
        
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                )
              ),
        
              Consumer<AppModel>(
                builder: (context, model, child) {
      
                  return DrawerListTiles(
                    title: "Dashboard",
                    imageLink: "assets/fi-br-apps.svg",
                    onTap: (){},
                    selected: model.getDashboardSelected(),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTiles extends StatelessWidget {

  final String title, imageLink;
  final VoidCallback onTap;
  final bool selected;

  const DrawerListTiles({
    required this.title,
    required this.imageLink,
    required this.onTap,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: redColor,
      selected: selected,
      onTap: onTap,
      horizontalTitleGap: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      leading: SvgPicture.asset(
        imageLink,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 16
        ),
      ),
    );
  }
}