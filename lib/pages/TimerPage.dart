// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/utils/TableWidget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Competitive Timer'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text('Session Timer',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 40)),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text('09:10',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 60)),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const TableWidget(data: [26, 56, 12, 45])
            )
          ],
        ),
        persistentFooterButtons: <Widget>[
          SizedBox(
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(
                    width: 1.0,
                  )),
              child:
                  const Text('Question Done', style: TextStyle(fontSize: 20)),
            ),
          )
        ]);
  }
}
