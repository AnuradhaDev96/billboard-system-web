import 'package:areclambord_client/Commons/constants.dart';
import 'package:areclambord_client/views/VendorUI/OtherBillboardsByVendors/otherBillboarrdsList.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class OtherBillboardsByVendors extends StatelessWidget {
OtherBillboardsByVendors();

// final bool isEnabled;
// final String firstName;
// final String lastName;
// final String email;
// final _zformKey = GlobalKey<FormState>();

  viewOtherBillboardsBitton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      // width: 100,
      child: MaterialButton(
        hoverElevation: 20.0,
        minWidth: 250,
        height:40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[700],
        child: Text(
          "View available Billboards",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
            MaterialPageRoute(builder: (context) => OtherBillboardsList()),
          );              
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 30 ,
      // child: SingleChildScrollView( 
      //elevation: 10.0,
        child: Padding(                
          //padding: EdgeInsets.all(5.0),
        padding: EdgeInsets.only(top:15.0, bottom: 15, left: 15, right: 15),
        child: Column(                     
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "aReclambord Billboards",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                  color: Colors.orange[600]),),                                    
              ],
            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Billboards published by other vendors for sale",
                  style: TextStyle(fontSize: 15,
                  color: Colors.orange[300]),
                  textAlign: TextAlign.center,),              
              ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                viewOtherBillboardsBitton(context),                 
              ],
            ),                    
            ],
      )
        )
  // ),
  );
                  
                // );
  }
  
}