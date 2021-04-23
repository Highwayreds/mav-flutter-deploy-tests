import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'heart.dart';

class HealthBar extends StatefulWidget {
  AssetImage fullHealth = AssetImage("mascots/healthbar/full.png");
  AssetImage halfHealth = AssetImage("mascots/healthbar/half.png");
  AssetImage empty = AssetImage("mascots/healthbar/empty.png");

  Heart heart1 = Heart(12);
  Heart heart2 = Heart(10);
  Heart heart3 = Heart(8);
  Heart heart4 = Heart(6);
  Heart heart5 = Heart(4);

  List<Heart> get hearts => [heart1, heart2, heart3, heart4, heart5];

  AssetImage get heart1Img => heart1.currImg;
  AssetImage get heart2Img => heart2.currImg;
  AssetImage get heart3Img => heart3.currImg;
  AssetImage get heart4Img => heart4.currImg;
  AssetImage get heart5Img => heart5.currImg;

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

    precacheImage(widget.fullHealth, context);
    precacheImage(widget.halfHealth, context);
    precacheImage(widget.empty, context);
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
                          image: widget.heart1Img,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart2Img,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart3Img,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart4Img,
                          gaplessPlayback: true,
                        )),
                        Expanded(
                            child: Image(
                          image: widget.heart5Img,
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
