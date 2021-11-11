import 'dart:convert';

import 'package:areclambord_client/Models/adEvaluationModel.dart';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
import 'package:areclambord_client/views/CustomerUI/ProgressEvaluation/RemoveCard.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
// import 'package:areclambord_client/views/CustomerUI/vacancyListView.dart';
import 'package:areclambord_client/views/VendorUI/createBillboardVacancy.dart';
import 'package:areclambord_client/views/VendorUI/VendorDashboard/dashboardVendor.dart';
import 'package:flutter/material.dart';
// import 'signUp.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
import 'changeSubCard.dart';
import 'maintainCard.dart';
import 'progressHeaderCard.dart';

//steppers
class EvaluateAdProgress extends StatefulWidget {
  const EvaluateAdProgress({Key? key, required this.selectedPurchaseId, required this.billboardVacancyResponse}) : super(key: key);
  final String selectedPurchaseId;
  final BillboardVacancyResponse billboardVacancyResponse;
  @override
  _EvaluateAdProgressState createState() => _EvaluateAdProgressState();
}

class _EvaluateAdProgressState extends State<EvaluateAdProgress> {
  late BillboardVacancyResponse _billboardVacancyResponse;
  //login controllers
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static bool isEnabledRemoveCard = false;
  static bool isEnabledChangeSubscriptionCard = false;
  static bool isEnabledMaintainCard = false;
  static bool isLoading = true;
  final _evaluateAdProgressScaffoldKey = GlobalKey<ScaffoldState>();
  late String _selectedPurchaseId;

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

  // signInButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: MaterialButton(
  //       minWidth: double.infinity,
  //       height: 60,  
  //       elevation: 5,      
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(70.0)
  //       ),
  //       color: Colors.orange[400],
  //       child: Text(
  //         "Remove the Billboard for New Campaign",
  //         style: TextStyle(
  //           fontSize: 15.0,
  //           color: Colors.white 
  //         ),
  //       ),
  //       onPressed: (){
  //         // if (_formKey.currentState.validate()) {
  //         //   //addMall();
            
  //         // }
  //         Navigator.push(
  //           context,
  //           // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
  //           MaterialPageRoute(builder: (context) => BillboardVacanciesByVendors()),
  //         );                
  //       }
  //     ),
  //   );
  // }

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
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => SignUpScreen()),
          //       );               
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
            ElevatedButton(
              child: const Text(
                "OK",
                style: TextStyle(
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
  void dispose() {
    print("Disposed");
    isEnabledRemoveCard = false;
    isEnabledChangeSubscriptionCard = false;
    isEnabledMaintainCard = false;
    print(isEnabledRemoveCard);
    print(isEnabledChangeSubscriptionCard);
    print(isEnabledMaintainCard);
    super.dispose();
  }

  @override
    Future<void> initState() async {
      // vacancyList = getBillboardVacancies();
      _billboardVacancyResponse = widget.billboardVacancyResponse;
      _selectedPurchaseId = widget.selectedPurchaseId;
      isLoading = true;
      // String result = await getEvaluatedRecommendation();
      // print(result);
      prepare();
      super.initState();
      // if (result == "REMOVE"){
      //   isEnabledRemoveCard = true;
      // }
      // else if(result == "CHANGE_SUBSCRIPTION"){
      //   isEnabledChangeSubscriptionCard = true;
      // }
      // else if(result == "CHANGE_SUBSCRIPTION"){
      //   isEnabledMaintainCard = true;
      // }
      
    }

  prepare() async{
    String result = await getEvaluatedRecommendation();
    // print("AQWER");
    setState(() {
          if (result == "REMOVE"){
        isEnabledRemoveCard = true;
        // print("zxzc");
      }
      else if(result == "CHANGE_SUBSCRIPTION"){
        isEnabledChangeSubscriptionCard = true;
      }
      else if(result == "MAINTAIN"){
        isEnabledMaintainCard = true;
      }
    isLoading = false;
    }
    );
    
  }
  
   getEvaluatedRecommendation() async {
    //  print(double.parse(_billboardVacancyResponse.latitude));
    // AdEvaluationModel adEvaluationModel = AdEvaluationModel(billboardCategory: "Digital", latitude: 6.8997, longitude: 79.9453);
    AdEvaluationModel adEvaluationModel = AdEvaluationModel(billboardCategory: _billboardVacancyResponse.type, latitude: double.parse(_billboardVacancyResponse.latitude), longitude: double.parse(_billboardVacancyResponse.longitude));

    var url = Uri.parse(aReclamboardApiUrl + 'api/user/evaluate-progress/');
    // var url1;
    var response = await http.post(
      url,
      headers: {
        "X-CSRFToken": x_csrfToken
      },
      body: jsonEncode(adEvaluationModel.toMap())
    );
    // final extractedData = json.decode(response.body);
    if (response.statusCode == 200) {
      var returnBody = jsonDecode(response.body);
      String suggestion = returnBody["message"];
      // print(suggestion);
      return suggestion;
    }
    return "error";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _evaluateAdProgressScaffoldKey,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,        
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[ 
          // Column(

          // ),
          SingleChildScrollView(
            child: isLoading 

            ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:320.0, bottom: 320.0, left: 320.0, right: 320.0),
                  child: Center(
                            child: CircularProgressIndicator(),
                ),
                )
                
              ],
            )
            :        
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ProgressHeaderCard(),
                RemoveCard(isEnabledRemoveCard, _selectedPurchaseId),
                ChangeSubscriptionCard(isEnabledChangeSubscriptionCard),
                MaintainAdCampaignCard(isEnabledMaintainCard),                
              ],
            ),
          ),
                       
          
        ]
        
      ),
    );
  }    
    
}
