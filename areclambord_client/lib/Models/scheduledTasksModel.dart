class ScheduledTasksModel {
  String purchaseId;
  String task1Date;
  String task2Date;
  String task3Date;
  String task4Date;

  ScheduledTasksModel({required this.purchaseId,required this.task1Date,required this.task2Date,required this.task3Date,required this.task4Date});

  ScheduledTasksModel.fromMap(Map<String, dynamic> map):
    purchaseId = map["purchaseId"],
    task1Date = map["task1Date"],
    task2Date = map["task2Date"],
    task3Date = map["task3Date"],
    task4Date = map["task4Date"];

  
  Map<String, dynamic> toMap(){
    return {
      'purchaseId': purchaseId,
      'task1Date': task1Date,
      'task2Date': task2Date,
      'task3Date': task3Date,
      'task4Date': task4Date
    };

  } 
  
  // FavouriteMall.fromSnapshot(DocumentSnapshot snapshot)
  //   : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson(){
    return {
      'purchaseId': purchaseId,
      'task1Date': task1Date,
      'task2Date': task2Date,
      'task3Date': task3Date,
      'task4Date': task4Date
    };
  }
}