// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/utils/TableWidget.dart';
import 'package:my_app/utils/Utility.dart';
import 'package:my_app/utils/Alert.dart';
import 'dart:async';



class TimerPageState extends StatefulWidget {
  const TimerPageState({super.key});

  @override
  TimerPage createState() => TimerPage();
}

class TimerPage extends State<TimerPageState> {
  var startTimerFn = Utility.startTimer;
  final totalTime = 30;
  var lastSavedTime, timerText;
  List<int> saveTimeArray = [];

  cancelCallback(){
    print("over");
    setState(() {
      timerText = 0;
    });
  }

  decerementCallback(count, timerInstance){
    setState(() {
        timerText = count;
        timerInstance = timerInstance;
    });
  }

  nextQuestionHandler(){
    setState(() {
      if(timerText > 0){
        var elapsedTime = lastSavedTime - timerText;
      lastSavedTime = timerText;
      saveTimeArray.add(elapsedTime);
      }else{
         showDialog<String>(
        context: context,
        builder: (BuildContext context) => const Alert(title: "Time's Up!", desc: "Please re-start the session")
      );
      }
    });
  }

  @override
  void initState(){
    super.initState();
    timerText = totalTime;
    Utility.startTimer(totalTime, cancelCallback, decerementCallback);

    lastSavedTime = totalTime;
  }

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
              child: Text(timerText != null?'${(timerText/60).floor()}:${timerText%60}':'0',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 60)),
            ),
            Container(
                padding: const EdgeInsets.all(20.0),
                child: TableWidget(data: saveTimeArray))
          ],
        ),
        persistentFooterButtons: <Widget>[
          SizedBox(
            child: ElevatedButton(
              onPressed: nextQuestionHandler,
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
