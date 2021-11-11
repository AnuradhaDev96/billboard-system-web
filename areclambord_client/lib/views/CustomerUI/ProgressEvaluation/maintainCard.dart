import 'dart:js';

import 'package:areclambord_client/Commons/constants.dart';
import 'package:flutter/material.dart';

import 'sheetButton.dart';
import 'showTopUpSheet.dart';

class MaintainAdCampaignCard extends StatelessWidget {
  MaintainAdCampaignCard(this.isEnabled);

  final bool isEnabled;
  static TextEditingController cardNumberController = TextEditingController();
  static TextEditingController expDateController = TextEditingController();
  static TextEditingController cvcController = TextEditingController();

  // final _paymentFormKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  showTopUpSheet(BuildContext context) async {
    // Position position = Position(latitude:_center.latitude, longitude: _center.longitude);
    // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(_center.latitude, _center.longitude);
    showModalBottomSheet(
        backgroundColor: Colors.black.withOpacity(0),
        context: context,
        builder: (context) => ShowTopUpSheet(),
      );
  }

  maintainBillboardButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
          hoverElevation: 40.0,
          minWidth: double.infinity,
          height: 60,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0)),
          color: isEnabled == true ? Colors.green[400] : disabledColor,
          child: Text(
            "Maintain/Top-up the Campaign",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
          onPressed: () {
            showTopUpSheet(context);
            // if (_formKey.currentState.validate()) {
            //   //addMall();

            // }
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
            //   MaterialPageRoute(builder: (context) => PromotersDetails(),
            // );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 6.0, bottom: 6.0, left: 320.0, right: 320.0),
      child: Card(
          color: isEnabled == true ? Colors.green[100] : Colors.grey[200],
          elevation: isEnabled == true ? 25 : 10,
          // child: SingleChildScrollView(
          //elevation: 10.0,
          child: Padding(
              //padding: EdgeInsets.all(5.0),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 50.0, right: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Maintain the Same Campaign",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: isEnabled == true
                                ? Colors.green[900]
                                : Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "The reach of the advertisement is excellent.\n Hence we recommend either maintain the same campaign or top-up.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: isEnabled == true
                                ? Colors.green[600]
                                : Colors.grey[700]),
                      )
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 60.0, right: 60.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // userName,
                            // password,
                            SizedBox(
                              height: 8.0,
                            ),
                            isEnabled == true
                                ? maintainBillboardButton(context)
                                : Text(
                                    "No action is allowed",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                          ],
                        )),
                  ),
                ],
              ))
          // ),
          ),
    );
  }
}
