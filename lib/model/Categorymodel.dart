
class Categorymodel {
  final int id;
  final String name;
  final String imagePath;

  Categorymodel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) {
    return Categorymodel(
      id: json['id'],
      name: json['name'],
      imagePath: json['images']['path'], // Assuming imagePath is under images path
    );
  }
}







/*class Data {
  int? id;
  String? name;
  String? imagePath;

  Data({this.id, this.name, this.imagePath});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['images'] != null ? json['images']['path'].replaceAll('\\', '/') : null;
    // Replace '\\' with '/' in the image path to ensure correct format for Flutter
  }
*/
// Modify the toJson method if necess
/*
class Categorymodel {
  final String? imagecategory;
  final String? namecategory;


  Categorymodel(
      { required this.imagecategory, required this.namecategory, });

  factory Categorymodel.fromJson(jsonData){

    return Categorymodel(

      namecategory: jsonData["namecategory"],
      imagecategory: jsonData["imagecategory"],
    );
  }

}
 */