import 'package:flutter/material.dart';

class SpinnerWidget extends StatelessWidget {
  final Color color;
  SpinnerWidget({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: this.color,
      ),
    );
  }
}
