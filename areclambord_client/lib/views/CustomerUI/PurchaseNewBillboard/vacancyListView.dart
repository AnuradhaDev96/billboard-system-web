import 'dart:convert';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
// import 'package:firebase_database/firebase_database.dart';

import 'purchaseBillboard.dart';
import 'purchasedBillboardsHeaderCard.dart';
// class PromotersDetails extends StatefulWidget {
// final String url,title;
// PromotersDetails({Key key, @required this.url, @required this.title}) : super(key: key);
//  @override
//  _PromotersDetailsState createState() => _PromotersDetailsState(url,title);
//   }
class BillboardVacanciesByVendors extends StatefulWidget {
const BillboardVacanciesByVendors({Key? key, required this.localId}) : super(key: key);
final String localId;
 @override
 _BillboardVacanciesByVendorsState createState() => _BillboardVacanciesByVendorsState();
  }

class _BillboardVacanciesByVendorsState extends State<BillboardVacanciesByVendors> {
  final _getBillboardVacanciesScaffoldKey = GlobalKey<ScaffoldState>();
  // static Stream<DataSnapshot> vacancyList;
  List<BillboardVacancyResponse> list = [];
  static bool isLoading = true;
  late String _localId;

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _localId = widget.localId;
    getBillboardVacancies();
    super.initState();
    
    
  }

  Future<void> getBillboardVacancies() async {
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-vacancies/');
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
      print(list[0].id);
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

  purchaseVacancyButton(BillboardVacancyResponse vacancyResponse) {
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 10, right: 20),
      // width: 80,
      child: MaterialButton(
        minWidth: 120,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Purchase",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white 
          ),
        ),
        onPressed: (){
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            
          // }
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
            MaterialPageRoute(builder: (context) => BuyBillboardVacancy(vacancyForPurchase:vacancyResponse, localId: _localId,)),
          );                
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
    ? const Center(
      child: CircularProgressIndicator(),
    )
    :     
    Stack(
      fit: StackFit.expand,
      children: <Widget>[Column(
        children: [
          PurchasedBillsHeaderCard(context),
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
      return Padding(
        padding: const EdgeInsets.only(top:2.0, bottom: 2.0, left: 320.0, right: 320.0),
        child: Card(
          color: remainder == 0 ? Colors.grey[200] : Colors.brown[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: Cro,
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
                    
                  ],
                ),
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                purchaseVacancyButton(vacancy),
              ],
            ),
            
            ],
          ),
        ),
      );
  }
}

// ListTile buildItemsForListView(BuildContext context, int index) {
//       return ListTile(
//         title: list[index].urlToImage == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].urlToImage), 
//         subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
//       );
//   }





        //     FutureBuilder(
        // future: null,
        // builder: (BuildContext context, AsyncSnapshot snapshot) {
        //   if (snapshot.hasError) {
        //     return Center(
        //       child: Text(snapshot.error.toString()),
        //     );
        //   }
        //   if (snapshot.hasData) {
        //     return ListView.builder(                        
        //       reverse: false,
        //       cacheExtent: 10000.00,
        //       itemCount: snapshot.data.length,
        //       padding: EdgeInsets.all(8),
        //       itemBuilder: (BuildContext context, int index) {
        //         return Row(
        //           children: [
        //             Container(
        //               height: 120,
        //               alignment: Alignment.center,
        //               child: Container(
        //                 height: 120,
        //                 width: 120,
        //                 child: Card(
        //                   child: Text(
        //                     list[index],
        //                     style: TextStyle(color: Colors.green),
        //                   ),
        //                 ),
        //               ),
        //             ),
                  
        //             // Expanded(
        //             //   child: Container(
        //             //     child: Column(
        //             //       crossAxisAlignment: CrossAxisAlignment.start,
        //             //       children: [
        //             //         SizedBox(
        //             //           height: 10,
        //             //         ),
                          
        //             //         Row(
        //             //           children: [
        //             //             Text(
        //             //               "Time: ",
        //             //               style: TextStyle(color: Colors.black),
        //             //             ),
        //             //             Text(
        //             //               snapshot.data[index]['time'],
        //             //               style: TextStyle(color: Color(0xff868597)),
        //             //             ),
        //             //           ],
        //             //         ),
            
        //             //         Container(
        //             //           height: 50,
        //             //           child: Text(
        //             //             snapshot.data[index]['location'],
        //             //             style: TextStyle(color: Color(0xff868597)),
        //             //           ),
        //             //         ),
        //             //       ],
        //             //     ),
        //             //   ),
        //             // ),
        //           ],
        //         );
        //       },
        //     );
        //   }
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // })