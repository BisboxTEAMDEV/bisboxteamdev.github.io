import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),

        Spacer( flex: 2,),

        Expanded(

          child: SearchField(),
        ),
        ProfileCard()
      ],
    );
  }
}

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
        vertical: 16 / 2
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.white10
        )
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/relaxed.png",
            height: 38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 / 2
            ),
            child: Text("Smiley"),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        suffixIcon: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(16 * 0.75),
            margin: EdgeInsets.symmetric(
              horizontal: 16 / 2
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(8 ))
            ),
            child: SvgPicture.asset("assets/fi-br-search.svg")
          ),
        )
      ),
    );
  }
}