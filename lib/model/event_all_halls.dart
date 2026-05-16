

class EventAllHallsModel {
  final int? id;
  final String? name;
  final int? cityId;
  final int?  event_type_id;
  final String? capacity;
  final String? description;
  final String? location;
  final int? price;
  final String? images;

  EventAllHallsModel({
    this.id,
    this.name,
    this.cityId,
    this.capacity,
    this.description,
    this.location,
    this.price,
    this.images,
    this.event_type_id,
  });

  factory EventAllHallsModel.fromJson(Map<String, dynamic> json) {
    return EventAllHallsModel(
        id: json['id'],
        // لا تحتاج إلى استخدام 'data'
        name: json['name'],
        cityId: json['city_id'],
        event_type_id: json["event_type_id"],
        capacity: json['capacity'],
        description: json['description'],
        location: json['location'],
        price: json['price'],
        images: json["images"]["path"]
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'city_id': capacity,
      'description': description,
      'location': location,
      'price': price,


    };
  }

}