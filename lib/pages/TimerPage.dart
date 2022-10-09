// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_app/utils/TableWidget.dart';
import 'package:my_app/utils/Utility.dart';
import 'package:my_app/utils/Alert.dart';
import 'package:my_app/utils/ConfirmDialogWidget.dart';
import 'package:my_app/utils/BackBtnWidget.dart';
import 'package:my_app/pages/HomePage.dart';
import 'dart:async';

class TimerPageState extends StatefulWidget {
  const TimerPageState({super.key, required this.totalTimeParam, required this.totalQuestion});

  final int totalTimeParam;
  final int totalQuestion;

  @override
  TimerPage createState() => TimerPage();
}

class TimerPage extends State<TimerPageState> {
  var startTimerFn = Utility.startTimer;

  var lastSavedTime, timerText, timerInstance;
  List<int> saveTimeArray = [];

  cancelTimer() {
    setState(() {
      timerInstance.cancel();
    });
  }

  backNavHandler(buildContext) {
    print(timerText);
    if (timerText > 0) {
      showDialog<String>(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Are you sure!"),
                  Text("You want to abandon this session?"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          );
        },
      );
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  cancelCallback() {
    setState(() {
      timerText = 0;
    });
  }

  decerementCallback(count, timerInstance) {
    setState(() {
      timerText = count;
    });
  }

  nextQuestionHandler() {
    setState(() {
      if (timerText > 0) {

        //check if there are any pending questions
        if( saveTimeArray.length+1 > widget.totalQuestion){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => const Alert(
                title: "All question are complete", desc: "Please re-start the session"));
        }else{
          var elapsedTime = lastSavedTime - timerText;
          lastSavedTime = timerText;
          saveTimeArray.add(elapsedTime);

          if(saveTimeArray.length == widget.totalQuestion){
            // stop the timer
            cancelTimer();
          }
        }
      } else {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => const Alert(
                title: "Time's Up!", desc: "Please re-start the session"));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timerText = widget.totalTimeParam;
    timerInstance =
        Utility.startTimer(widget.totalTimeParam, cancelCallback, decerementCallback);

    lastSavedTime = widget.totalTimeParam;
  }

  @override
  Widget build(BuildContext context) {
    return BackBtnWidget(
      childWidget: Scaffold(
          appBar: AppBar(
            title: const Text('Competitive Timer'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text('Session Timer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40)),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                    timerText != null
                        ? '${(timerText / 60).floor()}:${timerText % 60}'
                        : '0',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60)),
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
          ]),
      callback: () => {backNavHandler(context)},
    );
  }
}
