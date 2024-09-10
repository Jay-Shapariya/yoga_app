import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/models/timer_model_third.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/workout_date.dart';

// ignore: must_be_immutable
class BreakTimer extends StatelessWidget {
  List<Yoga> listOfYoga;
  int yogaIndex;

  BreakTimer({
    super.key,
    required this.listOfYoga,
    required this.yogaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelThird>(
      create: (context) => TimerModelThird(
        context,
        listOfYoga,
        yogaIndex,
      ),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.5,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1558017487-06bf9f82613a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fHdvcmtvdXR8ZW58MHx8MHx8fDA%3D'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Break Time",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Consumer<TimerModelThird>(
                builder: (context, myModel, child) {
                  return Text(
                    '${myModel.countdown}s',
                    style: const TextStyle(
                        fontSize: 55,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<TimerModelThird>(
                builder: (context, mymModel, child) => ElevatedButton(
                  onPressed: () {
                    mymModel.skip();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.blue),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: const Text(
                      "SKIP",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<TimerModelThird>(
                      builder: (context, myModel, child) => TextButton(
                          onPressed: () async {
                            myModel.pass();

                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkoutDate(
                                    listOfYoga: listOfYoga,
                                    yogaIndex: yogaIndex,
                                  ),
                                ));
                          },
                          child: const Text(
                            "Previous",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          )),
                    ),
                    Consumer<TimerModelThird>(
                            builder: (context, myModel, child) =>
                    TextButton(
                        onPressed: () async{
                          myModel.pass();
                                      await Future.delayed(
                                          Duration(seconds: 1));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkoutDate(
                                  listOfYoga: listOfYoga,
                                  yogaIndex: yogaIndex + 1,
                                ),
                              ));
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        )))
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      "Next: ${yogaIndex >= listOfYoga.length - 1 ? "FINISH" : listOfYoga[yogaIndex].YogaTitle}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
