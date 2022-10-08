// ignore: file_names
import 'dart:ffi';

import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
      super.key,
      required this.data
    });

    final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: const [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Cell1'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Cell21'),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Cell11'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Cell12'),
          ),
        ])
      ],
    );
  }
}
