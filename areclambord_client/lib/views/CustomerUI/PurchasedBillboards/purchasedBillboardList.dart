import 'dart:convert';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
import 'package:areclambord_client/Models/purchasedBillboardsReponse.dart';
import 'package:areclambord_client/views/CustomerUI/PurchasedBillboards/billboardDetailsCard.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
import 'dart:html' as html;
// import 'package:firebase_database/firebase_database.dart';
// class PromotersDetails extends StatefulWidget {
// final String url,title;
// PromotersDetails({Key key, @required this.url, @required this.title}) : super(key: key);
//  @override
//  _PromotersDetailsState createState() => _PromotersDetailsState(url,title);
//   }
class PurchasedBillboardsByCustomer extends StatefulWidget {
final String localId;
PurchasedBillboardsByCustomer({Key? key, required this.localId}) : super(key: key);
 @override
 _PurchasedBillboardsByCustomerState createState() => _PurchasedBillboardsByCustomerState();
  }

class _PurchasedBillboardsByCustomerState extends State<PurchasedBillboardsByCustomer> {
  final _getBillboardVacanciesScaffoldKey = GlobalKey<ScaffoldState>();
  // static Stream<DataSnapshot> vacancyList;
  List<PurchasedBillboardsResponse> list = [];
  // String url,title;
  static bool isLoading = true;
  static bool isDetailsLoading = false;
  static String selectedPurchaseId = "";
  late BillboardVacancyResponse billboardVacancyResponse;
  late String _localId;
  
