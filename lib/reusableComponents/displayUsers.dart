import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:provider/provider.dart';

class DisplayUsers extends StatelessWidget {
  Stream<Map<String, dynamic>>? listenableStream;
  VoidCallback? refresh;
  double width;
  double tableHeaderFontSize;

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
                  fontWeight: FontWeight.w600
                ),
              ),

              ElevatedButton(
                onPressed: refresh, 
                child: Text(
                  "Refresh"
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
                      
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          horizontalMargin: 0,
                          columnSpacing: 16.0,
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
                        ),
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

  DataColumn tableTitle( columTitle ) {
    return DataColumn(
      label: Text(columTitle.toString())
    );
  }

  DataRow usersInfo( userInfo ) {
    return DataRow(
      cells: [
        DataCell(
          Text(userInfo["fullname"].toString())
        ),
        DataCell(
          Text(userInfo["phone"].toString())
        ),
        DataCell(
          Text(userInfo["gender"].toString())
        ),
        DataCell(
          Text(userInfo["ageGroup"].toString())
        ),
        DataCell(
          Text(userInfo["locality"].toString())
        ),
        DataCell(
          Text(userInfo["country"].toString())
        ),
      ]
    );
  }