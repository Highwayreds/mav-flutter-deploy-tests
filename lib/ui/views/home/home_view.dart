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

    precacheImage(Image.asset('assets/orange.png').image, context);
    precacheImage(Image.asset('assets/red.png').image, context);
    precacheImage(Image.asset('assets/bathroomA/orange.png').image, context);
    precacheImage(Image.asset('assets/bathroomA/red.png').image, context);
    precacheImage(Image.asset('assets/bathroomB/orange.png').image, context);
    precacheImage(Image.asset('assets/bathroomB/red.png').image, context);
    precacheImage(Image.asset('assets/bar/orange.png').image, context);
    precacheImage(Image.asset('assets/bar/red.png').image, context);
    precacheImage(Image.asset('assets/aisles/1/orange.png').image, context);
    precacheImage(Image.asset('assets/aisles/1/red.png').image, context);
    precacheImage(Image.asset('assets/aisles/2/orange.png').image, context);
    precacheImage(Image.asset('assets/aisles/2/red.png').image, context);
    precacheImage(Image.asset('assets/aisles/3/orange.png').image, context);
    precacheImage(Image.asset('assets/aisles/3/red.png').image, context);
    precacheImage(Image.asset('assets/aisles/4/orange.png').image, context);
    precacheImage(Image.asset('assets/aisles/4/red.png').image, context);

    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-s1.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-s2.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-s3.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-s4.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-s5.png").image, context);
    precacheImage(
        Image.asset("assets/mascots/cuppy/cuppy-g1.gif").image, context);

    precacheImage(
        Image.asset("assets/mascots/boggy/boggy-s1.png").image, context);

    precacheImage(
        Image.asset("assets/mascots/dobby/dobby-s1.png").image, context);

    precacheImage(
        Image.asset("assets/mascots/lector/lector-s1.png").image, context);
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
                        placeholder:
                            Image.asset("assets/transparent.png").image,
                        image: Image.asset("assets/green.png").image,
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
