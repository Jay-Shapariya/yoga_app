import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static String timeKey = "TIMEKEY";
  static String lastDoneOn = "LASTDONEON";
  static String streakKey = "StreakKey";
  static String kcalKey = "kCalKey";
  static String workoutTimeKey = "workoutTimeKey";

  static Future<bool> setStartTime(String time) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(timeKey,time);
  }

  static Future<String?> getStartTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(timeKey);
  }

  static Future<bool> setLastDone(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(lastDoneOn,date);
  }

  static Future<String?> getLastDoneOn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(lastDoneOn);
  }
  static Future<bool> setStreak(int streak) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(streakKey,streak);
  }

  static Future<int?> getStreak() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(streakKey);
  }
  static Future<bool> setKCal(int kCal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(kcalKey,kCal);
  }

  static Future<int?> getKCal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(kcalKey);
  }
  static Future<bool> setWorkoutTime(int minute) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(workoutTimeKey,minute);
  } 

  static Future<int?> getWorkoutTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(workoutTimeKey);
  }
}