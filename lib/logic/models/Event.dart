import 'package:istemanipalapp/logic/models/EventDate.dart';

class Event {
  String name;
  String description;
  String registrationLink;
  List<EventDate> eventDateSet = [];

  Event.fromJson(Map json) {
    name = json['name'];
    description = json['description'];
    registrationLink = json['registration_link'];
    for (var eventDate in json['event_date_set']) {
      eventDateSet.add(EventDate.fromJson(eventDate));
    }
  }
}
