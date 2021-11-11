import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

// import '../vacancyListView.dart';

class ScheduleDetailsCard extends StatelessWidget {
ScheduleDetailsCard(this.taskName, this.taskDate);

// final bool isEnabled;
final String taskName;
String taskDate;
final _zformKey = GlobalKey<FormState>();


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
    return Padding(
                  padding: EdgeInsets.only(top:5.0, bottom: 5.0, left: 320.0, right: 320.0),
                  child: Card(
                    color: Colors.grey[200],
                    elevation: 10 ,
                    // child: SingleChildScrollView( 
                    //elevation: 10.0,
                child: Padding(                
                  //padding: EdgeInsets.all(5.0),
                padding: EdgeInsets.only(top:20.0, bottom: 20.0, left: 50.0, right: 50.0),
                child: Column(                     
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          taskName,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.black),),                  
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Text(
                          "Scheduled Date: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.red[900]),),                 
                        Text(taskDate,
                        textAlign: TextAlign.center,                        
                        style: TextStyle(
                          fontSize: 18,                          
                        color:Colors.red[900]),)
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
                    // Padding(
                    //   padding: EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                    //   child: Form(
                    //   key: _zformKey,
                    //   child: Column(                  
                    //     children: <Widget>[
                    //       // userName,
                    //       // password,                        
                    //       SizedBox(
                    //         height: 15.0,
                    //       ),
                    //       isEnabled == true ? changeSubscriptionButton()
                    //       : Text("No action is allowed",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //     color: Colors.grey[700]),),
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