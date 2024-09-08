import 'dart:async';

import 'package:flutter/material.dart';

import 'package:yoga_app/screens/finish.dart';

class TimerModelThird with ChangeNotifier{
  TimerModelThird(context){
    MyTimerSec(context);
  }
  int countdown = 20;
  MyTimerSec(context) async {
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      countdown--;
      notifyListeners();
      if (countdown==0) {
        timer.cancel();
        Navigator.push(context,MaterialPageRoute(builder: (context) => const FinishScreen(),));
       
      }
    });
  }
}