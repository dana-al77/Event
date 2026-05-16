class MyBooking {
  int id; String startTime; int countHours; int totalCost; String status; int userId; int hallId; int eventTypeId; Hall hall; List<SecondaryService> secondaryServices;
 // late final bool isCancelled;

  MyBooking({ required this.id, required this.startTime, required this.countHours, required this.totalCost, required this.status, required this.userId, required this.hallId, required this.eventTypeId, required this.hall,
  required this.secondaryServices,
    //required this.isCancelled
});

factory MyBooking.fromJson(Map<String, dynamic> json) {
  return MyBooking( id: json['id'],
  startTime: json['start_time'],
    countHours: json['count_hours'],
    totalCost: json['total_cost'],
    status: json['status'],
    userId: json['user_id'],
    hallId: json['hall_id'],
    eventTypeId: json['event_type_id'],
    hall: Hall.fromJson(json['hall']),
  //  isCancelled: json['isCancelled'],
    secondaryServices: List<SecondaryService>.from(json['secondrary_services'].map((x) => SecondaryService.fromJson(x))), ); } }

class Hall { int id; String name; int cityId; int eventTypeId; String capacity; String description; String location; int price;

Hall({ required this.id,required this.name,required this.cityId,
  required this.eventTypeId,required this.capacity,required this.description,required this.location,
  required this.price, });

factory Hall.fromJson(Map<String, dynamic> json) { return Hall( id: json['id'], name: json['name'], cityId: json['city_id'], eventTypeId: json['event_type_id'], capacity: json['capacity'], description: json['description'], location: json['location'], price: json['price'], ); } }

class SecondaryService { int id; int serviceId; String name; int price; int selected;

SecondaryService({required this.id,required this.serviceId,required this.name,required this.price,required this.selected, });

factory SecondaryService.fromJson(Map<String, dynamic> json) { return SecondaryService( id: json['id'], serviceId: json['service_id'], name: json['name'], price: json['price'], selected: json['selected'], ); } }