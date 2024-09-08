import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoga_app/screens/break_timer.dart';

class TimerModelSec with ChangeNotifier{
  TimerModelSec(context){
    MyTimerSec(context);
  }
  int countdown = 30;
  bool visible = false;
  MyTimerSec(context) async {
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      countdown--;
      notifyListeners();
      if (countdown==0) {
        timer.cancel();
        Navigator.push(context,MaterialPageRoute(builder: (context) => const BreakTimer(),));
       
      }
    });
  }
  void show(){
    visible = true;
    notifyListeners();
  }
  void hide(){
    visible = false;
    notifyListeners();
  }
}