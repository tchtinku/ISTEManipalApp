import 'package:intl/intl.dart';

class Date {
  String date;
  String month;
  String year;
  String time;

  Date(String datetime) {
    DateTime parsedDate = DateTime.parse(datetime).toLocal();
    this.date = DateFormat('d').format(parsedDate);
    this.month = DateFormat('MMMM').format(parsedDate);
    this.year = DateFormat('YYYY').format(parsedDate);
    this.time = DateFormat('H:m:ss').format(parsedDate);
  }
}
