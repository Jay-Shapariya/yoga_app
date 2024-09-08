import 'package:flutter/material.dart';
import 'package:yoga_app/models/yoga_model.dart';
import 'package:yoga_app/screens/startup.dart';
import 'package:yoga_app/services/yoga_db.dart';
import 'package:yoga_app/widget/custom_appbar.dart';
import 'package:yoga_app/widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorsTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textController;

  Future makeYogaEntry(Yoga yoga, String tableName) async {
    await YogaDatabase.instance.Insert(yoga, tableName);
  }

  Future makeYogaSummaryEntry(YogaSummary yogaSummary) async {
    await YogaDatabase.instance.InsertYogaSum(yogaSummary);
  }

  late List<YogaSummary> yogaSumList;
  bool isLoading = true;
  Future readAllYogaSummaryEntry() async {
    this.yogaSumList = await YogaDatabase.instance.readAllYogaSum();
    setState(() {
      isLoading = false;
      // ignore: avoid_print
      print(yogaSumList[0].YogaWorkOutName.toString());
    });
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorsTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));

    // makeYogaSummaryEntry(YogaSummary(
    //     YogaWorkoutname: YogaModel.YogaTable1,
    //     BackImg:
    //         "https://img.freepik.com/free-photo/back-view-woman-doing-yoga-outdoors_23-2148769551.jpg",
    //     TimeTaken: "36",
    //     TotalNoOfWork: "12"));
    // makeYogaSummaryEntry(YogaSummary(
    //     YogaWorkoutname: YogaModel.YogaTable2,
    //     BackImg:
    //         "https://img.freepik.com/free-photo/back-view-woman-doing-yoga-outdoors_23-2148769551.jpg",
    //     TimeTaken: "40",
    //     TotalNoOfWork: "20"));
    // makeYogaSummaryEntry(YogaSummary(
    //     YogaWorkoutname: YogaModel.YogaTable3,
    //     BackImg:
    //         "https://img.freepik.com/free-photo/back-view-woman-doing-yoga-outdoors_23-2148769551.jpg",
    //     TimeTaken: "50",
    //     TotalNoOfWork: "10"));

    // makeYogaEntry(
    //     const Yoga(
    //         SecondsOrTimes: '30',
    //         Seconds: true,
    //         YogaTitle: "Anulom Vilom",
    //         YogaUrl:
    //             "https://harithayogshala.com/upload/blog/benefits-of-anulom-vilom_1649683763.jpg"),
    //     YogaModel.YogaTable1);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Trikonasana",
    //         YogaUrl:
    //             "https://images.onlymyhealth.com//imported/images/2022/October/03_Oct_2022/maintrinkosana.jpg",
    //         SecondsOrTimes: '40'),
    //     YogaModel.YogaTable1);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Suryanamaskar",
    //         YogaUrl:
    //             "https://cdn.prod.website-files.com/5ca5fe687e34be0992df1fbe/6603e03124203c04cd15a21c_8757756_049.jpg",
    //         SecondsOrTimes: '30'),
    //     YogaModel.YogaTable1);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Setu Bandha Sarvangasana",
    //         YogaUrl:
    //             "https://inbalancehealth.ca/wp-content/uploads/2016/04/160403-015x_web.jpg",
    //         SecondsOrTimes: '50'),
    //     YogaModel.YogaTable1);

    // makeYogaEntry(
    //     const Yoga(
    //         SecondsOrTimes: '30',
    //         Seconds: true,
    //         YogaTitle: "Dhanurasana",
    //         YogaUrl:
    //             "https://www.vinyasayogaashram.com/blog/wp-content/uploads/2021/04/dhanurasana.jpg"),
    //     YogaModel.YogaTable2);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Purvottanasana",
    //         YogaUrl:
    //             "https://www.keralatourism.org/images/yoga/category/thumb/purvottanasana1_thumb.jpg",
    //         SecondsOrTimes: '40'),
    //     YogaModel.YogaTable2);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Naukasana",
    //         YogaUrl:
    //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzvCAV_eY0oSey9s84fKd7pXncfrTRpN-QyA&s",
    //         SecondsOrTimes: '30'),
    //     YogaModel.YogaTable2);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Chaturangadandasana",
    //         YogaUrl:
    //             "https://cdn.yogajournal.com/wp-content/uploads/2021/11/Chaturanga-Pose_Andrew-Clark_2400x1350-e1671220290268.jpeg",
    //         SecondsOrTimes: '50'),
    //     YogaModel.YogaTable2);

    // makeYogaEntry(
    //     const Yoga(
    //         SecondsOrTimes: '30',
    //         Seconds: true,
    //         YogaTitle: "Savasana",
    //         YogaUrl:
    //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR39AllQ0CgpC4wk8gtbS5C5AbHX5ZFnwKmnA&s"),
    //     YogaModel.YogaTable3);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Sukhasana",
    //         YogaUrl:
    //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT93fIuM9kLTwDnrW8q2kznQD5LaAv7fTifOA&s",
    //         SecondsOrTimes: '40'),
    //     YogaModel.YogaTable3);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Vriksasana",
    //         YogaUrl:
    //             "https://media.graphassets.com/resize=fit:clip,height:350,width:600/HHGrZ66yTuSRmrJJEHR0",
    //         SecondsOrTimes: '30'),
    //     YogaModel.YogaTable3);
    // makeYogaEntry(
    //     const Yoga(
    //         Seconds: true,
    //         YogaTitle: "Marjaryasana",
    //         YogaUrl:
    //             "https://img.freepik.com/free-photo/young-attractive-woman-cat-marjaryasana-pose_1163-4522.jpg",
    //         SecondsOrTimes: '50'),
    //     YogaModel.YogaTable3);

    readAllYogaSummaryEntry();
    super.initState();
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textController.animateTo(scrollNotification.metrics.pixels);

      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: NotificationListener(
          onNotification: scrollListner,
          child:  Stack(
            children: [
              // ignore: sized_box_for_whitespace
              isLoading ? const Center(child: CircularProgressIndicator(),) : Container(
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 120, 50, 30),
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                        Text(
                                          'Streak',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '120',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                        Text(
                                          'kCal',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '26',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23),
                                        ),
                                        Text(
                                          'Minutes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: const Text(
                                          'Yoga for all',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    ListView.builder(
                                      itemCount: yogaSumList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                   Startup(yogakey: yogaSumList[index].yogakey.toString(),yogaSum: yogaSumList[index],),
                                              )),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              yogaSumList[index]
                                                                  .BackImg
                                                                  .toString()))),
                                                ),
                                                Container(
                                                  height: 150,
                                                  color: Colors.black26,
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  left: 10,
                                                  top: 10,
                                                  child: Text(
                                                    yogaSumList[index]
                                                        .YogaWorkOutName,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 30,
                                                  left: 12,
                                                  top: 38,
                                                  child: Text(
                                                    "Last time : ${yogaSumList[index].TimeTaken}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://www.ekhartyoga.com/media/image/articles/Laia_Bove_Mermaid-pose.jpg'))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Weight Loss Yoga",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last time : 21 Feb",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://img.freepik.com/premium-photo/woman-doing-yoga-beach-with-mountain-background_865967-25537.jpg'))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Suryanamaskar",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last time : Yesterday",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: const Text(
                                          'Yoga for Kids',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://i0.wp.com/www.fitbewell.com/wp-content/uploads/2018/06/Padmasana-for-kids.jpg?resize=590%2C393&ssl=1'))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Lotus Pose",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last time : 12 Jan",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtKAy_RiTVqrAjUQVoJqQFf4gnfSozWa8x5Q&s'))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Cobra Pose",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last time : 1 Mar",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        'https://cdn.yogajournal.com/wp-content/uploads/2021/11/Downward-Facing-Dog-Pose_Andrew-Clark_2400x1350.jpeg'))),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Downward Dog Pose",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last time : Yesterday",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CustomAppbar(
                        animationController: _animationController,
                        colorsTween: _colorsTween,
                        homeTween: _homeTween,
                        yogaTween: _yogaTween,
                        drawerTween: _drawerTween,
                        iconTween: _iconTween,
                        onpressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        })
                  ],
                ),
              )
            ],
          )),
    );
  }
}
