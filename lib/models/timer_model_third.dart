import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/workout_date.dart';

class TimerModelThird with ChangeNotifier{
  
  TimerModelThird(context,List<Yoga> listOfYoga,int yogaindext){
    MyTimerSec(context,listOfYoga,yogaindext);
  }
  int countdown = 20;
  bool isSkip = false;
  bool isPassed = false;
  MyTimerSec(context,List<Yoga> listOfYoga,int yogaindex) async {
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      countdown--;
      notifyListeners();
      if (countdown==0 || isSkip) {
        timer.cancel();
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  WorkoutDate(listOfYoga: listOfYoga,yogaIndex: yogaindex),));
       if (isPassed) {
         timer.cancel();
       }
      }
    });

  }
  void skip(){
    isSkip = true;
    notifyListeners();
  }
  void pass(){
    isPassed = true;
    notifyListeners();
  }
}