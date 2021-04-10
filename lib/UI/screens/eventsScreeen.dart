import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/events/EventWidget.dart';
import 'package:istemanipalapp/logic/models/Event.dart';

class EventScreen extends StatelessWidget {
  final List<Event> events;
  final String categoryName;

  EventScreen({this.events, this.categoryName});
  Widget renderBody() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: EventWidget(
            description: events[index].description,
            eventDateList: events[index].eventDateSet,
            name: events[index].name,
            registrationLink: events[index].registrationLink,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.categoryName)),
      body: this.renderBody(),
    );
  }
}
