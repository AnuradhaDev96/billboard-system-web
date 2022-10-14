import 'dart:convert';

import 'package:areclambord_client/Commons/bounceInCenterPageRoute.dart';
import 'package:areclambord_client/Models/SessionLoggedInUser.dart';
import 'package:areclambord_client/Models/loginCredentialsModel.dart';
import 'package:areclambord_client/views/CustomerUI/CustomerDashboard/dashboardCustomer.dart';
import 'package:areclambord_client/views/CustomerUI/ProgressEvaluation/evaluateAdProgress.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
import 'package:areclambord_client/views/CustomerUI/PurchasedBillboards/purchasedBillboardList.dart';
import 'package:areclambord_client/views/CustomerUI/SupportCenter/submitTicket.dart';
// import 'package:areclambord_client/views/CustomerUI/vacancyListView.dart';
import 'package:areclambord_client/views/VendorUI/createBillboardVacancy.dart';
import 'package:areclambord_client/views/VendorUI/VendorDashboard/dashboardVendor.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'package:http/http.dart' as http;
import '../../Commons/constants.dart';

//steppers
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  // final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //login controllers
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  
  static bool isLoggingInChecking = false;

  final userName = TextFormField(
        controller: userNameController,
        decoration: const InputDecoration(
          labelText: "Email", hintText: "example@gmail.com"
        ),
        validator: (value){
          if (value!.isEmpty){
            return 'Username cannot be empty!';
          }
          return null;
        },
      );

  final password = TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: "Password", hintText: "Enter password"
      ),
      validator: (value){
        if (value!.isEmpty){
          return 'Password cannot be empty!';
        }
        return null;          
      },
    );

  signInButton() {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Login",
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();

          // }
          // logInUserByCredentials();
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
            MaterialPageRoute(builder: (context) => const SubmitTicketScreen()),
            // MaterialPageRoute(builder: (context) => PromotersDetails()),
            // MaterialPageRoute(builder: (context) => PurchasedBillboardsByCustomer()),
          );
        }
      ),
    );
  }

  logInUserByCredentials() async {
    setState(() {
          isLoggingInChecking = true;
    });
    String mokEmail = "colmcgrath980@gmail.com";
    String mokPassword = "admin12345";

    String mokCustomerEmail = "sandaruwang.info@gmail.com";
    String mokCustomerPassword = "admin_z";
    // LoginCredentialsModel credentials = LoginCredentialsModel(email: userName.controller!.text, password: password.controller!.text);
    LoginCredentialsModel credentials = LoginCredentialsModel(email: mokEmail, password: mokPassword);


    var url = Uri.parse(aReclamboardApiUrl + 'api/user/signin/');
    var body = jsonEncode(credentials.toMap());
    print(body);
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": x_csrfToken
      },
      body: jsonEncode(credentials.toMap())
    );

    if (response.statusCode == 200) {

      var returnBody = jsonDecode(response.body);

      SessionLoggedInUser loggedUser = SessionLoggedInUser(email: returnBody['email'], localId: returnBody['localId'], firstName: returnBody['firstName'],
      lastName: returnBody['lastName'], type: returnBody['type']);

      setState(() {
          isLoggingInChecking = false;
      });
      // print(loggedUser.type);
      // _loginScaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text(returnBody['message']),
      //   backgroundColor: Colors.teal[900],
      //   ));

        // var access_token = returnBody['access_token'];
        // var loggenInUser = returnBody['logged_user'];
        // print(loggenInUser);
        if (loggedUser.type == "Vendor"){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DashboardVendorScreen(sessionLoggedInUser: loggedUser,)),
          // );
          Navigator.push(
            context,
            BounceInCenterPageRoute(widget: DashboardVendorScreen(sessionLoggedInUser: loggedUser))
          );
        }
        else{
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DashboardCustomerScreen(sessionLoggedInUser: loggedUser,)),
          // );
          Navigator.push(
            context,
            BounceInCenterPageRoute(widget: DashboardCustomerScreen(sessionLoggedInUser: loggedUser))
          );
        }
    }
    else if (response.statusCode == 404){
      setState(() {
          isLoggingInChecking = false;
      });

        final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: const Text("Username or password is Invalid."),
        backgroundColor: Colors.red[900]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // _loginScaffoldKey.currentState.setState(() {

      // });
    }
  }

  // Future<int> aReclambordSignIn(String username, String password){
  //   var url = Uri.parse(aReclamboardApiUrl + 'api/user/signIn')
  //   var response = await http.post(

  //   );
  // }

  signUpScreenButton() {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white
          ),
        ),
        onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
        }
      ),
    );
  }

  void _manageMallDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.grey[300],
          elevation: 200,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            color: Colors.indigo[600]
          ),
          title: Text(title),
          // content: new Text(
          //   "You may edit or delete this shopping mall.",
          //   style: TextStyle(
          //     fontSize: 15.0
          //   ),
          // ),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text(
                "OK",
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => AdminEditMall(mall: mall)),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _loginScaffoldKey,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:30.0, bottom: 30.0, left: 10.0, right: 10.0),
            child: Card(
              elevation: 10.0,
              child: SingleChildScrollView(
              //elevation: 10.0,
          child: Padding(
            //padding: EdgeInsets.all(5.0),
          padding: const EdgeInsets.only(top:30.0, bottom: 20.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Login",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  Text("Login to your aReclambord account",
                  style: TextStyle(
                    fontSize: 15,
                  color:Colors.grey[700]),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    width: 200.0,
                    child: Image.asset(
                    "assets/signIn.jpg",
                    height: 100.0,
                    width: 200.0,
                  ),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                child: Form(
                key: _formKey,
                child: Column(                  
                  children: <Widget>[
                    userName,
                    password,                        
                    const SizedBox(
                      height: 15.0,
                    ),
                    isLoggingInChecking
                    ? const Center(
                    child: CircularProgressIndicator(),
                    )
                    :
                    signInButton(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,

                    ),)
                  ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),                     
                    signUpScreenButton(),
                  ],
                )
                ),
                ),
              
              ],
        )
          )
          ),),
            
          ),             
          
        ]
        
      ),
    );
  }    
    
}
