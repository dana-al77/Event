class FavouriteModel {
  final int id;
  final String name;
  final String location;
  final String capacity;
  final String description;
  final int price;
  final String imagePath;

  FavouriteModel({
    required this.id,
    required this.name,
    required this.location,
    required this.capacity,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      capacity: json['capacity'],
      description: json['description'],
      price: json['price'],
      imagePath: json['images']['path'], // Assuming imagePath is under images path

    );
  }
}