  @override
  void dispose() {
    // print("purchase list screen disposed");
    // print("id sel:" + selectedPurchaseId);
    billboardVacancyResponse.clearInstance();
    selectedPurchaseId = "";
    // print("id sel:" + selectedPurchaseId);
    // print(list.isEmpty);
    list.clear();
    // print(list.isEmpty);
    super.dispose();
  }

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _localId = widget.localId;
    getPurchasedBillboards();
    super.initState();   
    
  }

  Future<void> getPurchasedBillboards() async {
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-purchased-billboards/$_localId/');
    // var url1;
    var response = await http.get(
      url,
      headers: {
        "X-CSRFToken": x_csrfToken
      },
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        list.add(new PurchasedBillboardsResponse(id: blogId, billboardId: blogData["billboardId"], customerContactNo: blogData["customerContactNo"], customerEmail: blogData["customerEmail"], customerName: blogData["customerName"], designLink: blogData["designLink"], packageType: blogData["packageType"]));
      });
      // print(list[0].id);

      setState(() {          
           isLoading = false;   
      });
    // var res = json.decode(response.body);
    // DataSnapshot wert = res;
    // print(res);
    // print(wert);
    // return res.map((data) => (
    //   new BillboardVacancyResponse.fromSnapshot(data))).toList();
    // return wert;
  }

  Future<void> getBillboardDetails(String billboardId, String purchaseId) async {
    setState(() {
          isDetailsLoading = true;
        });
    // print(billboardId);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/getbyid/$billboardId/');
    // var url1;
    var response = await http.get(
      url,
      headers: {
        "X-CSRFToken": x_csrfToken
      },
    );
    if (response.statusCode == 200){
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        extractedData.forEach((blogId, blogData) {
          // billboardVacancyResponse = BillboardVacancyResponse(id: blogId, title: blogData["title"], description: blogData["description"], latitude: blogData["latitude"], longitude: blogData["longitude"], price: blogData["price"], type: blogData["type"]);
          // print(billboardVacancyResponse.id);
          setState(() {
            billboardVacancyResponse = BillboardVacancyResponse(id: blogId, title: blogData["title"], description: blogData["description"], latitude: blogData["latitude"], longitude: blogData["longitude"], price: blogData["price"], type: blogData["type"], vendorId: blogData["type"]);
            isDetailsLoading = false;
            selectedPurchaseId = purchaseId;
          });
        });
        // print(billboardVacancyResponse.id);
      }
    // final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   if (extractedData == null) {
    //     return;
    //   }
    //   extractedData.forEach((blogId, blogData) {
    //     list.add(new PurchasedBillboardsResponse(id: blogId, billboardId: blogData["billboardId"], customerContactNo: blogData["customerContactNo"], customerEmail: blogData["customerEmail"], customerName: blogData["customerName"], designLink: blogData["designLink"], packageType: blogData["packageType"]));
    //   });
    //   print(list[0].id);

      // setState(() {          
      //      isLoading = false;   
      // });
    // var res = json.decode(response.body);
    // DataSnapshot wert = res;
    // print(res);
    // print(wert);
    // return res.map((data) => (
    //   new BillboardVacancyResponse.fromSnapshot(data))).toList();
    // return wert;
  }

  viewBillBoardDetailsButton(String billboardId, String purchaseId) {
    return Padding(
      padding: EdgeInsets.only(top:8, bottom: 8, left: 10, right: 20),
      // width: 100,
      child: MaterialButton(      
        minWidth: 150,
        height: 30,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: Text(
          "View Details",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){            
            getBillboardDetails(billboardId, purchaseId);
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
          //   MaterialPageRoute(builder: (context) => BuyBillboardVacancy(vacancyForPurchase:vacancyResponse)),
          // );                
        }
      ),
    );
  }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    key: _getBillboardVacanciesScaffoldKey,
    backgroundColor: Colors.white,    
    body: isLoading
    ? Center(
      child: CircularProgressIndicator(),
    )
    : 
    Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Column(
            children: [
              // BillboardDetailsCard(),
              BillboardDetailsCard(context, isDetailsLoading, billboardVacancyResponse, selectedPurchaseId),
              Expanded(
                child: ListView.builder(                        
                      // reverse: false,
                      // cacheExtent: 10000.00,
                      itemCount: list.length,
                      padding: EdgeInsets.all(4),
                      itemBuilder: buildItemsForListView,
                    ),
              ),
            ],
          ),
        ] 
    )
    

    );
  }

  Widget buildItemsForListView(BuildContext context, int index) {
    // print(list[index].id);
      // return ListTile(
      //   title: Text(list[index].title, style: TextStyle(fontSize: 18)), 
      //   subtitle: Text(list[index].description, style: TextStyle(fontSize: 12)),
      // );
      final purchase = list[index];
      int remainder = index%2;
      return Padding(
        padding: EdgeInsets.only(top:2.0, bottom: 2.0, left: 250.0, right: 250.0),
        child: Card(
          color: remainder == 0 ? Colors.grey[200] : Colors.brown[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          elevation: 4,
          child: Row(
            children: [
              Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Purchase Made By: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          purchase.customerName,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Email: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          purchase.customerEmail,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Telephone: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          purchase.customerContactNo,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    // SizedBox(height: 2,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Link for Design: ",
                    //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    //     ),
                    //     Text(
                    //       purchase.designLink,
                    //       style: TextStyle(fontSize: 14),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Subscribed Advertisement Package: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          purchase.packageType,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    // viewBillBoardDetailsButton(purchase.billboardId, purchase.id),
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:2.0, bottom: 2.0, left: 4.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FloatingActionButton(
                      onPressed: (){
                        //navigate(_latitude, _longitude);
                        // refresh();
                        html.window.open(purchase.designLink, "_blank");
                      },
                      shape: CircleBorder(),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.fullscreen, size: 20.0),
                      tooltip: 'Fullscreen',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:2.0, bottom: 2.0, left: 4.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: purchase.designLink != null 
                    ? Image.network(purchase.designLink, fit: BoxFit.fill,)                      
                    : Image.asset("assets/imageIfNull.jpg", fit: BoxFit.fill,
                    // height: 140.0,
                    // width: 420.0,
                    ),                        
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,                        
                ),
                withdrawPurchaseButton(purchase.id),
                viewBillBoardDetailsButton(purchase.billboardId, purchase.id),
              ],
            ),            
            ],
          ),
        ),
      );
  }

  withdrawPurchaseButton(String purchaseId) {
    return Padding(
      padding: EdgeInsets.only(top:8, bottom: 8, left: 10, right: 20),
      // width: 100,
      child: MaterialButton(      
        minWidth: 150,
        height: 30,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.red[800],
        child: Text(
          "Withdraw Purchase",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){            
            deletePurchaseById(purchaseId);
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
          //   MaterialPageRoute(builder: (context) => BuyBillboardVacancy(vacancyForPurchase:vacancyResponse)),
          // );                
        }
      ),
    );
  }

  Future<void> deletePurchaseById(String purchaseId) async {
    // setState(() {
    //       isDetailsLoading = true;
    //     });
    // print(billboardId);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/delete-purchase/$purchaseId/');
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
        duration: const Duration(milliseconds: 2100),
        content: const Text("Deleted Successfully"),
        backgroundColor: Colors.red[800]
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // _getBillboardVacanciesScaffoldKey.currentState.showSnackBar(SnackBar(
        // content: Text("Deleted Successfully"),
        // backgroundColor: Colors.red[800]
        // ));

        setState(() {
            isLoading = true;
            refreshList();
          });        
        // print(billboardVacancyResponse.id);
      }
  }

  Future<void> refreshList() async {
    setState(() {
      list.clear();    
    });

    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-purchased-billboards/$_localId/');
    // var url1;
    var response = await http.get(
      url,
      headers: {
        "X-CSRFToken": x_csrfToken
      },
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        list.add(new PurchasedBillboardsResponse(id: blogId, billboardId: blogData["billboardId"], customerContactNo: blogData["customerContactNo"], customerEmail: blogData["customerEmail"], customerName: blogData["customerName"], designLink: blogData["designLink"], packageType: blogData["packageType"]));
      });
      // print(list[0].id);

      setState(() {          
           isLoading = false;   
      });
    // var res = json.decode(response.body);
    // DataSnapshot wert = res;
    // print(res);
    // print(wert);
    // return res.map((data) => (
    //   new BillboardVacancyResponse.fromSnapshot(data))).toList();
    // return wert;
  }
}

