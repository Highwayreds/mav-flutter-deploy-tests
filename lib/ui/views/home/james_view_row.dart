import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/mascot/mascot.dart';
import 'package:map_visualisation/classes/mascot/mascotbar.dart';
import 'package:map_visualisation/classes/visualisations/fullarea.dart';
import 'package:map_visualisation/classes/visualisations/radialbar.dart';
import 'package:map_visualisation/classes/visualisations/stackedline.dart';
import 'package:map_visualisation/ui/views/icon_view.dart';
import 'package:map_visualisation/ui/views/map_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class JamesViewRow extends StatefulWidget {
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
                      children: [
                        Image(image: Image.asset('assets/arq.png').image)
                      ])),
              body: Row(children: [
                Column(children: [
                  Expanded(
                      flex: 0,
                      child: Container(
                        height: 100,
                        child: RotatedBox(
                            quarterTurns: -1,
                            child: Center(
                                child: Text(
                              "2021",
                              style: TextStyle(fontSize: 40),
                            ))),
                      )),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff5753a4))),
                          child: Column(children: [
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                            Expanded(flex: 0, child: Image.asset("arq2.png")),
                          ])))
                ]),
                Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xff5753a4))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text("Champions of Change",
                                    style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(fontSize: 50),
                                        fontWeight: FontWeight.w900)),
                                Text("CHAMPIONING COVID SAFE TECHNOLOGY",
                                    style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            color: Color(0xff5753a4),
                                            fontSize: 15)))
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Color(0xff5753a4))),
                                child: Column(children: [
                                  Center(
                                      child: Stack(children: [
                                    Text("TEST"),
                                    Image(
                                        image: Image.asset("assets/green.png")
                                            .image),
                                    // Image(
                                    //   image:
                                    //       (model.mapImage.bathroomAImg).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image:
                                    //       (model.mapImage.bathroomBImg).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image: (model.mapImage.barImg).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image: (model.mapImage.a1Img).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image: (model.mapImage.a2Img).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image: (model.mapImage.a3Img).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                    // Image(
                                    //   image: (model.mapImage.a4Img).image,
                                    //   gaplessPlayback: true,
                                    // ),
                                  ]))
                                ])),
                            Expanded(
                                child: Center(
                                    child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff5753a4)),
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                75, 0, 0, 0),
                                            child: Text("RECOMMENDATIONS",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white),
                                                )))),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("/ Bathroom A is quiet"),
                                      Text(
                                          "/ The \"Defining the new Cyber-Security Perimeter\" Master Class begins soon. Seats are filling up!"),
                                      Column(children: [
                                        //   StackedLine(model.getLineData),
                                      ])
                                    ],
                                  ),
                                  // Expanded(
                                  //     child: Column(children: [
                                  //   StackedLine(model.getLineData),
                                  // ]))
                                ],
                              )),
                              // Text("Bathroom A Count: " +
                              //     model.bathACount.toString()),
                              // Text("Bathroom B Count: " +
                              //     model.bathBCount.toString()),
                              // Text("Bar Count: " + model.barCount.toString()),
                              // Text("Aisle 1 Count: " + model.a1Count.toString()),
                              // Text("Aisle 2 Count: " + model.a2Count.toString()),
                              // Text("Aisle 3 Count: " + model.a3Count.toString()),
                              // Text("Aisle 4 Count: " + model.a4Count.toString()),
                            ]))),
                          ]))
                        ])),
                Expanded(
                    flex: 1,
                    child: Column(children: [
                      Expanded(
                          flex: 0,
                          child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff5753a4))),
                              child: MascotBar(model.mascots))),
                      Expanded(
                          flex: 2,
                          child: Column(
                              children: [Expanded(child: model.currMascot)])),
                    ])),
              ]),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
