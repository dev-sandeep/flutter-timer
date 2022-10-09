import 'package:flutter/material.dart';
import 'dart:async';

class BackBtnWidget extends StatelessWidget{
  BackBtnWidget({super.key, this.childWidget, this.callback});
  final childWidget;
  final callback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: childWidget, onWillPop: () async {callback(); return false;});
  }
}