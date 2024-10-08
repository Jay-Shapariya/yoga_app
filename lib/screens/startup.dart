import 'package:flutter/material.dart';

import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/rUread.dart';
import 'package:yoga_app/services/yoga_db.dart';
//Video No 21 Excercise - Solve The Database Inserting Problem Using Shared Preference
// ignore: must_be_immutable
class Startup extends StatefulWidget {
  String Yogakey;
  YogaSummary yogaSum;
  Startup({required this.Yogakey, required this.yogaSum});

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
   
    super.initState();
    ReadAllYoga();
  }

  late List<Yoga> AllYogaWorkOuts;
  bool isLoading =  true;
  Future ReadAllYoga() async {
    this.AllYogaWorkOuts =
        await YogaDatabase.instance.readAllYoga(widget.yogaSum.YogaWorkOutName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(body: Container(),) : Scaffold(
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.blue),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RUReady(yogaTableName: widget.yogaSum.YogaWorkOutName,)));
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              "START",
              style: TextStyle(fontSize: 20),
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(widget.yogaSum.YogaWorkOutName),
              background: Image.network(
                widget.yogaSum.BackImg.toString(),
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.thumb_up_alt_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${widget.yogaSum.TimeTaken} Mins || ${widget.yogaSum.TotalNoOfWork} Workouts",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),

                      itemBuilder: (context, index) => ListTile(
                            leading: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Image.network(
                                  AllYogaWorkOuts[index].YogaImgUrl,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              AllYogaWorkOuts[index].YogaTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                             AllYogaWorkOuts[index].Seconds ? "00:${AllYogaWorkOuts[index].SecondsOrTimes}" : "x${AllYogaWorkOuts[index].SecondsOrTimes}",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                      itemCount: AllYogaWorkOuts.length)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}