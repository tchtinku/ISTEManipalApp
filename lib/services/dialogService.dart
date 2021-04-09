import 'package:flutter/material.dart';
import 'package:istemanipalapp/services/navigationService.dart';
import 'package:istemanipalapp/services/locator.dart';

class DialogService {
  void showAlertDialog(String title, String message) {
    // flutter defined function
    showDialog(
      context: locator<NavigationService>().navigatorKey.currentContext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
