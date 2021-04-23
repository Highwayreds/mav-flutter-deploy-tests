import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_visualisation/classes/area.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  Image img = Image.asset('assets/green.png');
  Area bathroomA = Area("assets/bathroomA");
  Area bathroomB = Area("assets/bathroomB");
  Area bar = Area("assets/bar");
  Area a1 = Area("assets/aisles/1");
  Area a2 = Area("assets/aisles/2");
  Area a3 = Area("assets/aisles/3");
  Area a4 = Area("assets/aisles/4");

  Image get bathroomAImg => bathroomA.currImg;
  Image get bathroomBImg => bathroomB.currImg;
  Image get barImg => bar.currImg;
  Image get a1Img => a1.currImg;
  Image get a2Img => a2.currImg;
  Image get a3Img => a3.currImg;
  Image get a4Img => a4.currImg;

  AssetImage get prevBathAImg => Image.asset("assets/bathroomA/red.png").image;
  set prevBathAImg(value) {
    return value;
  }

  Image get prevBathBImg => bathroomB.oldImg;
  Image get prevBarImg => bar.oldImg;
  Image get prevA1Img => a1.oldImg;
  Image get prevA2Img => a2.oldImg;
  Image get prevA3Img => a3.oldImg;
  Image get prevA4Img => a4.oldImg;

  MapViewModel(
      bathACount, bathBCount, barCount, a1Count, a2Count, a3Count, a4Count) {
    update(
        bathACount, bathBCount, barCount, a1Count, a2Count, a3Count, a4Count);
  }

  changeHeatmap(density, area, img) {
    if (density > 5) {
      area.currImg = area.orange;

      if (density >= 10) {
        area.currImg = area.red;
      }
    } else {
      area.currImg = area.hide;
    }
    img = area.currImg;
  }

  void update(
      bathACount, bathBCount, barCount, a1Count, a2Count, a3Count, a4Count) {
    changeHeatmap(bathACount, bathroomA, bathroomAImg);
    changeHeatmap(bathBCount, bathroomB, bathroomBImg);
    changeHeatmap(barCount, bar, barImg);
    changeHeatmap(a1Count, a1, a1Img);
    changeHeatmap(a2Count, a2, a2Img);
    changeHeatmap(a3Count, a3, a3Img);
    changeHeatmap(a4Count, a4, a4Img);

    notifyListeners();

    imageCache.clear();
    imageCache.clearLiveImages();
  }
}
