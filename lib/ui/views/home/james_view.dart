import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/mascot/mascot.dart';
import 'package:map_visualisation/ui/views/icon_view.dart';
import 'package:map_visualisation/ui/views/map_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class JamesView extends StatefulWidget {
  @override
  createState() => JamesState();
}

class JamesState extends State {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  backgroundColor: Color(0xff5753a4),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Image(image: AssetImage('arq.png'))])),
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xff5753a4))),
                            child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  "/ 2021",
                                  style: TextStyle(fontSize: 70),
                                )),
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xff5753a4))),
                            child: Row(
                              children: [
                                Image.asset("arq.png"),
                                Text("/ champions of change",
                                    style: TextStyle(
                                        color: Color(0xff5753a4), fontSize: 70))
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff5753a4))),
                              child: IconView()))
                    ],
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          flex: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff5753a4))),
                              child: Column(children: [
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                                Image.asset("arq.png"),
                              ]))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff5753a4))),
                              child: Column(children: [
                                Center(
                                    child: Stack(children: [
                                  Image(image: AssetImage("green.png")),
                                  Image(image: model.mapImage.bathroomAImg),
                                  Image(image: model.mapImage.bathroomBImg),
                                  Image(image: model.mapImage.barImg),
                                  Image(image: model.mapImage.a1Img),
                                  Image(image: model.mapImage.a2Img),
                                  Image(image: model.mapImage.a3Img),
                                  Image(image: model.mapImage.a4Img),
                                ]))
                              ]))),
                      Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff5753a4))),
                              child: Center(child: model.currMascot)))
                    ],
                  ))
                ],
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
