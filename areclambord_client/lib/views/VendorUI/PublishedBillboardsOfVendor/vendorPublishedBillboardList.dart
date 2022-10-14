import 'dart:convert';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
// import 'package:firebase_database/firebase_database.dart';

import 'publishedBillsHeaderCard.dart';
// class PromotersDetails extends StatefulWidget {
// final String url,title;
// PromotersDetails({Key key, @required this.url, @required this.title}) : super(key: key);
//  @override
//  _PromotersDetailsState createState() => _PromotersDetailsState(url,title);
//   }
class VendorPublishedBillboards extends StatefulWidget {
// final String url,title;
const VendorPublishedBillboards({Key? key, required this.localId}) : super(key: key);
  final String localId;
 @override
 _VendorPublishedBillboardsState createState() => _VendorPublishedBillboardsState();
  }

class _VendorPublishedBillboardsState extends State<VendorPublishedBillboards> {
  final _getVendorPublishedBillsScaffoldKey = GlobalKey<ScaffoldState>();
  late String _localId;
  // static Stream<DataSnapshot> vacancyList;
  List<BillboardVacancyResponse> list = [];
  static bool isLoading = true;
  // String url,title;

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _localId = widget.localId;
    getBillboardsByVendorId(_localId);
    super.initState();
    
    
  }

  Future<void> getBillboardsByVendorId(String vendorId) async {
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-vacancies-byvendorid/$vendorId/');
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
        list.add(BillboardVacancyResponse(id: blogId, vendorId: blogData["vendorId"], title: blogData["title"], description: blogData["description"], latitude: blogData["latitude"], longitude: blogData["longitude"], price: blogData["price"], type: blogData["type"]));
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

  

  // Widget headerCard(BuildContext context){
    

  // }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    key: _getVendorPublishedBillsScaffoldKey,
    backgroundColor: Colors.white,    
    body: isLoading
    ? const Center(
      child: CircularProgressIndicator(),
    )
    :     
    Stack(
      fit: StackFit.expand,
      children: <Widget>[Column(
        children: [
          PublishedBillsHeaderCard(context),
          Expanded(
            child: ListView.builder(                        
                      // reverse: false,
                      // cacheExtent: 10000.00,
                      itemCount: list.length,
                      padding: const EdgeInsets.all(4),
                      itemBuilder: buildItemsForListView,
                    ),
          ),
        ],
      ),
      ]
    ),

    );
  }

  Widget buildItemsForListView(BuildContext context, int index) {
    // print(list[index].id);
      // return ListTile(
      //   title: Text(list[index].title, style: TextStyle(fontSize: 18)), 
      //   subtitle: Text(list[index].description, style: TextStyle(fontSize: 12)),
      // );
      final vacancy = list[index];
      int remainder = index%2;
      // print(remainder);
      return Padding(
        padding: const EdgeInsets.only(top:2.0, bottom: 2.0, left: 320.0, right: 320.0),
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
                        const Text(
                          "Title: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Description: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.description,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Latitude: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.latitude,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Longitude: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.longitude,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Billboard Type: ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.type,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Price: ",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          vacancy.price,
                          style: TextStyle(fontSize: 16, color: Colors.red[900]),
                        ),
                      ],
                    ),
                    // purchaseVacancyButton(vacancy),
                  ],
                ),
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 60,                        
                ),
                deleteBillboardButton(vacancy.id),
                // viewBillBoardDetailsButton(purchase.billboardId, purchase.id),
              ],
            ),
            
            ],
          ),
        ),
      );
  }

  deleteBillboardButton(String billboardId) {
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 10, right: 20),
      // width: 100,
      child: MaterialButton(      
        minWidth: 150,
        height: 30,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.red[800],
        child: const Text(
          "Delete Billboard",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){            
            deleteBillboardById(billboardId);
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

  Future<void> deleteBillboardById(String billboardId) async {
    // setState(() {
    //       isDetailsLoading = true;
    //     });
    // print(billboardId);
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/delete-billboard/$billboardId/');
    // var url1;
    var response = await http.get(
      url,
      headers: {        
        "X-CSRFToken": x_csrfToken
      },
    );

    if (response.statusCode == 204){
        // var returnBody = jsonDecode(response.body);

        // _getBillboardVacanciesScaffoldKey.currentState.showSnackBar(SnackBar(
        // content: Text("Deleted Successfully"),
        // backgroundColor: Colors.red[800]
        // ));

        final snackBar = SnackBar(
        duration: const Duration(milliseconds: 2500),
        content: const Text("Billboard Deleted Successfully"),
        backgroundColor: Colors.red[800]
        );
        
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        setState(() {
            isLoading = true;
            refreshList(_localId);
          });        
        // print(billboardVacancyResponse.id);
      }
  }

  Future<void> refreshList(String vendorId) async {
    setState(() {
      list.clear();    
    });

    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-vacancies-byvendorid/$vendorId/');
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
        list.add(BillboardVacancyResponse(id: blogId, vendorId: blogData["vendorId"], title: blogData["title"], description: blogData["description"], latitude: blogData["latitude"], longitude: blogData["longitude"], price: blogData["price"], type: blogData["type"]));
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
