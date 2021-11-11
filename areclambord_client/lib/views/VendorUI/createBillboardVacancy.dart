import 'dart:convert';
import 'dart:io';

import 'package:areclambord_client/Models/billboardVacancyModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Commons/constants.dart';

class CreateBillboardVacancy extends StatefulWidget {
  const CreateBillboardVacancy({Key? key, required this.localId}) : super(key: key);
  final String localId;
  @override
  _CreateBillboardVacancyState createState() => _CreateBillboardVacancyState();
}

class _CreateBillboardVacancyState extends State<CreateBillboardVacancy> {

  //reg controllers
  static TextEditingController VacancyTitleController = TextEditingController();
  static TextEditingController VacancyDescriptionController = TextEditingController();
  static TextEditingController LongitudeController = TextEditingController();
  static TextEditingController LatitudeController = TextEditingController();
  static TextEditingController VendorIdController = TextEditingController();
  static TextEditingController PriceController = TextEditingController();
  late String _localId;

  late String selectedCategoryType;
  List<String> billboardCategoryType = <String>[
    'Digital',
    'Large',
    'Medium',
    'Small'
  ];
  final _billboardVacancyScaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();


   @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _localId = widget.localId;
    // getBillboardsByVendorId(_localId);
    super.initState();   
  }
  
  createBillboardVacancy() async {
    BillboardVacancy newUser = BillboardVacancy(title: title.controller!.text, vendorId: _localId, description: description.controller!.text, 
                                longitude: longitude.controller!.text, latitude: latitude.controller!.text, price: price.controller!.text, type: selectedCategoryType);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/create-bill-vacancy/');  
    var body = jsonEncode(newUser.toMap());
    print(body);  
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": x_csrfToken
      },
      body: jsonEncode(newUser.toMap())
    );

    if (response.statusCode == 201) {
      var returnBody = jsonDecode(response.body);

      final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: Text(returnBody['message']),
        backgroundColor: Colors.teal[900]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // print(returnBody['message']);
      // _billboardVacancyScaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text(returnBody['message']),
      //   backgroundColor: Colors.teal[900]
      //   ));
    }
  }

  createVacancyButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      child: MaterialButton(
        minWidth: 200,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Post Vacancy",
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            //addMall();
            createBillboardVacancy();
          }               
        }
      ),
    );
  }

  backToHomeButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      child: MaterialButton(
        minWidth: 200,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.black,
        child: const Text(
          "Back to Home",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          Navigator.pop(context);             
        }
      ),
    );
  }

  //reg variables  
    final title = TextFormField(
      controller: VacancyTitleController,
      decoration: const InputDecoration(
        labelText: "Title of the vacancy", hintText: "Enter title here"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'First name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final description = TextFormField(
      controller: VacancyDescriptionController,
      decoration: const InputDecoration(
        labelText: "Description", hintText: "Enter brief description"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'Last name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final longitude = TextFormField(
        controller: LongitudeController,
        decoration: const InputDecoration(
          labelText: "Longitude", hintText: "Longitude value of the location"
        ),
        // validator: (value){
        //   if (value.isEmpty){
        //     return 'Username cannot be empty!';
        //   }
        //   return null;
        // },
      );

  final latitude = TextFormField(
      controller: LatitudeController,
      decoration: const InputDecoration(
        labelText: "Latitude", hintText: "Latitude value of the location"
      ),
      // validator: (value){
      //   // if (value.isEmpty){
      //   //   return 'Password cannot be empty!';
      //   // }
      //   return null;          
      // },
    );

  final price = TextFormField(
      controller: PriceController,
      decoration: const InputDecoration(
        labelText: "Price of the billboard", hintText: "Enter price here"
      ),
      // validator: (value){
      //   if (value != LatitudeController.text){
      //       return 'Passwords does not match';
      //     }
      //   return null;          
      // },
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _billboardVacancyScaffoldKey,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,        
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[ 
          Padding(
            padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 60.0, right: 60.0),
            // child: Card(
            //   elevation: 10.0,
              child: SingleChildScrollView( 
              //elevation: 10.0,
          child: Padding(                
            //padding: EdgeInsets.all(5.0),
          padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 30.0, right: 30.0),
          child: Column(                     
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Billboard Inventory for Vendor",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),                  
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  Text("Create your new Billboard Vacancy",
                  style: TextStyle(
                    fontSize: 18,
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
                    "assets/createBillboard.jpg",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,                  
                  children: <Widget>[                    
                    title,
                    description,
                    longitude,
                    latitude,
                    price,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          value: selectedCategoryType,
                          isExpanded: false,
                          hint: const Text(
                            'Select an billboard category'
                          ),
                          items: billboardCategoryType.map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                            ),
                            value: e,
                          )).toList(),
                          onChanged: (selectedValue){
                            
                            setState(() {
                              selectedCategoryType = selectedValue.toString();
                              //print('sadafa');
                              print(selectedCategoryType);
                            });
                          },
                        )
                      ],
                    ),                       
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        createVacancyButton(),
                        backToHomeButton(),
                      ],
                    )
                    
                  ],
                )
                ),
                ),
              
              ],
        )
          )
          ),
          // ),
            
          ),             
          
        ]
        
      ),
    );
  }    
    
}
