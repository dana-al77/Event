class ServicesModel {
  final int id;
  final String? name;


  ServicesModel(
      {  required this.name,
        required this.id, });

  factory ServicesModel.fromJson(jsonData){

    return ServicesModel(
      id: jsonData["id"],
      name: jsonData["name"],

    );
  }

}