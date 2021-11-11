class PurchaseBillboard {
  String billboardId;
  String customerName;
  String customerEmail;
  String customerContactNo;
  String designLink;
  String packageType;
  String customerId;
  // double longitude;
  // double latitude;
  // DocumentReference userId; 
  // DocumentReference mallId;
  // DocumentReference reference;

  PurchaseBillboard({required this.billboardId,required this.customerId,required this.customerName,required this.customerEmail,required this.customerContactNo,required this.designLink,required this.packageType});

  PurchaseBillboard.fromMap(Map<String, dynamic> map):
    billboardId = map["billboardId"],
    customerName = map["customerName"],
    customerEmail = map["customerEmail"],
    customerContactNo = map["customerContactNo"],
    designLink = map["designLink"],
    packageType = map["packageType"],
    customerId = map["customerId"];

  
  Map<String, dynamic> toMap(){
    return {
      'billboardId': billboardId,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerContactNo': customerContactNo,
      'designLink': designLink,
      'packageType': packageType,
      'customerId': customerId
    };

  } 
  
  // FavouriteMall.fromSnapshot(DocumentSnapshot snapshot)
  //   : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {
      'billboardId': billboardId,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerContactNo': customerContactNo,
      'designLink': designLink,
      'packageType': packageType,
      'customerId': customerId
    };
  }
}