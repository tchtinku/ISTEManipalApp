import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/events/EventWidget.dart';

class EventScreen extends StatelessWidget {
  Widget renderBody(Map details) {
    List<EventWidget> events = [];
    for (var event in details['events']) {
      EventWidget eventWidget = EventWidget(
        name: event['name'],
        description: event['description'],
        eventDateList: event['event_date_set'],
        registrationLink: event['registration_link'],
      );

      events.add(eventWidget);
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: events[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map details = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(details['category_name'])),
      body: this.renderBody(details),
    );
  }
}
