//@todo fix this widget

import 'package:flutter/material.dart';

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({
    super.key, 
  // required this.context,
  required this.title,
  required this.description,
  required this.onApprove
  });

// final BuildContext context;
  final String title;
  final String description;
  final onApprove;

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text("Warning"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(title),
            Text(description),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
            onApprove(context);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ],
    );
  }
}
