

class SecondaryServiceModel {
  final int id;
  final int service_id;
  final String name;
  final int Price;
    bool selected;

  SecondaryServiceModel ({
    required this.id,
    required this.service_id,
    required this.name,
    required this.Price,
    required this.selected,
  });

  factory SecondaryServiceModel.fromJson(Map<String, dynamic> jsonData) {
    return SecondaryServiceModel(
      id: jsonData["id"],
      service_id: jsonData["service_id"] ?? 0,
      name: jsonData["name"],
        Price: jsonData["price"] ,
        selected: (jsonData["selected"] ?? 0) == 1); // Initialize selected field here
  }
}