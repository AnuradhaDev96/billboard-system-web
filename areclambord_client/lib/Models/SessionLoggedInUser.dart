class SessionLoggedInUser {
  String email;
  String localId;
  String firstName;
  String lastName;
  String type;
  // double longitude;
  // double latitude;
  // DocumentReference userId; 
  // DocumentReference mallId;
  // DocumentReference reference;

  SessionLoggedInUser({required this.email,required this.localId,required this.firstName,required this.lastName,required this.type});

  SessionLoggedInUser.fromMap(Map<String, dynamic> map):
    email = map["email"],
    localId = map["localId"],
    firstName = map["firstName"],
    lastName = map["lastName"],
    type = map["type"];

  
  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'localId': localId,
      'firstName': firstName,
      'lastName': lastName,
      'type': type

    };

  } 
  
  // FavouriteMall.fromSnapshot(DocumentSnapshot snapshot)
  //   : this.fromMap(snapshot.data, reference: snapshot.reference);

  // toJson(){
  //   return {
  //     'email': email,
  //     'password': accessToken
  //   };
  // }
}