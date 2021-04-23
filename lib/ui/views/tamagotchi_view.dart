import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_visualisation/classes/mascot/mascot.dart';
import 'package:stacked/stacked.dart';

class TamagotchiView extends StatefulWidget {
  @override
  _TamagotchiState createState() => _TamagotchiState();
}

class _TamagotchiState extends State {
  // TamagotchiViewModel TamagotchiViewModel = TamagotchiViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.pop(context);
          }),
      // Expanded(
      //     child: Row(
      //         // children: [Mascot("cuppy"), Mascot("cuppy"), Mascot("cuppy")])),
      // // Expanded(
      //     child: Row(
      //         // children: [Mascot("cuppy"), Mascot("cuppy"), Mascot("cuppy")]))
    ]));
  }
}
