import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:areclambord_client/Commons/storageController.dart';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
import 'package:areclambord_client/Models/purchaseBillboardModel.dart';
import 'package:areclambord_client/views/CustomerUI/ScheduleCampaign/GeneratedScheduleList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Models/aReclambordUser.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
import 'selectedBillDetailsCard.dart';
import 'package:file_picker/file_picker.dart';
// import 'ScheduleCampaign/GeneratedScheduleList.dart';
// import 'package:firebase_core/firebase_core.dart';

class BuyBillboardVacancy extends StatefulWidget {
  const BuyBillboardVacancy({Key? key, required this.vacancyForPurchase, required this.localId}) : super(key: key);
  final String localId;
  final BillboardVacancyResponse vacancyForPurchase;
  @override
  _BuyBillboardVacancyState createState() => _BuyBillboardVacancyState();
}

class _BuyBillboardVacancyState extends State<BuyBillboardVacancy> {

  //reg controllers
  static TextEditingController CustomerNameController = TextEditingController();
  static TextEditingController CustomerEmailController = TextEditingController();
  static TextEditingController CustomerContactNoController = TextEditingController();
  static TextEditingController DesignLinkController = TextEditingController();
  // // static TextEditingController CategoryController = TextEditingController();
  // static TextEditingController PriceController = TextEditingController();
  late BillboardVacancyResponse _vacancyForPurchase;
  static bool isPurchaseProcessing = false;
  late String _localId;
  String billboardDesignUrl = "";
  // late File billboardDesignFile;
  // var fileBytes;
  PlatformFile? designPlatformFile;
  Uint8List? byteListForPlatformFile;
  // late StorageController _storageController = StorageController();

  bool _initialized = false;
  bool _error = false;

  String selectedPackageType = 'Silver';
  List<String> billboardPackageType = <String>[
    'Silver',
    'Gold',
    'Platinum'
  ];
  final _applyForVacancyScaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  // Future<HttpResponse> _registerUser;

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _localId = widget.localId;
    _vacancyForPurchase = widget.vacancyForPurchase;
    super.initState();
    
  }  
