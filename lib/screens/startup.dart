import 'package:flutter/material.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/rUread.dart';

class Startup extends StatefulWidget {
  String yogakey;
  YogaSummary yogaSum;
  Startup({required this.yogakey, required this.yogaSum});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RUReady(
                    yogaTableName: widget.yogaSum.YogaWorkOutName,
                  ),
                ));
          },
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: const MaterialStatePropertyAll(Colors.blue),
              foregroundColor: const MaterialStatePropertyAll(Colors.white)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'START',
              style: TextStyle(fontSize: 20),
            ),
          )),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Yoga'),
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                'https://images.shiksha.com/mediadata/images/articles/1696421068php7Jh20N.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up_alt))
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      '16 Mins || 23 Workouts',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Image.network(
                            'https://i.pinimg.com/originals/a8/6b/8e/a86b8eb24ddbe00cf3d46aeab672e538.gif',
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          'Yoga ${index + 1}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          (index % 2 == 0) ? "00:20" : "x20",
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 2,
                        ),
                    itemCount: 20)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
