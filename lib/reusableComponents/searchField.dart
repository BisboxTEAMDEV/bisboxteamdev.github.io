import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        suffixIcon: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
              horizontal: 8
            ),
            decoration: BoxDecoration(
              color: sblueColor,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: SvgPicture.asset("assets/fi-br-search.svg")
          ),
        )
      ),
    );
  }
}