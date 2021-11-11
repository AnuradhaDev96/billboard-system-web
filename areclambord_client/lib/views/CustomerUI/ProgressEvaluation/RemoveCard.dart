import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoveCard extends StatelessWidget {
RemoveCard(this.isEnabled, this.purchseIdToBeDeleted);
final String purchseIdToBeDeleted;
final bool isEnabled;
final _zformKey = GlobalKey<FormState>();
// final _removeDialogScaffoldKey = GlobalKey<ScaffoldState>();

  void _manageMallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(          
          backgroundColor: Colors.grey[850],
          elevation: 200,
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),          
          title: Text("Do you want to withdraw this purchase?"),
          // content: new Text(
          //   "You may edit or delete this shopping mall.",
          //   style: TextStyle(
          //     fontSize: 15.0
          //   ),
          // ),
          actions: <Widget>[
            new MaterialButton(
              // hoverElevation: 20.0, 
              minWidth: 50,
              height: 40,  
              elevation: 5 ,      
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.grey[300],
              child: Text(
                "No",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black 
                ),
              ),
              onPressed: (){
                  Navigator.pop(context);               
              }
            ),
            new MaterialButton(
              // hoverElevation: 20.0, 
              minWidth: 50,
              height: 40,  
              elevation: 5 ,      
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.red[400],
              child: Text(
                "Yes",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black 
                ),
              ),
              onPressed: (){
                  deletePurchaseById(context).then((value) {
                    int count = 0;
                    Navigator.popUntil(context, (route){
                      return count++ == 2;
                    });
                  });              
              }
            ),
            // new ElevatedButton(
            //   child: new Text(
            //     "Yes",
            //     style: TextStyle(
            //       color: Colors.white
            //     ),
            //   ),
            //   onPressed: () {
            //     // Navigator.push(
            //     // context,
            //     // MaterialPageRoute(builder: (context) => AdminEditMall(mall: mall)),
            //     // );
            //     deletePurchaseById(context);
            //   },
            // ),
            // new ElevatedButton(
            //   child: new Text(
            //     "No",
            //     style: TextStyle(
            //       color: Colors.white
            //     ),
            //   ),
            //   onPressed: () {
            //     // Navigator.push(
            //     // context,
            //     // MaterialPageRoute(builder: (context) => AdminEditMall(mall: mall)),
            //     // );
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        );
      },
    );
  }

  Future<void> deletePurchaseById(BuildContext context) async {
    // setState(() {
    //       isDetailsLoading = true;
    //     });
    // print(billboardId);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/delete-purchase/$purchseIdToBeDeleted/');
    // var url1;
    var response = await http.get(
      url,
      headers: {        
        "X-CSRFToken": x_csrfToken
      },
    );
    if (response.statusCode == 204){
        // var returnBody = jsonDecode(response.body);

        final snackBar = SnackBar(
        duration: Duration(milliseconds: 2500),
        content: Text("Deleted Successfully"),
        backgroundColor: Colors.red[800]
        );
        
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
        
        // _removeDialogScaffoldKey.currentState.showSnackBar(SnackBar(
        // content: Text("Deleted Successfully"),
        // backgroundColor: Colors.red[800]
        // )).closed.then((value) {
        //   int count = 0; 
        // Navigator.popUntil(context, (route) {
        //     return count++ == 2;
        // });
        // });

        // setState(() {
        //     isLoading = true;
        //     refreshList();
        //   });        
        // print(billboardVacancyResponse.id);
      }
  }

  changeSubscriptionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        hoverElevation: 40.0,        
        minWidth: double.infinity,
        height: 60,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: isEnabled == true ? Colors.red[400] : disabledColor,
        child: Text(
          "Withdraw the Advertisement Purchase",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          _manageMallDialog(context);
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
                    color: isEnabled == true ? Colors.red[200] : Colors.grey[200],
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
                          "Remove the Advertisement",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                          color: isEnabled == true ? Colors.red[800] : Colors.grey[700]),),                  
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                  
                        Text("The reach of the advertisement is very low.\nWe recommend you to remove this billboard and setup a new campaign.",
                        textAlign: TextAlign.center,                        
                        style: TextStyle(
                          fontSize: 15,                          
                        color:isEnabled == true ? Colors.red[800] : Colors.grey[700]),)
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
                          isEnabled == true ? changeSubscriptionButton(context)
                          : Text("No action is allowed",
                        style: TextStyle(
                          fontSize: 15,
                        color: Colors.grey[700]),),
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