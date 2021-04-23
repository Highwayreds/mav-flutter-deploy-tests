import 'package:flutter/cupertino.dart';

class Area {
  Image currImg;
  Image oldImg;
  Image hide;
  Image green;
  Image orange;
  Image red;

  Area(path) {
    this.green = Image.asset(path + "/green.png");
    this.orange = Image.asset(path + "/orange.png");
    this.red = Image.asset(path + "/red.png");
    this.hide = Image.asset("transparent.png");

    this.currImg = this.hide;
    this.oldImg = this.hide;
  }
}
