import 'package:flutter/cupertino.dart';

class Heart {
  AssetImage full;
  AssetImage half;
  AssetImage empty;

  AssetImage currImg;
  int bound;

  Heart(boundary) {
    this.full = AssetImage("mascots/healthbar/full.png");
    this.half = AssetImage("mascots/healthbar/half.png");
    this.empty = AssetImage("mascots/healthbar/empty.png");

    this.bound = boundary;
  }

  checkBoundary(health) {
    if (health > bound) {
      this.currImg = this.empty;
    } else if (health < bound) {
      this.currImg = this.full;
    } else {
      this.currImg = this.half;
    }
  }
}
