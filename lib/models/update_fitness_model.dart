import 'package:flutter/material.dart';
import 'package:yoga_app/services/localDB.dart';
import 'package:intl/intl.dart';

class UpdateFitnessModel extends ChangeNotifier {
  UpdateFitnessModel() {
    print('IT WORKS');
    setWorkoutTime();
    lastWorkoutDoneOn();
    setMyCal(56);
  }
  int a = 1;
  void setWorkoutTime() async {
    print('Set Workout Time');
    String? startTime = await LocalDB.getStartTime();
    DateTime tempDate = new DateFormat('yyyy-MM-dd hh:mm:ss')
        .parse(startTime ?? "2023-05-23 19:32:32.182");
    int difference = DateTime.now().difference(tempDate).inMinutes;
    int? myWoTime = await LocalDB.getWorkoutTime();
    print(myWoTime);
    LocalDB.setWorkoutTime(myWoTime! + difference);
  }

  void lastWorkoutDoneOn() async {
    DateTime tempDate = new DateFormat('yyyy-MM-dd hh:mm:ss')
        .parse(await LocalDB.getLastDoneOn() ?? "2023-05-23 19:32:32.182");
    int diff = DateTime.now().difference(tempDate).inMinutes;
    if (diff == 0) {
      print("Good job");
      // int? streaknow = await LocalDB.getStreak();
      // print(streaknow);
      // LocalDB.setStreak(streaknow! + 1);
    } else {
      int? streaknow = await LocalDB.getStreak();
      LocalDB.setStreak(streaknow! + 1);
    }
    await LocalDB.setLastDone(DateTime.now().toString());
  }

  void setMyCal(int myKcal) async {
    int? kCal = await LocalDB.getKCal();
    LocalDB.setKCal(kCal ?? 0 + myKcal);
  }
}
