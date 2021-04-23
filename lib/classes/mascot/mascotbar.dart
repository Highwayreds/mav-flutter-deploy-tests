import 'package:flutter/cupertino.dart';

import 'mascot.dart';

class MascotBar extends StatefulWidget {
  @override
  createState() => MascotBarState();

  List<Mascot> mascotArray;

  MascotBar(this.mascotArray);
}

class MascotBarState extends State<MascotBar> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var mascot in widget.mascotArray)
        Expanded(child: Image(image: mascot.currImg.image))
    ]);
  }
}
