import 'package:areclambord_client/Models/billboardVacancyResponse.dart';
import 'package:areclambord_client/views/CustomerUI/ProgressEvaluation/evaluateAdProgress.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import 'package:url_launcher/url_launcher.dart';

// import '../vacancyListView.dart';

class BillboardDetailsCard extends StatelessWidget {
  BillboardDetailsCard(this.context, this.isDetailsLoading, this.billboardVacancyResponse, this.purchaseId);

final String purchaseId;
final BillboardVacancyResponse billboardVacancyResponse;
bool isDetailsLoading = false;
final BuildContext context;
// static String title, description, longitude, latitude, type = "-"; 
final _zsformKey = GlobalKey<FormState>();


  evaluateBillboardProgressButton() {
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 10, right: 10),
      // width: double.infinity,
      child: MaterialButton(
        hoverElevation: 20,
        minWidth: 200,
        height: 40,  
        elevation: 5,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.orange[400],
        child: const Text(
          "Evaluate Progress of the Billboard",
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
            MaterialPageRoute(builder: (context) => EvaluateAdProgress(selectedPurchaseId: purchaseId, billboardVacancyResponse: billboardVacancyResponse)),
          );                
        }
      ),
    );
  }

  backToHomeButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 10, right: 10),
      child: MaterialButton(
        hoverElevation: 20.0, 
        minWidth: 200,
        height: 40,  
        elevation: 5 ,      
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
          // if (_formKey.currentState.validate()) {
          //   //addMall();
            Navigator.pop(context);
          // }
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(builder: (context) => DashboardVendorScreen()),
          //   MaterialPageRoute(builder: (context) => PromotersDetails(),
          // );                
        }
      ),
    );
  }

  showLocationButton() {
    double lat = double.parse(billboardVacancyResponse.latitude);
    double long = double.parse(billboardVacancyResponse.longitude);
    return Padding(
      padding: const EdgeInsets.only(top:8, bottom: 8, left: 10, right: 10),
      child: MaterialButton(
        hoverElevation: 20.0, 
        minWidth: 200,
        height: 40,  
        elevation: 5 ,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0)
        ),
        color: Colors.grey[800],
        child: const Text(
          "Show Location",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white
          ),
        ),
        onPressed: (){
          _launchMapUrlOfUser(lat, long);
        }
      ),
    );
  }

  void _launchMapUrlOfUser(double lat, double long) async {
    String url = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    if (kIsWeb) {
      html.window.open(url, "_blank");
    } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        print("URL is not available");
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 250.0, right: 250.0),
                  child: Card(
                    color: Colors.orange[100],
                    elevation: 10,
                    // child: SingleChildScrollView( 
                    //elevation: 10.0,
                child: Padding(                
                  //padding: EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 50.0, right: 50.0),
                child: isDetailsLoading                 
                ? const Center(
                            child: CircularProgressIndicator(),
                )
                : Column(                     
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Details of Selected Billboard",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),                  
                      ],
                    ),
                    const SizedBox(height: 8,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[                  
                    //     Text("PurchaseId:",
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //     color:Colors.grey[700]),),
                    //     Text(purchaseId,
                    //     style: TextStyle(
                    //       fontSize: 15,
                    //     color:Colors.grey[700]),)
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[                  
                        Text("Title:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        color:Colors.grey[700]),),
                        Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.title,
                        style: TextStyle(
                          fontSize: 15,
                        color:Colors.grey[700]),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Description:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        color:Colors.grey[700]),),
                        Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.description,
                        style: TextStyle(
                          fontSize: 15,
                        color:Colors.grey[700]),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Latitude:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        color:Colors.grey[700]),),
                        Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.latitude,
                        style: TextStyle(
                          fontSize: 15,
                        color:Colors.grey[700]),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Longitude:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        color:Colors.grey[700]),),
                        Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.longitude,
                        style: TextStyle(
                          fontSize: 15,
                        color:Colors.grey[700]),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Billboard Type:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        color:Colors.grey[700]),),
                        Text(billboardVacancyResponse == null ? "  -  " : billboardVacancyResponse.type,
                        style: TextStyle(
                          fontSize: 15,
                        color:Colors.grey[700]),)
                      ],
                    ),
                    // SizedBox(
                    //   height: 15.0,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 0, right: 0),
                          // child: Form(
                          // key: _zsformKey,
                          child: billboardVacancyResponse.id == ""
                              ? Text(
                              "Select a purchased billboard to view details",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red[900]),) 
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  evaluateBillboardProgressButton(), 
                                  showLocationButton() 
                                ],
                              )                        
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0, bottom: 8.0, left: 0, right: 0),
                          // child: Form(
                          // key: _zsformKey,
                          child: backToHomeButton(context),             
                          ),
                      ],
                    ),
                    
                    ],
        )
                )
                // ),
                ),
                  
                );
  }
  
}