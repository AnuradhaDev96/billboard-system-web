class BillboardVacancy {
  String title;
  String vendorId;
  String description;
  String longitude;
  String latitude;
  String price;
  String type;
  // double longitude;
  // double latitude;
  // DocumentReference userId; 
  // DocumentReference mallId;
  // DocumentReference reference;

  BillboardVacancy({required this.title,required this.vendorId,required this.description,required this.longitude,required this.latitude,required this.price,required this.type});

  BillboardVacancy.fromMap(Map<String, dynamic> map):
    title = map["title"],
    vendorId = map["vendorId"],
    description = map["description"],
    longitude = map["longitude"],
    latitude = map["latitude"],
    price = map["price"],
    type = map["type"];

  
  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'vendorId': vendorId,
      'description': description,
      'longitude': longitude,
      'latitude': latitude,
      'price': price,
      'type': type

    };

  } 
  
  // FavouriteMall.fromSnapshot(DocumentSnapshot snapshot)
  //   : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {
      'title': title,
      'vendorId': vendorId,
      'description': description,
      'longitude': longitude,
      'latitude': latitude,
      'price': price,
      'type': type
    };
  }
  
}