class LoginCredentialsModel {
  String email;
  String password;
  // double longitude;
  // double latitude;
  // DocumentReference userId; 
  // DocumentReference mallId;
  // DocumentReference reference;

  LoginCredentialsModel({required this.email,required this.password});

  LoginCredentialsModel.fromMap(Map<String, dynamic> map):
    email = map["email"],
    password = map["password"];

  
  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'password': password
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