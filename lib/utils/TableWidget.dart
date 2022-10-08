import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key, 
    required this.data
    });

  final List<int> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        for (var i = 0; i < data.length; i++)
          TableRow(children: [
            TableCell(
                child: Container(
              color: i%2 == 0?const Color.fromARGB(255, 236, 236, 236):Colors.white,
              padding: const EdgeInsets.all(10),
              child: Text('Question ${i + 1}'),
            )),
            TableCell(
                child: Container(
              color: i%2 == 0?const Color.fromARGB(255, 236, 236, 236):Colors.white,
              padding: const EdgeInsets.all(10),
              child: Text('${data[i]} Sec.'),
            ))
          ])
      ],
    );
  }
}
