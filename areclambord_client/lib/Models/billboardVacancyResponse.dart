// import 'package:firebase_database/firebase_database.dart';

class BillboardVacancyResponse {
  String id;
  String vendorId;
  String title;
  String description;
  String longitude;
  String latitude;
  String price;
  String type;


  BillboardVacancyResponse(
      {required this.id,
      required this.vendorId,
      required this.title,
      required this.description,
      required this.longitude,
      required this.latitude,
      required this.price,
      required this.type});

    

  // BillboardVacancyResponse.fromSnapshot(DataSnapshot snapshot) :
  //   id = snapshot.key,
  //   vendorId = snapshot.value["vendorId"],
  //   title = snapshot.value["imageUrl"],
  //   description = snapshot.value["caption"],
  //   longitude = snapshot.value["longitude"],
  //   latitude = snapshot.value["latitude"],
  //   price = snapshot.value["price"],
  //   type = snapshot.value["type"];

  void clearInstance() {
    id = "";
    vendorId = "";
    title = "";
    description = "";
    longitude = "";
    latitude = "";
    price = "";
    type = "";
  }
}
