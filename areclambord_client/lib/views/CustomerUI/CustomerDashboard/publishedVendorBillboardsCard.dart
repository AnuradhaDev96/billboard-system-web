import 'package:areclambord_client/Commons/constants.dart';
import 'package:areclambord_client/views/CustomerUI/PurchasedBillboards/purchasedBillboardList.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class PurchasedBillboardsByCustomerCard extends StatelessWidget {
PurchasedBillboardsByCustomerCard(this.localId);
final String localId;

// final bool isEnabled;
// final String firstName;
// final String lastName;
// final String email;
// final _zformKey = GlobalKey<FormState>();

  viewPurchasedBillboardsButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      // width: 100,
      child: MaterialButton(
        // hoverElevation: 20.0,
        minWidth: 160,
        height:40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.white,
        child: Text(
          "View Purchased Billboards",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold 
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
            MaterialPageRoute(builder: (context) => PurchasedBillboardsByCustomer(localId: localId,)),
          );             
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[400],
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
                  "My Purchased Billboards",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                  color: Colors.white),),                                    
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You can view your purchased billboards here.\nDetails, progress and the schedules of each purchase can be viewed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,
                  color: Colors.white),),              
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                viewPurchasedBillboardsButton(context),                 
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