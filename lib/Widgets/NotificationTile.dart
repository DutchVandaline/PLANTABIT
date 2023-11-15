import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String inputMessage;
  NotificationTile({required this.inputMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(child: Text(inputMessage)),
        ),
      ),
    );
  }
}