import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_visualisation/ui/viewmodels/map_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MapView extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State {
  MapViewModel mapViewModel = MapViewModel(2, 3, 4, 5, 6, 7, 8);

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Stack(children: <Widget>[
        Image(image: mapViewModel.img.image),
        Image(image: mapViewModel.bathroomA.currImg),
        Image(image: mapViewModel.bathroomB.currImg),
        Image(image: mapViewModel.bar.currImg),
      ])
          // used a floating action button to update pics
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       mapViewModel.changeHeatmap();
          //     });
          //   },
          //   tooltip: 'Increment',
          //   child: Icon(Icons.add),
          // ),
          )
    ]);
  }
}
