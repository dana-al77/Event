
  class Countrymodel {
  final int id;
  final String name;
  final String imagePath;

  Countrymodel({
  required this.id,
  required this.name,
  required this.imagePath,
  });

  factory Countrymodel.fromJson(Map<String, dynamic> json) {
  return Countrymodel(
  id: json['id'],
  name: json['name'],
  imagePath: json['images']['path'], // Assuming imagePath is under images path
  );
  }
  }