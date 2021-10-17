import 'package:flutter/material.dart';
import 'package:giz_admin_dashboard/model/appModel.dart';
import 'package:giz_admin_dashboard/reusableComponents/constants.dart';
import 'package:provider/provider.dart';

class DisplayUsers extends StatelessWidget {
  Stream<Map<String, dynamic>>? listenableStream;
  VoidCallback? refresh;
  double width;

  DisplayUsers({
    Key? key,
    required this.listenableStream,
    required this.width,
    this.refresh
    
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
                    print(snapshot.error);
                    return const Text('Error');
          
                  } else if (snapshot.hasData) {

                    return DataTable(
                      horizontalMargin: 0,
                      columnSpacing: 16.0,
                      columns: [
                        tableHeader( "Full name" ),
                        tableHeader( "Phone number" ),
                        tableHeader( "Age group" ),
                        tableHeader( "Locality" ),
                        tableHeader( "Country" ),
                      ], 
                      rows: List.generate(
                        snapshot.data!["counts"], 
                        (index) => usersInfo(snapshot.data!["users"][index]))
                    );
          
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


  DataColumn tableHeader( String? title ) {
    return DataColumn(
      label: Text(
        title!,
        style: TextStyle(
          fontSize: 21,
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