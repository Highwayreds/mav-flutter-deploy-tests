import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/ui/views/icon_detail_view.dart';

class IconView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IconViewState();
}

class _IconViewState extends State with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Row(children: [
          Expanded(
              child:
                  Image(image: Image.asset("assets/icons/red_dot.png").image)),
          Expanded(
              child: Image(
                  image: Image.asset("assets/icons/digital_twin.png").image)),
          Expanded(
              child: Image(image: Image.asset("assets/icons/count.png").image)),
          Expanded(
              child: Image(image: Image.asset("assets/icons/queue.png").image)),
        ]));
  }
}
