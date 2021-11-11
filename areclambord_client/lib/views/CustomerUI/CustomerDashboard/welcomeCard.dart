import 'package:areclambord_client/Commons/constants.dart';
import 'package:areclambord_client/views/AuthenticationUI/login.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class WelcomeCard extends StatelessWidget {
WelcomeCard(this.firstName, this.lastName, this.email);

// final bool isEnabled;
final String firstName;
final String lastName;
final String email;
final _zformKey = GlobalKey<FormState>();

logOutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      // width: 100,
      child: MaterialButton(
        // hoverElevation: 20.0,
        minWidth: 110,
        height:40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.blueGrey[800],
        child: Text(
          "Logout",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white 
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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);               
        }
      ),
    );
  }

  viewProfileButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      // width: 100,
      child: MaterialButton(
        // hoverElevation: 20.0,
        minWidth: 110,
        height:40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.blueGrey[800],
        child: Text(
          "Account",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white 
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


  // changeSubscriptionButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: MaterialButton(
  //       hoverElevation: 40.0,        
  //       minWidth: double.infinity,
  //       height: 60,  
  //       elevation: 5,      
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(70.0)
  //       ),
  //       color: isEnabled == true ? Colors.red[400] : disabledColor,
  //       child: Text(
  //         "Change the Subscription of the Campaign",
  //         style: TextStyle(
  //           fontSize: 15.0,
  //           color: Colors.white 
  //         ),
  //       ),
  //       onPressed: (){
  //         // if (_formKey.currentState.validate()) {
  //         //   //addMall();
            
  //         // }
  //         // Navigator.push(
  //         //   context,
  //         //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
  //         //   MaterialPageRoute(builder: (context) => PromotersDetails(),
  //         // );                
  //       }
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 30 ,
      // child: SingleChildScrollView( 
      //elevation: 10.0,
        child: Padding(                
          //padding: EdgeInsets.all(5.0),
        padding: EdgeInsets.only(top:10.0, bottom: 10, left: 15, right: 15),
        child: Column(                     
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome Buyer to aReclambord",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,
                  color: Colors.orange[600]),),                  
                  SizedBox(width: 580,),
                  logOutButton(context),
                  SizedBox(width: 10,),
                  viewProfileButton(),                  
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                "Name of the Customer:",
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(width: 8,),
                Text(
                firstName + " " + lastName,
                style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),),
                SizedBox(width: 100,),                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                "Email of the Customer:",
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(width: 8,),
                Text(
                email,
                style: TextStyle(fontSize: 16, color: Colors.white, fontStyle: FontStyle.italic),),                 
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