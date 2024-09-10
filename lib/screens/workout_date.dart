import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/models/timer_model_sec.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/break_timer.dart';

// ignore: must_be_immutable
class WorkoutDate extends StatelessWidget {
  List<Yoga> listOfYoga;
  int yogaIndex;

  WorkoutDate({super.key, required this.listOfYoga, required this.yogaIndex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerModelSec(context, listOfYoga, yogaIndex + 1,listOfYoga[yogaIndex].SecondsOrTimes),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              listOfYoga[yogaIndex].YogaImgUrl))),
                ),
                const Spacer(),
                Text(
                  listOfYoga[yogaIndex].YogaTitle,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: listOfYoga[yogaIndex].Seconds
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '00',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              ' : ',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Consumer<TimerModelSec>(
                              builder: (context, myModel, child) {
                                return Text(
                                  '${myModel.countdown}',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ],
                        )
                      : Text(
                          "x${listOfYoga[yogaIndex].SecondsOrTimes}",
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                const Spacer(),
                Consumer<TimerModelSec>(builder: (context, myModel, child) {
                  return ElevatedButton(
                    onPressed: () {
                      myModel.show();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: const Text(
                        "PAUSE",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<TimerModelSec>(
                        builder: (context, myModel, child) => yogaIndex != 0
                            ? TextButton(
                                onPressed: () async {
                                  myModel.pass();
                                  await Future.delayed(Duration(seconds: 1));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BreakTimer(
                                          listOfYoga: listOfYoga,
                                          yogaIndex: yogaIndex - 1,
                                        ),
                                      ));
            
                                  //  Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => WorkoutDate(
                                  //           listOfYoga: listOfYoga,
                                  //           yogaIndex: yogaIndex - 1),
                                  //     ));
                                },
                                child: const Text(
                                  "Previous",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ))
                            : Container(),
                      ),
                      Consumer<TimerModelSec>(
                          builder: (context, myModel, child) => yogaIndex !=
                                  listOfYoga.length - 1
                              ? TextButton(
                                  onPressed: () async {
                                    myModel.pass();
                                    await Future.delayed(
                                        Duration(seconds: 1));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BreakTimer(
                                            listOfYoga: listOfYoga,
                                            yogaIndex: yogaIndex + 1,
                                          ),
                                        ));
                                  },
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ))
                              : Container())
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
                        "Next: ${yogaIndex >= listOfYoga.length - 1 ? "FINISH" : listOfYoga[yogaIndex + 1].YogaTitle}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
            Consumer<TimerModelSec>(
              builder: (context, myModel, child) {
                return Visibility(
                  visible: myModel.visible,
                  child: Container(
                    color: Colors.blueAccent.withOpacity(0.8),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pause',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Yoga feels better.',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutDate(
                                        listOfYoga: listOfYoga, yogaIndex: 0),
                                  ));
                            },
                            style: const ButtonStyle(
                              side: MaterialStatePropertyAll(BorderSide.none),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.lightBlue),
                            ),
                            child: const Text(
                              "RESTART",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                              side: MaterialStatePropertyAll(BorderSide.none),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.lightBlue),
                            ),
                            child: const Text(
                              "QUIT",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            onPressed: () {
                              myModel.hide();
                            },
                            style: const ButtonStyle(
                              side: MaterialStatePropertyAll(BorderSide.none),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.lightBlue),
                            ),
                            child: const Text(
                              "RESUME",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
