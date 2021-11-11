import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class SupportCenterCard extends StatelessWidget {
SupportCenterCard();

// final bool isEnabled;
// final String firstName;
// final String lastName;
// final String email;
// final _zformKey = GlobalKey<FormState>();

  supportCenterButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      // width: 100,
      child: MaterialButton(
        hoverElevation: 20.0,
        minWidth: 160,
        height:35,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.white,
        child: Text(
          "Ask Help from Agent",
          style: TextStyle(
            fontSize: 12,
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
      color: Colors.brown[300],
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
                  "aReclambord Support Center",                  
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.white),),                                    
              ],
            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Seeking for help?\nContact an agent for any help here.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12,
                  color: Colors.white),),              
              ],
            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                supportCenterButton(),                 
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