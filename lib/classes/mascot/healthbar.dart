import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'heart.dart';

class HealthBar extends StatefulWidget {
  Image fullHealth = Image.asset("mascots/healthbar/full.png");
  Image halfHealth = Image.asset("mascots/healthbar/half.png");
  Image empty = Image.asset("mascots/healthbar/empty.png");

  Heart heart1 = Heart(12);
  Heart heart2 = Heart(10);
  Heart heart3 = Heart(8);
  Heart heart4 = Heart(6);
  Heart heart5 = Heart(4);

  List<Heart> get hearts => [heart1, heart2, heart3, heart4, heart5];

  Image get heart1Img => heart1.currImg;
  Image get heart2Img => heart2.currImg;
  Image get heart3Img => heart3.currImg;
  Image get heart4Img => heart4.currImg;
  Image get heart5Img => heart5.currImg;

  int _currHealth;
  int get currHealth => _currHealth;

  String _area;
  String get area => _area;

  @override
  _HealthBarState createState() => _HealthBarState();

  HealthBar(health, countArea) {
    // Count of the current health of the area
    this._currHealth = health;

    this._area = countArea;

    // Calls checkhealth to change the amount of hearts displayed based on the current count
    checkHealth(health);
  }

  checkHealth(health) {
    for (var i = 0; i < hearts.length; i++) {
      hearts[i].checkBoundary(currHealth);
    }
  }
}

class _HealthBarState extends State<HealthBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(widget.fullHealth.image, context);
    precacheImage(widget.halfHealth.image, context);
    precacheImage(widget.empty.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 0,
                child: Container(
                    width: 300,
                    child: Row(
                      children: [
                        Expanded(
                            child: Image(
                                image:
                                    AssetImage("mascots/healthbar/heart.png"))),
                        Expanded(
                            child: Image(
                          image: widget.heart1Img.image,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart2Img.image,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart3Img.image,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart4Img.image,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart5Img.image,
                          gaplessPlayback: true,
                        )),
                      ],
                    )))
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget._area.toUpperCase() + " COUNT: ",
              style: TextStyle(fontSize: 20)),
          Text(
            widget.currHealth.toString(),
            style: TextStyle(fontSize: 20, color: Color(0xff5753a4)),
          ),
        ],
      ),
    ]));
  }
}
