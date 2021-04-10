import 'package:flutter/material.dart';
import 'package:istemanipalapp/UI/widgets/events/EventListWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class EventWidget extends StatelessWidget {
  final String name;
  final String description;
  final String registrationLink;
  final List eventDateList;
  EventWidget(
      {this.name, this.description, this.eventDateList, this.registrationLink});

  void lauchURl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.name,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(this.description),
        SizedBox(
          height: 20,
        ),
        this.eventDateList.length == 0
            ? EventDateListWidget(eventDateSet: this.eventDateList)
            : Container(),
        this.registrationLink != null
            ? TextButton(
                onPressed: () {
                  this.lauchURl(this.registrationLink);
                },
                child: Text('Register Now'))
            : Container(),
      ],
    );
  }
}
