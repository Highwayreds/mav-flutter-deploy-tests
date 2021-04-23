import 'package:flutter/cupertino.dart';

class Area {
  AssetImage currImg;
  AssetImage oldImg;
  AssetImage hide;
  AssetImage green;
  AssetImage orange;
  AssetImage red;

  Area(path) {
    this.green = AssetImage(path + "/green.png");
    this.orange = AssetImage(path + "/orange.png");
    this.red = AssetImage(path + "/red.png");
    this.hide = AssetImage("transparent.png");

    this.currImg = this.hide;
    this.oldImg = this.hide;
  }
}
