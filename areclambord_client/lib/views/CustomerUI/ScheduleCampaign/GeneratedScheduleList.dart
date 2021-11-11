import 'dart:convert';

import 'package:areclambord_client/Models/scheduledTasksModel.dart';
import 'package:areclambord_client/views/CustomerUI/ScheduleCampaign/scheduleDetailsCard.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
// import 'package:areclambord_client/views/CustomerUI/vacancyListView.dart';
import 'package:flutter/material.dart';
// import 'signUp.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
// import 'changeSubCard.dart';
// import 'maintainCard.dart';

//steppers
class GeneratedScheduleList extends StatefulWidget {
  const GeneratedScheduleList({Key? key, required this.task1Date, required this.task2Date, required this.task3Date, required this.task4Date, required this.createdPurchaseId}) : super(key: key);
  // final String selectedPurchaseId;
  // final BillboardVacancyResponse billboardVacancyResponse;
  final String task1Date, task2Date, task3Date, task4Date, createdPurchaseId;
  @override
  _GeneratedScheduleListState createState() => _GeneratedScheduleListState();
}

class _GeneratedScheduleListState extends State<GeneratedScheduleList> {
  late String _task1Date, _task2Date, _task3Date, _task4Date, _createdPurchaseId;
  //login controllers
  static bool isLoading = true;
  final _generatedScheduleListScaffoldKey = GlobalKey<ScaffoldState>();

  acceptScheduleAndSaveButton() {
    return MaterialButton(
        minWidth: 500,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Accept and Save the Schedule of the Purchase",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          saveScheduleTasks();                
        }
      );
    // );
  }

  saveScheduleTasks() async {
    ScheduledTasksModel generatedSchedule = ScheduledTasksModel(purchaseId: _createdPurchaseId, task1Date: _task1Date, task2Date: _task2Date,
                                    task3Date: _task3Date, task4Date: _task4Date);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/save-schedule/');  
    var body = jsonEncode(generatedSchedule.toMap());
    print(body);  
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": x_csrfToken
      },
      body: jsonEncode(generatedSchedule.toMap())
    );

    if (response.statusCode == 201) {
      var returnBody = jsonDecode(response.body);

      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: Text(returnBody['message']),
        backgroundColor: Colors.teal[900]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
          int count = 0; 
          Navigator.popUntil(context, (route) {
            return count++ == 3;
        });
        });

      // _generatedScheduleListScaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text(returnBody['message']),
      //   backgroundColor: Colors.teal[900]
      //   )).closed.then((value) {
      //     int count = 0; 
      //   Navigator.popUntil(context, (route) {
      //       return count++ == 3;
      //   });
      //   });

        // var schedule_list = returnBody['schedule'];
        // print(schedule_list);

        // Navigator.pop(context); 
        // int count = 0; 
        // Navigator.popUntil(context, (route) {
        //     return count++ == 3;
        // });

        // Navigator.of(context).popUntil((route) => route.isFirst); 
    }
  }

  // Future<int> aReclambordSignIn(String username, String password){
  //   var url = Uri.parse(aReclamboardApiUrl + 'api/user/signIn')
  //   var response = await http.post(

  //   );
  // }

  @override
    void initState() {
      // vacancyList = getBillboardVacancies();
      // _datesArr = widget.datesArr;
      // print(widget.datesArr);
      _task1Date = widget.task1Date;
      _task2Date = widget.task2Date;
      _task3Date = widget.task3Date;
      _task4Date = widget.task4Date;
      _createdPurchaseId = widget.createdPurchaseId;

      isLoading =false;
      // String result = await getEvaluatedRecommendation();
      // print(result);
      // prepare();
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

  // prepare() async{
  //   String result = await getEvaluatedRecommendation();
  //   // print("AQWER");
  //   setState(() {
  //         if (result == "REMOVE"){
  //       isEnabledRemoveCard = true;
  //       // print("zxzc");
  //     }
  //     else if(result == "CHANGE_SUBSCRIPTION"){
  //       isEnabledChangeSubscriptionCard = true;
  //     }
  //     else if(result == "CHANGE_SUBSCRIPTION"){
  //       isEnabledMaintainCard = true;
  //     }
  //   isLoading = false;
  //   }
  //   );
    
  // }
  
  //  getEvaluatedRecommendation() async {
  //   //  print(double.parse(_billboardVacancyResponse.latitude));
  //   // AdEvaluationModel adEvaluationModel = AdEvaluationModel(billboardCategory: "Digital", latitude: 6.8997, longitude: 79.9453);
  //   AdEvaluationModel adEvaluationModel = AdEvaluationModel(billboardCategory: _billboardVacancyResponse.type, latitude: double.parse(_billboardVacancyResponse.latitude), longitude: double.parse(_billboardVacancyResponse.longitude));

  //   var url = Uri.parse(aReclamboardApiUrl + 'api/user/evaluate-progress/');
  //   // var url1;
  //   var response = await http.post(
  //     url,
  //     headers: {
  //       "X-CSRFToken": x_csrfToken
  //     },
  //     body: jsonEncode(adEvaluationModel.toMap())
  //   );
  //   // final extractedData = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     var returnBody = jsonDecode(response.body);
  //     String suggestion = returnBody["message"];
  //     // print(suggestion);
  //     return suggestion;
  //   }
  //   return "error";
  //   // var res = json.decode(response.body);
  //   // DataSnapshot wert = res;
  //   // print(res);
  //   // print(wert);
  //   // return res.map((data) => (
  //   //   new BillboardVacancyResponse.fromSnapshot(data))).toList();
  //   // return wert;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _generatedScheduleListScaffoldKey,
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
                Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 320.0, right: 320.0),
                  child: Card(
                    color: Colors.blueGrey[900],
                    elevation: 20,
                    // child: SingleChildScrollView( 
                    //elevation: 10.0,
                child: Padding(                
                  //padding: EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(top:20.0, bottom: 20.0, left: 50.0, right: 50.0),
                child: Column(                     
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Scheduled Tasks for the\nPurchased Advertisement",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                          color: Colors.white),),                  
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                  
                        Text("Accept and save the schedule task list for notifications",
                        textAlign: TextAlign.center,                        
                        style: TextStyle(
                          fontSize: 18,                          
                        color:Colors.grey[300]),)
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
                    ],
        )
                )
                // ),
                ),
                  
                ),
                ScheduleDetailsCard(taskNameList[0], _task1Date),
                ScheduleDetailsCard(taskNameList[1], _task2Date),
                ScheduleDetailsCard(taskNameList[2], _task3Date),
                ScheduleDetailsCard(taskNameList[3], _task4Date),
                Padding(
                  padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                  // child: Form(
                  // key: _zformKey,
                  child: Column(                  
                    children: <Widget>[
                      // userName,
                      // password,                        
                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      acceptScheduleAndSaveButton(),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // signUpScreenButton(),
                    ],
                  )
                  // ),
                  ),                
              ],
            ),
          ),
                       
          
        ]
        
      ),
    );
  }    
    
}
