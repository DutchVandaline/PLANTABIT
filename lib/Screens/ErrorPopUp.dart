import 'package:flutter/material.dart';

class ErrorPopUp extends StatelessWidget {
  final String inputString;
  ErrorPopUp({required this.inputString});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        "오류",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      content: Text(
        inputString,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: InkWell(
            child: Center(child: Text("확인")),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
