import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/mascot/healthbar.dart';
import 'package:map_visualisation/ui/views/icon_view.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';

class Mascot extends StatefulWidget {
  @override
  _MascotState createState() => _MascotState();

  String _name;
  String get name => _name;

  Image _gif;
  Image get gif => _gif;

  Image _img;
  Image get img => _img;

  Image _currImg;
  Image get currImg => _currImg;

  set currImg(value) {
    _currImg = value;
  }

  String area;

  int count;

  Mascot(mascot, areaCount, area) {
    this._name = mascot;
    this.area = area;
    this._gif = Image.asset("assets/mascots/$name/$name-g1.gif");
    this._img = Image.asset("assets/mascots/$name/$name-s1.png");
    this._currImg = this._img;
    count = areaCount;

    // Timer.periodic(Duration(seconds: 10), (Timer t) {
    //   print(currImg.assetName);
    //   currImg = gif;

    //   Timer.periodic(Duration(seconds: 4), (Timer t) {
    //     gif.evict();
    //   });
    // });
    //
  }
}

class _MascotState extends State<Mascot> {
  GlobalKey stickyKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String name = widget.name;

    precacheImage(widget.img.image, context);
    precacheImage(widget.gif.image, context);
    precacheImage(
        Image.asset("assets/mascots/$name/$name-s1.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/$name/$name-s2.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/$name/$name-s3.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/$name/$name-s4.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/$name/$name-s5.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/healthbar/full.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/healthbar/half.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/healthbar/empty.png").image, context);
  }

  // switch to using a switch case for readability
  @override
  didUpdateWidget(Mascot oldWidget) {
    super.didUpdateWidget(oldWidget);
    String name = widget.name;
    int count = widget.count;

    setState(() {
      if (count >= 0 && count < 10) {
        widget.currImg = Image.asset("assets/mascots/$name/$name-s1.png");
      } else if (count >= 10 && count < 15) {
        widget.currImg = Image.asset("assets/mascots/$name/$name-s3.png");
      } else if (count >= 15 && count < 20) {
        widget.currImg = Image.asset("assets/mascots/$name/$name-s5.png");
      }
    });

    var yeet = stickyKey.currentContext.findRenderObject() as RenderBox;

    print("width: " +
        yeet.size.width.toString() +
        " height: " +
        yeet.size.height.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(widget.area,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
                Text("  " + widget.name.capitalize().toUpperCase(),
                    style: TextStyle(fontSize: 30, color: Color(0xff5753a4)))
              ])),
      Expanded(
          flex: 5,
          child: FadeInImage(
            key: stickyKey,
            alignment: Alignment.center,
            placeholder: AssetImage("transparent.png"),
            image: widget.currImg.image,
          )),
      Expanded(flex: 0, child: HealthBar(widget.count, widget.area)),
      Expanded(
        flex: 0,
        child: IconView(),
      ),
      Expanded(
        flex: 2,
        child: Column(
          children: [
            Text(
              "test bold text yeet",
              style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w900),
            ),
            Text(
              "test NONbold text yeet",
              style: GoogleFonts.nunitoSans(),
            )
          ],
        ),
      )
    ]);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
