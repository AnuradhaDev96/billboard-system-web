import 'package:areclambord_client/Commons/constants.dart';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
import 'package:areclambord_client/views/CustomerUI/ProgressEvaluation/evaluateAdProgress.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class SelectedBillDetailsCard extends StatelessWidget {
  SelectedBillDetailsCard(this.billboardVacancyResponse);

final BillboardVacancyResponse billboardVacancyResponse;
// static String title, description, longitude, latitude, type = "-";   

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(1),
          child: Card(
            color: Colors.white,
            elevation: 6,
            // child: SingleChildScrollView( 
            //elevation: 10.0,
        child: Padding(                
          //padding: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(20),
        child: Column(                     
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Selected Billboard Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),                  
              ],
            ),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[                  
                Text("Title:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color:Colors.grey[700]),),
                Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.title,
                style: TextStyle(
                  fontSize: 14,
                color:Colors.grey[700]),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Description:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color:Colors.grey[700]),),
                Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.description,
                style: TextStyle(
                  fontSize: 14,
                color:Colors.grey[700]),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Latitude:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color:Colors.grey[700]),),
                Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.latitude,
                style: TextStyle(
                  fontSize: 14,
                color:Colors.grey[700]),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Longitude:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color:Colors.grey[700]),),
                Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.longitude,
                style: TextStyle(
                  fontSize: 14,
                color:Colors.grey[700]),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Billboard Type:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                color:Colors.grey[700]),),
                Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.type,
                style: TextStyle(
                  fontSize: 14,
                color:Colors.grey[700]),)
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
            //   child: Form(
            //   key: _zsformKey,
            //   child: Column(                  
            //     children: <Widget>[
            //       // userName,
            //       // password,                        
            //       SizedBox(
            //         height: 15.0,
            //       ),
            //       billboardVacancyResponse == null 
            //       ? Text(
            //       "Select a purchased billboard to view details",
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) 
            //       : evaluateBillboardProgressButton(),
            //       // SizedBox(
            //       //   height: 30.0,
            //       // ),
            //     //   Row(
            //     //     mainAxisAlignment: MainAxisAlignment.center,
            //     // children: <Widget>[
            //     //   Text("Don't have an account?", style: TextStyle(
            //     //     fontWeight: FontWeight.w600,
            //     //     fontSize: 18,

            //     //   ),)
            //     // ],
            //     //   ),
            //       SizedBox(
            //         height: 10.0,
            //       ),
            //       // signUpScreenButton(),
            //     ],
            //   )
            //   ),
            //   ),
            
            ],
)
        )
        // ),
        ),
          
        );
  }
  
}