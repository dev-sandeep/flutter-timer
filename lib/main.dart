import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Competitive Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: const Text('Information about your exam',
                style: TextStyle(fontSize: 40)),
            padding: EdgeInsets.all(20.0),
          ),
          Flexible(
              child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(20.00),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Type exam name',
                      labelText: 'Exam Name',
                      // contentPadding: EdgeInsets.all(20.0)
                    ),
                  ),
                ),
              ),
            ],
          )),
          Flexible(
              child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(20.00),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'No. of questions',
                      labelText: 'Type Questions',
                      // contentPadding: EdgeInsets.all(20.0)
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(20.00),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Total Time',
                      labelText: 'Type total timer',
                      // contentPadding: EdgeInsets.all(20.0)
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
      persistentFooterButtons: <Widget>[
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
                onPressed: () {},
                child: const Text('Start!', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.all(50.0),
                    minimumSize: const Size.fromHeight(50),
                    side: BorderSide(
                  width: 1.0,
                )),
              ),
        )
      ],
    );
  }
}
