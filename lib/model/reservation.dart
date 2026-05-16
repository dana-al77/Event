class Reservations {
  String? message;
  Reservation? reservation;
  Wallet? wallet;
  int? status;

  Reservations({this.message, this.reservation, this.wallet, this.status});

  Reservations.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    reservation = json['reservation'] != null ? new Reservation.fromJson(json['reservation']) : null;
    wallet = json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Reservation {
  int? userId;
  int? hallId;
  int? eventTypeId;
  String? startTime;
  int? countHours;
  int? totalCost;
  String? status;
  int? id;

  Reservation({this.userId, this.hallId, this.eventTypeId, this.startTime, this.countHours, this.totalCost, this.status, this.id});

  Reservation.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    hallId = json['hall_id'];
    eventTypeId = json['event_type_id'];
    startTime = json['start_time'];
    countHours = json['count_hours'];
    totalCost = json['total_cost'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['hall_id'] = this.hallId;
    data['event_type_id'] = this.eventTypeId;
    data['start_time'] = this.startTime;
    data['count_hours'] = this.countHours;
    data['total_cost'] = this.totalCost;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}

class Wallet {
  int? userId;
  int? value;
  bool? type;
  String? description;
  int? id;

  Wallet({this.userId, this.value, this.type, this.description, this.id});

  Wallet.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    value = json['value'];
    type = json['type'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['value'] = this.value;
    data['type'] = this.type;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}