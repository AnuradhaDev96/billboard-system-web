import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgressHeaderCard extends StatelessWidget {
ProgressHeaderCard();
// final String purchseIdToBeDeleted;
// final bool isEnabled;
final _zformKey = GlobalKey<FormState>();
// final _removeDialogScaffoldKey = GlobalKey<ScaffoldState>();

  
  

  backButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:4, bottom: 4, left: 10, right: 10),
      child: MaterialButton(
        hoverElevation: 20.0,        
        minWidth: 100,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.black,
        child: Text(
          "Back",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          Navigator.pop(context);
          // _manageMallDialog(context);
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
                    color: Colors.orange[200] ,
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
                          "Recommendations for your Advertisement",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                          color: Colors.orange[800]),),                  
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                  
                        Text("The system has evaluated the progress of your advertisement campaign.\n You may take necessary action below as recommended.",
                        textAlign: TextAlign.center,                        
                        style: TextStyle(
                          fontSize: 15,                          
                        color:Colors.orange[700]),)
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
                      key: _zformKey,
                      child: Column(                  
                        children: <Widget>[
                          // userName,
                          // password,                        
                          SizedBox(
                            height: 8.0,
                          ),
                          backButton(context)
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