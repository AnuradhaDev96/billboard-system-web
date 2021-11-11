import 'package:areclambord_client/Models/SessionLoggedInUser.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'customImageACard.dart';
import 'purchaseBillboardForCampaignCard.dart';
import 'otherBillboardsByVendors.dart';
import 'publishedVendorBillboardsCard.dart';
import 'supportCenterCard.dart';
import 'supportImageCard.dart';
import 'customImageBCard.dart';
import 'welcomeCard.dart';

// class DashboardVendorScreen extends StatefulWidget {
//   DashboardVendorScreen({Key key, @required this.sessionLoggedInUser}) : super(key: key);
//   final SessionLoggedInUser sessionLoggedInUser;
//   @override 
//   _DashboardVendorScreenState createState() => _DashboardVendorScreenState();
// }
class DashboardCustomerScreen extends StatefulWidget {
  const DashboardCustomerScreen({Key? key, required this.sessionLoggedInUser}) : super(key: key);
  final SessionLoggedInUser sessionLoggedInUser;
  @override 
  _DashboardCustomerScreenState createState() => _DashboardCustomerScreenState();
}

class _DashboardCustomerScreenState extends State<DashboardCustomerScreen>{
  final _dashboardVendorScaffoldKey = GlobalKey<ScaffoldState>();
  late SessionLoggedInUser? _sessionLoggedInUser;

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
          WelcomeCard(_sessionLoggedInUser!.firstName, _sessionLoggedInUser!.lastName, _sessionLoggedInUser!.email),
          CustomImageACard(),   
          PurchaseBillboardForCampaign(_sessionLoggedInUser!.localId),
          PurchasedBillboardsByCustomerCard(_sessionLoggedInUser!.localId),
          CustomImageBCard(),          
          SupportImageCard(),
          SupportCenterCard()
        ],
        staggeredTiles: const [
          StaggeredTile.extent(3, 150.0),
          StaggeredTile.extent(1, 160.00),
          StaggeredTile.extent(2, 160.00),
          StaggeredTile.extent(2, 160.00),
          StaggeredTile.extent(1, 160.00),
          StaggeredTile.extent(1, 130.00),
          StaggeredTile.extent(2, 130.00)
          //(how many columns occupy, height of the tile)
        ],
      ),
    );
  }

}