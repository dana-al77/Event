import 'package:flutter/material.dart';
import 'package:untitled11/model/event_all_halls.dart';
import '../model/Evventmodel.dart';
import 'EventCard.dart';
import 'event_card_all.dart';

class ListEventCardAllHAlls extends StatelessWidget {
  final List<EventAllHallsModel> Events;

  ListEventCardAllHAlls({required this.Events});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: Events.length, (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2

          ),
          child: EventCardAllHalls(Event: Events[index],),
        );
      },
      ),
    );
  }
}