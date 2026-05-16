import 'package:flutter/material.dart';
import '../model/Evventmodel.dart';
import 'EventCard.dart';

class ListEventCardByCity extends StatelessWidget {
  final List<EventByCityModel> Events;

  ListEventCardByCity({required this.Events});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: Events.length, (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2

          ),
          child: EventCardByCity(Event: Events[index],),
        );
      },
      ),
    );
  }
}