import 'dart:convert';
import 'package:areclambord_client/Models/billboardPackageAmount.dart';
import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
// import 'package:areclambord_client/views/CustomerUI/purchaseBillboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Commons/constants.dart';
// import 'package:firebase_database/firebase_database.dart';

import 'billboardBarChartWidget.dart';
import 'otherBillboardsListHeaderCard.dart';

// class PromotersDetails extends StatefulWidget {
// final String url,title;
// PromotersDetails({Key key, @required this.url, @required this.title}) : super(key: key);
//  @override
//  _PromotersDetailsState createState() => _PromotersDetailsState(url,title);
//   }
class OtherBillboardsList extends StatefulWidget {
// final String url,title;
  const OtherBillboardsList({Key? key}) : super(key: key);
  @override
  _OtherBillboardsListState createState() => _OtherBillboardsListState();
}

class _OtherBillboardsListState extends State<OtherBillboardsList> {
  final _getBillboardVacanciesScaffoldKey = GlobalKey<ScaffoldState>();
  // static Stream<DataSnapshot> vacancyList;
  List<BillboardVacancyResponse> list = [];
  List<BillboardPackageAmount> amountList = [];
  // List<List<BillboardVacancyResponse>> typeList = [];//chip
  static bool isLoading = true;
  // String url,title;

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    getBillboardVacancies();
    super.initState();
  }

  @override
  void dispose() {
    list.clear();
    amountList.clear();
    super.dispose();
  }

  Future<void> getBillboardVacancies() async {
    var url = Uri.parse(aReclamboardApiUrl + 'api/user/get-vacancies/');
    // var url1;
    var response = await http.get(
      url,
      headers: {"X-CSRFToken": x_csrfToken},
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((blogId, blogData) {
      list.add(BillboardVacancyResponse(
          id: blogId,
          vendorId: blogData["vendorId"],
          title: blogData["title"],
          description: blogData["description"],
          latitude: blogData["latitude"],
          longitude: blogData["longitude"],
          price: blogData["price"],
          type: blogData["type"]));
    });
    print(list[0].id);
    setState(() {
      isLoading = false;
    });
    List<BillboardVacancyResponse> typeList;
    typeList = list.where((i) => i.type == "Digital").toList();
    int digitalCount = list.where((i) => i.type == "Digital").toList().length;
    int smallCount = list.where((i) => i.type == "Small").toList().length;
    int mediumCount = list.where((i) => i.type == "Medium").toList().length;
    int largeCount = list.where((i) => i.type == "Large").toList().length;
    print(typeList[0].type);    
    amountList.add(BillboardPackageAmount(billboardCount: digitalCount, billboardType: "Digital", barColor: "0xFFB71C1C"));
    amountList.add(BillboardPackageAmount(billboardCount: smallCount, billboardType: "Small", barColor: "0xFF00E676"));
    amountList.add(BillboardPackageAmount(billboardCount: mediumCount, billboardType: "Medium", barColor: "0xFFFDD835"));
    amountList.add(BillboardPackageAmount(billboardCount: largeCount, billboardType: "Large", barColor: "0xFF2196F3"));
    // for(BillboardVacancyResponse i in list){
    //   typeList = list.where((i) => i.type == "Digital");
    //   // if(i.type == "Digital"){
    //   //   typeList.add(i);
    //   // }
    //   print(typeList[0]);
    // } //chip
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
          : Stack(fit: StackFit.expand, children: <Widget>[
              Positioned(
                left: 65,
                top: 220,
                child: BillboardBarChartWidget(amountList: amountList),
              ),
              Column(
                children: [
                  OtherBillboardsListHeaderCard(context),
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
            ]),
    );
  }

  Widget buildItemsForListView(BuildContext context, int index) {
    // print(list[index].id);
    // return ListTile(
    //   title: Text(list[index].title, style: TextStyle(fontSize: 18)),
    //   subtitle: Text(list[index].description, style: TextStyle(fontSize: 12)),
    // );
    final vacancy = list[index];
    int remainder = index % 2;
    return Padding(
      padding: const EdgeInsets.only(
          top: 2.0, bottom: 2.0, left: 320.0, right: 320.0),
      child: Card(
        color: remainder == 0 ? Colors.grey[200] : Colors.brown[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        vacancy.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Description: ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        vacancy.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Latitude: ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        vacancy.latitude,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Longitude: ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        vacancy.longitude,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Billboard Type: ",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        vacancy.type,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
            ))
          ],
        ),
      ),
    );
  }
}
