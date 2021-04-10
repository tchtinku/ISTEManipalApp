import 'package:istemanipalapp/logic/models/Date.dart';

class EventDate {
  String venue;
  Date startDate;
  Date endDate;

  EventDate.fromJson(Map json) {
    venue = json['venue'];
    startDate = Date(json['start_date']);
    if (json['end_date'] != null) {
      endDate = Date(json['end_date']);
    }
  }
}
