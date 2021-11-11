import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

class ChangeSubscriptionCard extends StatelessWidget {
  ChangeSubscriptionCard(this.isEnabled);

final bool isEnabled;

final _zsformKey = GlobalKey<FormState>();


  removeBillboardButton() {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        hoverElevation: 40.0, 
        minWidth: double.infinity,
        height: 60,  
        elevation: 5 ,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.purple[400],
        child: Text(
          "Remove the Billboard for New Campaign",
          style: TextStyle(
            fontSize: 15.0,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.only(top:6.0, bottom: 6.0, left: 320.0, right: 320.0),
                  child: Card(
                    color: isEnabled == true ? Colors.purple[100] : Colors.grey[200],
                    elevation: isEnabled == true ? 25 : 10,
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
                          "Change the Subscription",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, 
                          color: isEnabled == true ? Colors.purple[800] : Colors.grey[700]),),                  
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                  
                        Text("The reach of the advertisement is moderate.\nHence we recommend you to change the subscription for better customer engagement",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        color: isEnabled == true ? Colors.purple[600] : Colors.grey[700]),)
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     // SizedBox(
                    //     //   height: 150.0,
                    //     //   width: 200.0,
                    //     //   child: Image.asset(
                    //     //   "assets/signIn.jpg",
                    //     //   height: 100.0,
                    //     //   width: 200.0,
                    //     // ),)
                    //   ],
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                      child: Form(
                      key: _zsformKey,
                      child: Column(                  
                        children: <Widget>[
                          // userName,
                          // password,                        
                          SizedBox(
                            height: 8.0,
                          ),
                          isEnabled == true ? removeBillboardButton() 
                          : Text("No action is allowed",
                        style: TextStyle(
                          fontSize: 15,
                        color: Colors.grey[700]),),
                        //   SizedBox(
                        //     height: 30.0,
                        //   ),
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        // children: <Widget>[
                        //   Text("Don't have an account?", style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //     fontSize: 18,

                        //   ),)
                        // ],
                        //   ),
                          // SizedBox(
                          //   height: 8.0,
                          // ),
                          // signUpScreenButton(),
                        ],
                      )
                      ),
                      ),
                    
                    ],
        )
                )
                // ),
                ),
                  
                );
  }
  
}