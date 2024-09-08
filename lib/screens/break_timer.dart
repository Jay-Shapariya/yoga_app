import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/models/timer_model_third.dart';

class BreakTimer extends StatelessWidget {
  const BreakTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelThird>(
      create: (context) => TimerModelThird(context),
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
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.blue),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: const Text(
                    "SKIP",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
             
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextButton(onPressed: () {
                
              }, child: const Text("Previous",style: TextStyle(fontSize: 16,color: Colors.blue),)),
              TextButton(onPressed: () {
                
              }, child: const Text("Next",style: TextStyle(fontSize: 16,color: Colors.blue),))
            ],),
          ),
          const Divider(
            thickness: 2,
          ),
          const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Text("Next Anulong vilom",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ))
            ],
          ),
        ),
      ),
    );
  }
}
