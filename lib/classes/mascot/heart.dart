import 'package:flutter/cupertino.dart';

class Heart {
  Image full;
  Image half;
  Image empty;

  Image currImg;
  int bound;

  Heart(boundary) {
    this.full = Image.asset("mascots/healthbar/full.png");
    this.half = Image.asset("mascots/healthbar/half.png");
    this.empty = Image.asset("mascots/healthbar/empty.png");

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