//  String myUrl;

    // _storageController.uploadBillboardDesign(designPlatformFile).then((String url){
    //   // setState(() {
    //   //   billboardDesignUrl = url; 
    //   //   print(billboardDesignUrl);       
    //   // });
    //   myUrl = url;
    //   print("Myurl: " + myUrl);
    // });

    // String ss = _storageController.uploadBillboardDesign(fileBytes);
    // print(ss);

  

  buyBillboardVacancy() async {
    setState(() {
          isPurchaseProcessing = true;
        });    
    
    // String myUrl;
    // _storageController.uploadBillboardDesign(designPlatformFile).then((String url){
    //   // setState(() {
    //   //   billboardDesignUrl = url; 
    //   //   print(billboardDesignUrl);       
    //   // });
    //   myUrl = url;
    //   print("Myurl: " + myUrl);
    // });
    // String ss = _storageController.uploadBillboardDesign(fileBytes);
    // print(ss);






    PurchaseBillboard newPurchase = PurchaseBillboard(billboardId: _vacancyForPurchase.id, customerName: customerName.controller!.text, customerEmail: customerEmail.controller!.text,
                                    customerContactNo: customerContactNo.controller!.text, designLink: billboardDesignUrl , packageType: selectedPackageType, customerId: _localId);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/purchase-billboard/');  
    var body = jsonEncode(newPurchase.toMap());
    // print(body);
      
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": x_csrfToken
      },
      body: jsonEncode(newPurchase.toMap())
    );

    if (response.statusCode == 201) {
      setState(() {
          isPurchaseProcessing = false;    
      });
      var returnBody = jsonDecode(response.body);

        final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2100),
        content: Text(returnBody['message']),
        backgroundColor: Colors.teal[900]
        );
        
        var schedule_list = returnBody['schedule'];
        String purchaseId = returnBody['purchaseId'];

        ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GeneratedScheduleList(task1Date: schedule_list[0].toString(), task2Date: schedule_list[1].toString(),task3Date: schedule_list[2].toString(),task4Date: schedule_list[3].toString(), createdPurchaseId: purchaseId,)),
          ); 
        });
    }
  }

  purchaseButton() {
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
            "Confirm Purchase",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white 
            ),
          ),
          onPressed: (){
            if (_formKey.currentState!.validate()) {
              //addMall();
              buyBillboardVacancy();
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
          "Back",
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

  selectBillboardDesignButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
      child: MaterialButton(
        minWidth: 180,
        height: 35,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.grey[850],
        child: const Text(
          "Select Bilboard Design",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          // Navigator.pop(context);
          print("pressed");
          getBillboardDesign();          
        }
      ),
    );
  }
  
  Future<void> getBillboardDesign() async {
    var result ;
        // var image = await ImagePicker.pickImage(source: ImageSource);
        try {
          result = await FilePicker.platform.pickFiles(
            type: FileType.image,
            allowMultiple: false,
            // allowedExtensions: ['jpg', 'png', 'jpeg'],
            // withReadStream: true
          );
        } on PlatformException catch (e) {
          print(e.toString());
        } catch (ex) {
          print(ex.toString());
        }
        // PlatformFile fm = result.files.single;        

        setState(() {
          // fm.readStream.listen((event) {
          //   billboardDesignFile = Image.memory(bytes)
          // });
          // print(result.files.single,bytes.)
          designPlatformFile = result.files.single;
          byteListForPlatformFile = result.files.single.bytes;
          // billboardDesignUrl = imageStoreUrl + designPlatformFile.name;          
          List<String> splitted = designPlatformFile!.name.split(".");
          billboardDesignUrl = imageStoreUrlList[int.parse(splitted[0])];
          // print(splitted[0]);
          // print(imageStoreUrlList[int.parse(splitted[0])]);
          // print(designPlatformFile.)
          // fileBytes = result.files.single.bytes;
          // print(fileBytes);
          }
        );
        // _scaffoldKey.currentState.showSnackBar(SnackBar(
        //       content: Text('Image selected'),
        //       action: SnackBarAction(
        //         label: 'Undo', 
        //         onPressed: (){
        //           // setState(() {
        //           //   profileImageFile = null;
        //           // });
        //         }
        //       ),
        //     ));
      }

  //reg variables  
    final customerName = TextFormField(
      controller: CustomerNameController,
      decoration: const InputDecoration(
        labelText: "Customer Name", hintText: "Enter name here"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'First name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final customerEmail = TextFormField(
      controller: CustomerEmailController,
      decoration: const InputDecoration(
        labelText: "Email", hintText: "Enter email here"
      ),
      // validator: (value){
      //   if (value.isEmpty){
      //     return 'Last name cannot be empty';
      //   }
      //   return null;          
      // },
    );

    final customerContactNo = TextFormField(
        controller: CustomerContactNoController,
        decoration: const InputDecoration(
          labelText: "Contact No", hintText: "Enter contact No"
        ),
        // validator: (value){
        //   if (value.isEmpty){
        //     return 'Username cannot be empty!';
        //   }
        //   return null;
        // },
      );

  final designLink = TextFormField(
      controller: DesignLinkController,
      decoration: const InputDecoration(
        labelText: "Drive link for Billboard Advertisement", hintText: "Enter sharable link for ad design here"
      ),
      // validator: (value){
      //   // if (value.isEmpty){
      //   //   return 'Password cannot be empty!';
      //   // }
      //   return null;          
      // },
    );


  @override
  Widget build(BuildContext context) {
    // if(_error) {
    //   return Text("Error occured");
    // }

    // // Show a loader until FlutterFire is initialized
    // if (!_initialized) {
    //   return Text("Loading");
    // }
    return Scaffold(
      key: _applyForVacancyScaffoldKey,
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
                children: const <Widget>[
                  Text(
                    "Purchase Billboard for Advertisement",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),                  
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                  
                  Text("Enter purchasing details",
                  style: TextStyle(
                    fontSize: 18,
                  color:Colors.grey[700]),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    width: 200.0,
                    child: Image.asset(
                    "assets/purchase.jpg",
                    height: 100.0,
                    width: 200.0,
                  ),
                  ),
                  const SizedBox(
                      width: 20.0,
                    ),
                  SelectedBillDetailsCard(_vacancyForPurchase),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Selected Billboard Details",
                  //       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  //     Text(
                  //       _vacancyForPurchase.title,
                  //       style: TextStyle(fontSize: 8,color:Colors.grey[700]),
                  //     ),
                  //   ],
                  // ), 
                ],
              ),
              // Row(                
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     Text(
              //       "Selected Billboard Details",
              //       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
              //       Text(
              //         _vacancyForPurchase.title,
              //         style: TextStyle(fontSize: 8,color:Colors.grey[700]),
              //       ),                                      
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 60.0, right: 60.0),
                child: Form(
                key: _formKey,
                child: Column(                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,                  
                  children: <Widget>[                    
                    customerName,
                    customerEmail,
                    customerContactNo,
                    // designLink,                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DropdownButton(
                          value: selectedPackageType,
                          isExpanded: false,
                          hint: const Text(
                            'Select a advertisement package'
                          ),
                          items: billboardPackageType.map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                            ),
                            value: e,
                          )).toList(),
                          onChanged: (selectedValue){
                            
                            setState(() {
                              selectedPackageType = selectedValue.toString();
                              //print('sadafa');
                              print(selectedPackageType);
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                          width: 220,
                          child: designPlatformFile != null 
                          ? Image.memory(byteListForPlatformFile!, fit: BoxFit.fill,)                      
                          : Image.asset("assets/imageIfNull.jpg", fit: BoxFit.fill,
                          // height: 140.0,
                          // width: 420.0,
                          ),                        
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 80.0,
                            ),
                            selectBillboardDesignButton(),
                          ],
                        )
                        
                      ],
                    ),                        
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isPurchaseProcessing 
                        ? const Center(
                        child: const CircularProgressIndicator(),
                        )
                        : purchaseButton(),
                        backToHomeButton(),
                      ],
                    ),
                    
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
