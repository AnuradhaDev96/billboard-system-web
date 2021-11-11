// import 'dart:io';
// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart';
// import 'package:path/path.dart';
// import 'package:file_picker/file_picker.dart';
// // import 'package:firebase/firebase.dart' as fb;
// import 'package:firebase_core/firebase_core.dart';

// class StorageController {
//   static final StorageController _storageController =  StorageController._internal();
//   // final Uint8List image;
//   // FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

//   // StorageController({this.image});
   
//   StorageController._internal();

//   factory StorageController(){
//     return _storageController;
//   }

//   Future<String> uploadBillboardDesign(PlatformFile file) async {
//     Uuid designId = new Uuid();
//     // print(designId.toString());
//     // String saveAs = "dddd-001.jpg";
//     print(file.extension);
//     print(file.name);
//     print(file.path);
//     String saveAs = designId.v1().toString() + "." + file.extension;
//     print(saveAs);

//     UploadTask task = FirebaseStorage.instance.ref().child("Designs/$saveAs").putData(file.bytes);

//     // FirebaseApp app = await Firebase.initializeApp(
//     //   options: const FirebaseOptions(
//     //     apiKey: 'AIzaSyAC2i-lJjssOFI3NG91p387JbbZrMI76ew',
//     //     authDomain: 'areclamborddb.firebaseapp.com',
//     //     databaseURL: 'https://areclamborddb-default-rtdb.firebaseio.com',
//     //     projectId: 'areclamborddb',
//     //     storageBucket: 'areclamborddb.appspot.com',
//     //     messagingSenderId: '955295904281',
//     //     appId: '1:955295904281:web:d5be583565635089c67088',
//     //     measurementId: 'G-FB9YH4EMKH'
//     //     ));

//     // FirbaseApp app = await 
//     // FirebaseStorage storage = FirebaseStorage(app: app, storageBucket: 'gs://areclamborddb.appspot.com');

//     // final storageReference = fb.storage().ref('Designs/');
//     // await storageReference.putD
//     // TaskSnapshot taskSnapshot = await storage.ref().child("Designs").child(saveAs).putData(file.bytes); 
//     // await FirebaseStorage.instance.ref('Designs/$saveAs').putData(file.bytes); 


//     // String designUrl = await taskSnapshot.ref.getDownloadURL();

//     return "Hii";  

//   }
// }