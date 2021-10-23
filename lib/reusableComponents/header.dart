import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:giz_admin_dashboard/reusableComponents/profileCard.dart';
import 'package:giz_admin_dashboard/reusableComponents/searchField.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if ( !Responsive.isDesktop(context) ) 
          IconButton(
            onPressed: (){
              Provider.of<AppModel>(context, listen: false).controlMenu();
            }, 
            icon: Icon(Icons.menu)
          ),
        
        if ( !Responsive.isMobile(context) )
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),

        if ( !Responsive.isMobile(context) )
          Spacer( flex: Responsive.isDesktop(context) ? 2 : 1,),

        Expanded(

          child: SearchField(),
        ),
        ProfileCard()
      ],
    );
  }
}

