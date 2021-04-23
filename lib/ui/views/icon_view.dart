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
          Expanded(child: Image(image: AssetImage("icons/red_dot.png"))),
          Expanded(child: Image(image: AssetImage("icons/digital_twin.png"))),
          Expanded(child: Image(image: AssetImage("icons/count.png"))),
          Expanded(child: Image(image: AssetImage("icons/queue.png"))),
        ]));
  }
}
