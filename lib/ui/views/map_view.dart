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

    precacheImage(Image.asset('assets/orange.png').image, context);
    precacheImage(Image.asset('assets/red.png').image, context);
    precacheImage(Image.asset('assets/bathroomA/orange.png').image, context);
    precacheImage(Image.asset('assets/bathroomA/red.png').image, context);
    precacheImage(Image.asset('assets/bathroomB/orange.png').image, context);
    precacheImage(Image.asset('assets/bathroomB/red.png').image, context);
    precacheImage(Image.asset('assets/bar/orange.png').image, context);
    precacheImage(Image.asset('assets/bar/red.png').image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Stack(children: <Widget>[
        Image(image: mapViewModel.img.image),
        Image(image: mapViewModel.bathroomA.currImg.image),
        Image(image: mapViewModel.bathroomB.currImg.image),
        Image(image: mapViewModel.bar.currImg.image),
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
