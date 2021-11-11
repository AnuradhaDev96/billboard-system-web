import 'package:areclambord_client/Models/SessionLoggedInUser.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'createBillboardVacancyCard.dart';
import 'otherBillboardsByVendors.dart';
import 'publishedVendorBillboardsCard.dart';
import 'supportCenterCard.dart';
import 'supportImageCard.dart';
import 'vendorImageCard.dart';
import 'welcomeCard.dart';

// class DashboardVendorScreen extends StatefulWidget {
//   DashboardVendorScreen({Key key, @required this.sessionLoggedInUser}) : super(key: key);
//   final SessionLoggedInUser sessionLoggedInUser;
//   @override 
//   _DashboardVendorScreenState createState() => _DashboardVendorScreenState();
// }
class DashboardVendorScreen extends StatefulWidget {
  DashboardVendorScreen({Key? key, required this.sessionLoggedInUser}) : super(key: key);
  final SessionLoggedInUser sessionLoggedInUser;
  @override 
  _DashboardVendorScreenState createState() => _DashboardVendorScreenState();
}

class _DashboardVendorScreenState extends State<DashboardVendorScreen>{
  final _dashboardVendorScaffoldKey = GlobalKey<ScaffoldState>();
  late SessionLoggedInUser _sessionLoggedInUser;

  @override
  void initState() {
    // vacancyList = getBillboardVacancies();
    _sessionLoggedInUser = widget.sessionLoggedInUser;    
    super.initState();
    
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      key: _dashboardVendorScaffoldKey,
      body: StaggeredGridView.count(
        crossAxisCount: 3,//no of columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        padding: const EdgeInsets.only(top:5.0, bottom: 5.0, left: 5.0, right: 5.0),
        children: <Widget>[          
          WelcomeCard(_sessionLoggedInUser.firstName, _sessionLoggedInUser.lastName, _sessionLoggedInUser.email),
          PublishedVendorBillboardsCard(_sessionLoggedInUser.localId),
          CreateBillboardForSaleCard(_sessionLoggedInUser.localId),
          OtherBillboardsByVendors(),
          VendorImageCard(),          
          SupportImageCard(),
          SupportCenterCard()
        ],
        staggeredTiles: [
          const StaggeredTile.extent(3, 150.0),
          const StaggeredTile.extent(1, 160.00),
          const StaggeredTile.extent(2, 160.00),
          const StaggeredTile.extent(2, 160.00),
          const StaggeredTile.extent(1, 160.00),
          const StaggeredTile.extent(1, 130.00),
          const StaggeredTile.extent(2, 130.00)
          //(how many columns occupy, height of the tile)
        ],
      ),
    );
  }

  stackCard(String ctitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white24,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.album, size: 50),
            title: Text(
              ctitle,
              style: const TextStyle(fontSize: 25.0),
            ),
            subtitle: const Text(
              'Go to inventory',
              style: TextStyle(fontSize: 10.0),
            ),
          ),
          // ButtonBar(
          //   children: <Widget>[
          //     ElevatedButton(
          //       child: const Text("Go"),
          //       onPressed: (){}
          //     ),
          //     ElevatedButton(
          //       child: const Text("See"),
          //       onPressed: (){}
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

}