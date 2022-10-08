import 'dart:async';

class Utility {

  static Timer startTimer(int totalTime, cancelCallBackFn, decrementCallBackFn) {
    Timer timer;
    int start = totalTime;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          cancelCallBackFn();
        } else {
          decrementCallBackFn(start, timer);
          start--;
        }
      },
    );

    return timer;
  }
}