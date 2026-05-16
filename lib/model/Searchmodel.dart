class Searchmodel {
  final int id;
  final String name;
  final int cityId;
  final String capacity;
  final String description;
  final String location;
  final int price;

  Searchmodel({
    required this.id,
    required this.name,
    required this.cityId,
    required this.capacity,
    required this.description,
    required this.location,
    required this.price,
  });

  factory Searchmodel.fromJson(Map<String, dynamic> json) {
    return Searchmodel(
      id: json['id'],
      name: json['name'],
      cityId: json['city_id'],
      capacity: json['capacity'],
      description: json['description'],
      location: json['location'],
      price: json['price'],
    );
  }
}
