class AReclamborUser {
  String email;
  String password;
  String firstName;
  String lastName;
  String type;
  // double longitude;
  // double latitude;
  // DocumentReference userId; 
  // DocumentReference mallId;
  // DocumentReference reference;

  AReclamborUser({required this.email,required this.password,required this.firstName,required this.lastName,required this.type});

  AReclamborUser.fromMap(Map<String, dynamic> map):
    email = map["email"],
    password = map["password"],
    firstName = map["firstName"],
    lastName = map["lastName"],
    type = map["type"];

  
  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'type': type

    };

  } 
  
  // FavouriteMall.fromSnapshot(DocumentSnapshot snapshot)
  //   : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {
      'email': email,
      'password': password
    };
  }
}