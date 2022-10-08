import 'dart:ffi';

import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  
  TextFieldForm({
      super.key,
      required this.hintText,
      required this.labelText,
      required this.textController,
    });

  final String hintText;
  final String labelText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.00),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText
          // contentPadding: EdgeInsets.all(20.0)
        ),
      ),
    );
  }
}
