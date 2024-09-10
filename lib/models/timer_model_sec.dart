import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/break_timer.dart';
import 'package:yoga_app/screens/finish.dart';
import 'package:yoga_app/services/localDB.dart';

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context, List<Yoga> listOfYoga, int yogaindex, countdown) {
    setCoutdown(int.parse(countdown), listOfYoga[yogaindex - 1].Seconds);
    MyTimerSec(context, listOfYoga, yogaindex);
    checkIfLast(yogaindex >= listOfYoga.length - 1);
    readTime(yogaindex);
  }
  int countdown = 0;
  void setCoutdown(int count, bool isSec) {
    countdown = isSec ? count : 10000;
  }

  bool visible = false;
  bool isPassed = false;
  bool isLast = false;

  void readTime(int yogaIndex){
    print(yogaIndex);
    if (yogaIndex == 1) {
      String now = DateTime.now().toString();
      LocalDB.setStartTime(now);
    }
  }

  MyTimerSec(context, List<Yoga> listOfYoga, int yogaindex) async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      visible ? countdown + 0 : countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        isLast
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const FinishScreen()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BreakTimer(
                    listOfYoga: listOfYoga,
                    yogaIndex: yogaindex,
                  ),
                ));
        if (isPassed) {
          timer.cancel();
        }
      }
    });
  }

  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }

  void pass() {
    isPassed = true;
    notifyListeners();
  }

  void checkIfLast(bool ans) {
    isLast = true;
  }
 
}
