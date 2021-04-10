import 'package:flutter/material.dart';
import 'package:istemanipalapp/logic/models/Date.dart';
import 'package:istemanipalapp/logic/models/EventDate.dart';

class EventDateListWidget extends StatelessWidget {
  final List<EventDate> eventDateSet;
  EventDateListWidget({this.eventDateSet});
  @override
  Widget build(BuildContext context) {
    //create table
    Table table = Table(
      children: [
        TableRow(children: [
          TableCell(child: Text('Venue')),
          TableCell(
            child: Text('Start Date'),
          ),
          TableCell(child: Text('End Date')),
        ])
      ],
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
    );

    //Add the rows
    for (var eventDate in eventDateSet) {
      Date startDate = eventDate.startDate;
      Date endDate;
      if (eventDate.endDate != null) {
        endDate = eventDate.endDate;
      }
      table.children.add(TableRow(children: [
        TableCell(child: Text(eventDate.venue)),
        TableCell(
          child: Text(startDate.date + " " + startDate.month),
        ),
        TableCell(
          child: endDate == null
              ? Text('-----')
              : Text(endDate.date + " " + endDate.month),
        )
      ]));
    }

    return table;
  }
}
