import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class VendorImageCard extends StatelessWidget {
VendorImageCard();

// final bool isEnabled;
// final String firstName;
// final String lastName;
// final String email;
// final _zformKey = GlobalKey<FormState>();

  viewVendorBillboardsButton() {
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
          "View Billboards",
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
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
          //   MaterialPageRoute(builder: (context) => PromotersDetails(),
          // );                
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      // elevation: 30 ,
      // child: SingleChildScrollView( 
      //elevation: 10.0,
        child: Padding(                
          //padding: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(0),
        child: Column(                     
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 149.99,
                    width: 430.0,
                    child: Image.asset(
                    "assets/vendorDashboardImg.jpg",
                    fit: BoxFit.fill,
                    // height: 140.0,
                    // width: 420.0,
                  ),)
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