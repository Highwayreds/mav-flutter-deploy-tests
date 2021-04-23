import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_visualisation/app/app.locator.dart';
import 'package:map_visualisation/ui/views/home/home_view.dart';
import 'package:map_visualisation/ui/views/home/james_view.dart';
import 'package:map_visualisation/ui/views/home/james_view_row.dart';
import 'package:map_visualisation/ui/views/map_view.dart';
import 'package:map_visualisation/ui/views/tamagotchi_view.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/stat_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return JamesViewRow();
              }),
            );
          },
          child: Text("Map View"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return StatView();
              }),
            );
          },
          child: Text("Stat View"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return TamagotchiView();
              }),
            );
          },
          child: Text("Tamagotchi View"),
        )
      ],
    ));
  }
}
