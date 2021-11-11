import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

class PublishedBillsHeaderCard extends StatelessWidget {
  PublishedBillsHeaderCard(this.mainContext);

BuildContext mainContext;

final _zsformKey = GlobalKey<FormState>();


  backToHomeButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8, bottom: 8, left: 10, right: 10),
      child: MaterialButton(
        hoverElevation: 20.0, 
        minWidth: 200,
        height: 40,  
        elevation: 5 ,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.black,
        child: Text(
          "Back to Home",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            Navigator.pop(context);
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
    return Padding(
      padding: EdgeInsets.only(top:10.0, bottom: 10.0, left: 320.0, right: 320.0),
      child: Card(
        color: Colors.orange[200],
        elevation: 10,
        // child: SingleChildScrollView( 
        //elevation: 10.0,
    child: Padding(                
      //padding: EdgeInsets.all(5.0),
    padding: EdgeInsets.only(top:10.0, bottom: 10.0, left: 50.0, right: 50.0),
    child: Column(                     
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "My Published Billboards",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, 
              color: Colors.orange[800]),),                  
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [                  
            Text("Billboards published by logged in user can be viewd here.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            color: Colors.orange[700]),)
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
          child: Column(                  
            children: <Widget>[
              // userName,
              // password,                        
              SizedBox(
                height: 8.0,
              ),
              backToHomeButton(mainContext),
              SizedBox(
                height: 8.0,
              ),
            ],
          )
          ),
        
        ],
)
    )
    // ),
    ),
      
    );
  }
  
}