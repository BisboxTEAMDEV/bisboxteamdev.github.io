import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/responsive.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:provider/provider.dart';

class DisplayUsers extends StatelessWidget {
  Stream<Map<String, dynamic>>? listenableStream;
  VoidCallback? refresh;
  double width;
  double tableHeaderFontSize;
  ScrollController scrollController = ScrollController();

  DisplayUsers({
    Key? key,
    required this.listenableStream,
    required this.width,
    this.refresh,
    this.tableHeaderFontSize = 21.0,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appModel = Provider.of<AppModel>(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All users",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              ElevatedButton(
                onPressed: refresh,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(blueColor),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                  )
                ),
                child: Text(
                  "Refresh",
                  style: TextStyle(
                    color: Colors.black
                  ),
                )
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            width: width,
            child: StreamBuilder<Map<String, dynamic>>(
              stream: listenableStream,
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting) {
          
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 0.0),
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
          
                } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
          
                  if (snapshot.hasError) {
                    
                    return const Text('Error: ');
          
                  } else if (snapshot.hasData) {

                    if ( snapshot.data!["counts"] == 0 ) {

                      return Text( "No users" );

                    } else {

                      DataTable dataTable = DataTable(
                        horizontalMargin: 0,
                        columnSpacing: 16,
                        columns: [
                          tableHeader( "Full name", tableHeaderFontSize ),
                          tableHeader( "Phone number", tableHeaderFontSize ),
                          tableHeader( "Gender", tableHeaderFontSize ),
                          tableHeader( "Age group", tableHeaderFontSize ),
                          tableHeader( "Locality", tableHeaderFontSize ),
                          tableHeader( "Country", tableHeaderFontSize ),
                        ], 
                        rows: List.generate(
                          snapshot.data!["counts"], 
                          (index) => usersInfo(snapshot.data!["users"][index]))
                      );
                      
                      return Responsive(
                        mobile: SingleChildScrollView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          child: dataTable
                        ),

                        desktop: dataTable
                      );
                    }
          
                  } else {
          
                    return const Text('Empty data');
                  }
                } else {
                  
                  return Text('State: ${snapshot.connectionState}');
                }
              }
            )
              
          ),
        ],
      ),
    );
  }
}


  DataColumn tableHeader( String? title, double fontSize ) {
    return DataColumn(
      label: Text(
        title!,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontSize,
          color: blueColor,
          fontWeight: FontWeight.w500
        ),
      )
    );
  }

  DataRow usersInfo( userInfo ) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            userInfo["fullname"].toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
        DataCell(
          Text(
            userInfo["phone"].toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
        DataCell(
          Text(
            userInfo["gender"].toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
        DataCell(
          Text(
            userInfo["ageGroup"].toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
        DataCell(
          Text(
            userInfo["locality"].toString(),  
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
        DataCell(
          Text(
            userInfo["country"].toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
      ]
    );
  }