// import 'package:firebase_database/firebase_database.dart';

class PurchasedBillboardsResponse {
  String customerContactNo;
  String customerEmail;
  String customerName;
  String designLink;
  String packageType;
  String id;
  String billboardId;

  PurchasedBillboardsResponse({required this.id,required this.customerContactNo,required this.customerEmail,required this.customerName,required this.designLink,required this.packageType,required this.billboardId});

  // PurchasedBillboardsResponse.fromSnapshot(DataSnapshot snapshot) :
  //   id = snapshot.key,
  //   customerContactNo = snapshot.value["customerContactNo"],
  //   customerEmail = snapshot.value["customerEmail"],
  //   customerName = snapshot.value["customerName"],
  //   designLink = snapshot.value["designLink"],
  //   billboardId = snapshot.value["billboardId"],
  //   packageType = snapshot.value["packageType"];
}