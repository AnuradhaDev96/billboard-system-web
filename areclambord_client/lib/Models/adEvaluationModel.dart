class AdEvaluationModel {
  double latitude;
  double longitude;
  String billboardCategory;

  AdEvaluationModel({required this.billboardCategory, required this.latitude, required this.longitude});

  Map<String, dynamic> toMap(){
    return {
      'billboardCategory': billboardCategory,
      'latitude': latitude,
      'longitude': longitude
    };

  } 
}