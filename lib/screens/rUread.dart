import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yoga_app/models/timer_model.dart';

class RUReady extends StatelessWidget {
  String yogaTableName;
  RUReady({required this.yogaTableName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context,yogaTableName: yogaTableName),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 100,
              ),
              const Text(
                'Are you ready?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<TimerModel>(
                builder: (context, myModel, child) {
                  return Text(
                    "${myModel.countdown}",
                    style: const TextStyle(fontSize: 48),
                  );
                },
              ),
              const Spacer(),
              const Divider(
                thickness: 2,
              ),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      "Next Anulong vilom",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
