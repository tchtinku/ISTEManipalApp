import 'package:flutter/material.dart';
import 'package:istemanipalapp/logic/models/Date.dart';

class EventDateListWidget extends StatelessWidget {
  final List eventDateSet;
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
      Date startDate = Date(eventDate['start_date']);
      Date endDate;
      if (eventDate['end_date'] != null) {
        endDate = Date(eventDate['end_date']);
      }
      table.children.add(TableRow(children: [
        TableCell(child: Text(eventDate['venue'])),
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
