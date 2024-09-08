import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/workout_date.dart';
import 'package:yoga_app/services/yoga_db.dart';

class TimerModel with ChangeNotifier {
  String yogaTableName;
  TimerModel(context,{required this.yogaTableName}) {
    FetchAllYoga(yogaTableName);
    MyTimer(context);
  }
  late List<Yoga> allYoga;
  int countdown = 5;
  MyTimer(context) async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if (countdown == 0) {
        timer.cancel();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutDate(
                listOfYoga: allYoga,
                yogaIndex: 0,
              ),
            ));
        // print("Start your yoga");
      }
    });
  }

  Future<List<Yoga>> FetchAllYoga(String yogaTableName) async {
    allYoga = await YogaDatabase.instance.readAllYoga(yogaTableName);
    notifyListeners();
    return allYoga;
  }
}
