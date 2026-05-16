

  class EventByCategorymodel {
  final int? id;
  final String? name;
  final int? city_id;
  final int? event_type_id;
  final String? capacity;
  final String? description;
  final String? location;
  final int? price;
   final String? imagsPath;

  EventByCategorymodel({
  required this.id,
  required this.name,
  required this.city_id,
    required this.event_type_id,
  required this.capacity,
  required this.description,
  required this.location,
  required this.price,
  required this.imagsPath
  });

  factory EventByCategorymodel.fromJson(jsonData){

  return EventByCategorymodel(
  id: jsonData["id"],
  name: jsonData["name"],
  city_id: jsonData["city_id"],
  event_type_id: jsonData["event_type_id"],
  capacity: jsonData["capacity"],
  description: jsonData["description"],
  location: jsonData["location"],
  price: jsonData["price"],
   imagsPath: jsonData["images"]["path"]

  );
  }
  }