import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/mascot/mascot.dart';
import 'package:map_visualisation/ui/views/icon_view.dart';
import 'package:map_visualisation/ui/views/map_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State with SingleTickerProviderStateMixin {
  //stops the images from 'flashing' when they are first brought onto the screen
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(AssetImage('orange.png'), context);
    precacheImage(AssetImage('red.png'), context);
    precacheImage(AssetImage('bathroomA/orange.png'), context);
    precacheImage(AssetImage('bathroomA/red.png'), context);
    precacheImage(AssetImage('bathroomB/orange.png'), context);
    precacheImage(AssetImage('bathroomB/red.png'), context);
    precacheImage(AssetImage('bar/orange.png'), context);
    precacheImage(AssetImage('bar/red.png'), context);
    precacheImage(AssetImage('aisles/1/orange.png'), context);
    precacheImage(AssetImage('aisles/1/red.png'), context);
    precacheImage(AssetImage('aisles/2/orange.png'), context);
    precacheImage(AssetImage('aisles/2/red.png'), context);
    precacheImage(AssetImage('aisles/3/orange.png'), context);
    precacheImage(AssetImage('aisles/3/red.png'), context);
    precacheImage(AssetImage('aisles/4/orange.png'), context);
    precacheImage(AssetImage('aisles/4/red.png'), context);

    precacheImage(AssetImage("mascots/cuppy/cuppy-s1.png"), context);
    precacheImage(AssetImage("mascots/cuppy/cuppy-s2.png"), context);
    precacheImage(AssetImage("mascots/cuppy/cuppy-s3.png"), context);
    precacheImage(AssetImage("mascots/cuppy/cuppy-s4.png"), context);
    precacheImage(AssetImage("mascots/cuppy/cuppy-s5.png"), context);
    precacheImage(AssetImage("mascots/cuppy/cuppy-g1.gif"), context);

    precacheImage(AssetImage("mascots/boggy/boggy-s1.png"), context);

    precacheImage(AssetImage("mascots/dobby/dobby-s1.png"), context);

    precacheImage(AssetImage("mascots/lector/lector-s1.png"), context);
  }

  AnimationController controller;
  Animation<double> offset;

  GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    Future<void>.delayed(Duration(seconds: 1), () {
      // Get the screen size
      final Size screenSize = MediaQuery.of(context).size;

      offset =
          Tween<double>(begin: 20, end: screenSize.height).animate(controller);

      // offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -5.0))
      //     .animate(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        key: _widgetKey,
        builder: (context, model, child) => Scaffold(
                body: Row(children: [
              Expanded(
                child: Column(children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          switch (controller.status) {
                            case AnimationStatus.completed:
                              controller.reverse();
                              break;
                            case AnimationStatus.dismissed:
                              controller.forward();
                              break;
                            default:
                          }
                          print(controller.status);
                        },
                        child: Center(child: model.currMascot)),
                    flex: 4,
                  ),
                  Expanded(
                    child: Container(height: offset.value, child: IconView()),
                    flex: 2,
                  )
                ]),
              ),
              Expanded(
                  child: Column(children: [
                    Center(
                        child: Stack(children: [
                      FadeInImage(
                        placeholder: AssetImage("transparent.png"),
                        image: AssetImage("green.png"),
                      ),
                      FadeInImage(
                          placeholder: model.mapImage.prevBathAImg,
                          image: model.mapImage.bathroomAImg),
                      FadeInImage(
                          placeholder: model.mapImage.prevBathBImg,
                          image: model.mapImage.bathroomBImg),
                      FadeInImage(
                          placeholder: model.mapImage.prevBarImg,
                          image: model.mapImage.barImg),
                      FadeInImage(
                          placeholder: model.mapImage.prevA1Img,
                          image: model.mapImage.a1Img),
                      FadeInImage(
                          placeholder: model.mapImage.prevA2Img,
                          image: model.mapImage.a2Img),
                      FadeInImage(
                          placeholder: model.mapImage.prevA3Img,
                          image: model.mapImage.a3Img),
                      FadeInImage(
                          placeholder: model.mapImage.prevA4Img,
                          image: model.mapImage.a4Img),
                    ])),
                    Center(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(color: Colors.blue),
                                child: Center(
                                    child: Text(
                                  "Conference Data",
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.white),
                                ))),
                          )
                        ],
                      ),
                      Text("Bathroom A Count: " + model.bathACount.toString()),
                      Text("Bathroom B Count: " + model.bathBCount.toString()),
                      Text("Bar Count: " + model.barCount.toString()),
                      Text("Aisle 1 Count: " + model.a1Count.toString()),
                      Text("Aisle 2 Count: " + model.a2Count.toString()),
                      Text("Aisle 3 Count: " + model.a3Count.toString()),
                      Text("Aisle 4 Count: " + model.a4Count.toString()),
                    ]))
                  ]),
                  flex: 2)
            ])),
        viewModelBuilder: () => HomeViewModel());
  }
}
