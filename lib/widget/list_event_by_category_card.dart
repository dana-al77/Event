import 'package:flutter/material.dart';
import 'package:untitled11/model/event_all_halls.dart';
import 'package:untitled11/widget/event_card_category.dart';
import '../model/Evventmodel.dart';
import '../model/event_by_category.dart';
import 'EventCard.dart';
import 'event_card_all.dart';

class ListEventCardByCategory extends StatelessWidget {
  final List<EventByCategorymodel> Events;

  ListEventCardByCategory({required this.Events});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: Events.length, (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2

          ),
          child: EventCardByCategory(Event: Events[index],),
        );
      },
      ),
    );
  }
}