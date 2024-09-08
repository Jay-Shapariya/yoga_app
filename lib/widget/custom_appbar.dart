import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  AnimationController animationController;
  Animation colorsTween, homeTween, yogaTween, iconTween, drawerTween;
  Function()? onpressed;
  CustomAppbar(
      {super.key,
      required this.animationController,
      required this.colorsTween,
      required this.homeTween,
      required this.yogaTween,
      required this.drawerTween,
      required this.iconTween,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: onpressed,
          ),
          backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text(
                'HOME',
                style: TextStyle(
                    color: homeTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'YOGA',
                style: TextStyle(
                    color: yogaTween.value,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          actions: [
            Icon(
              Icons.notifications,
              color: iconTween.value,
            ),
            const Padding(
              padding:  EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
