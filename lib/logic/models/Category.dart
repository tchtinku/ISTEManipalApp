import 'package:istemanipalapp/logic/models/Date.dart';
import 'package:istemanipalapp/logic/models/Event.dart';

class Category {
  String name;
  Date startDate;
  Date endDate;
  String poster;
  String description;
  String registrationLink;
  List<Event> events = [];

  Category.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    startDate = Date(json['start_date']);

    if (json['endDate'] != null) {
      endDate = Date(json['end_date']);
    }
    poster = json['poster'];
    description = json['description'];
    registrationLink = json['registraton_link'];

    for (var event in json['events']) {
      events.add(Event.fromJson(event));
    }
  }
}
