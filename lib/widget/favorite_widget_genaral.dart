import 'package:flutter/material.dart';
import 'package:untitled11/model/event_all_halls.dart';

import 'list_view_event_all_bilder.dart';

class FavouriteWidgetGeneral extends StatefulWidget {
  const FavouriteWidgetGeneral({super.key, 
    required EventAllHallsModel Event,
    required bool isFavorite,
    required void Function(EventAllHallsModel event) onFavoriteToggle});

  @override
  State<FavouriteWidgetGeneral> createState() => _FavouriteWidgetGeneralState();
}

class _FavouriteWidgetGeneralState extends State<FavouriteWidgetGeneral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListEventCardBuilderAll());
  }
}
