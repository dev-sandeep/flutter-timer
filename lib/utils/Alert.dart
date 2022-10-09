import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.title,
    required this.desc,
    this.proceed
  });

  final String title;
  final String desc;
  final VoidCallback? proceed; // nullable and optional

  onProceedHandler(context){
    Navigator.pop(context, 'OK');
    if(proceed != null){
      return proceed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(desc),
      actions: <Widget>[
        // TextButton(
        //   onPressed: () => Navigator.pop(context, 'Cancel'),
        //   child: const Text('Cancel'),
        // ),
        TextButton(
          onPressed: () => {onProceedHandler(context)},
          child: const Text('OK'),
        ),
      ],
    );
  }
}
