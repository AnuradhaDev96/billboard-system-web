import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../Models/aReclambordUser.dart';
import 'package:http/http.dart' as http;
import '../../Commons/constants.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  // final String title;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  //reg controllers
  static TextEditingController regFirstNameController = TextEditingController();
  static TextEditingController regLastNameController = TextEditingController();
  static TextEditingController regUserNameController = TextEditingController();
  static TextEditingController regPasswordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();

  late String selectedAccountType;
  List<String> aReclambordAccountType = <String>[
    'Customer',
    'Vendor'
  ];
  final _signUpScaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  late Future<HttpResponse> _registerUser;
  static bool isSignUpChecking = false;
  
  createUser() async {
    setState(() {
       isSignUpChecking = true;   
    });

    AReclamborUser newUser = AReclamborUser(email: regUserName.controller!.text, password: regPassword.controller!.text, 
                            firstName: regFirstName.controller!.text, lastName: regLastName.controller!.text, type: selectedAccountType );
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/signup/');  
    var body = jsonEncode(newUser.toMap());
    print(body);  
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": x_csrfToken,
        // "Accept": "application/json",
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Methods": "POST, OPTIONS",
        // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      },
      body: jsonEncode(newUser.toMap())
    );

    if (response.statusCode == 201) {
      setState(() {
          isSignUpChecking = false;    
      });
      var returnBody = jsonDecode(response.body);
      // print(response.body);

      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: Text(returnBody['message']),
        backgroundColor: Colors.teal[900]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
          Navigator.pop(context);
        });

      // _signUpScaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text("Account Created Successfully."),
      //   backgroundColor: Colors.teal[900]
      //   ));
    }
    else if (response.statusCode == 400){
      setState(() {
          isSignUpChecking = false;    
      });

      var returnBody = jsonDecode(response.body);
      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: Text(returnBody['message']),
        backgroundColor: Colors.red[900]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // _loginScaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text("Username or password is Invalid."),
      //   backgroundColor: Colors.red[900],        
      //   ));
    }

  }

  signUpButton() {
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
          if (_formKey.currentState!.validate()) {
            //addMall();
            createUser();
          }               
        }
      ),
    );
  }

  //reg variables  
    final regFirstName = TextFormField(
      controller: regFirstNameController,
      decoration: const InputDecoration(
        labelText: "First Name", hintText: "Enter first name"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'First name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final regLastName = TextFormField(
      controller: regLastNameController,
      decoration: const InputDecoration(
        labelText: "Last Name", hintText: "Enter last name"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'Last name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final regUserName = TextFormField(
        controller: regUserNameController,
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

  final regPassword = TextFormField(
      controller: regPasswordController,
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

  final regConfirmPassword = TextFormField(
      controller: confirmPasswordController,
      decoration: const InputDecoration(
        labelText: "Confirm Password", hintText: "Enter confirm password"
      ),
      validator: (value){
        if (value != regPasswordController.text){
            return 'Passwords does not match';
          }
        return null;          
      },
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _signUpScaffoldKey,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,        
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[ 
          Padding(
            padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 80.0, right: 80.0),
            child: Card(
              elevation: 10.0,
              child: SingleChildScrollView( 
              //elevation: 10.0,
          child: Padding(                
            //padding: EdgeInsets.all(5.0),
          padding: const EdgeInsets.only(top:20.0, bottom: 20.0, left: 30.0, right: 30.0),
          child: Column(                     
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Sign Up",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),                  
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  Text("Create your new aReclambord account",
                  style: TextStyle(
                    fontSize: 15,
                  color:Colors.grey[700]),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    width: 160.0,
                    child: Image.asset(
                    "assets/login.jpg",
                    fit: BoxFit.fill,
                    // height: 100.0,
                    // width: 200.0,
                  ),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                child: Form(
                key: _formKey,
                child: Column(                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,                  
                  children: <Widget>[                    
                    regFirstName,
                    regLastName,
                    regUserName,
                    regPassword,
                    regConfirmPassword,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          value: selectedAccountType,
                          isExpanded: false,
                          hint: const Text(
                            'Select an account type'
                          ),
                          items: aReclambordAccountType.map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                            ),
                            value: e,
                          )).toList(),
                          onChanged: (selectedValue){
                            
                            setState(() {
                              selectedAccountType = selectedValue.toString();
                              //print('sadafa');
                              print(selectedAccountType);
                            });
                          },
                        )
                      ],
                    ),                       
                    const SizedBox(
                      height: 15.0,
                    ),
                    isSignUpChecking
                    ? const Center(
                    child: CircularProgressIndicator(),
                    )
                    : signUpButton(),
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
