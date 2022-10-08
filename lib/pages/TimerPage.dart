import 'package:flutter/material.dart';

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
              padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: const [
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Cell1'),
                    ),
                     Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Cell2'),
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
              ),
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