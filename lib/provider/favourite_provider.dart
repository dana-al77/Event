import 'package:flutter/material.dart';
import '../model/Evventmodel.dart';

class FavoriteEventsProvider extends ChangeNotifier {
  List<EventByCityModel> _favoriteEvents = [];

  List<EventByCityModel> get favoriteEvents => _favoriteEvents;

  void toggleFavorite(EventByCityModel event) {
    if (_favoriteEvents.contains(event)) {
      _favoriteEvents.remove(event);
    } else {
      _favoriteEvents.add(event);
    }
    notifyListeners();
  }
}
