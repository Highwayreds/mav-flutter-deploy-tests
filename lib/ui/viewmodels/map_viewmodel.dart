import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_visualisation/classes/area.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  Image img = Image.asset('assets/green.png');
  Area bathroomA = Area("bathroomA");
  Area bathroomB = Area("bathroomB");
  Area bar = Area("bar");
  Area a1 = Area("aisles/1");
  Area a2 = Area("aisles/2");
  Area a3 = Area("aisles/3");
  Area a4 = Area("aisles/4");

  AssetImage get bathroomAImg => bathroomA.currImg;
  AssetImage get bathroomBImg => bathroomB.currImg;
  AssetImage get barImg => bar.currImg;
  AssetImage get a1Img => a1.currImg;
  AssetImage get a2Img => a2.currImg;
  AssetImage get a3Img => a3.currImg;
  AssetImage get a4Img => a4.currImg;

  AssetImage get prevBathAImg => AssetImage("bathroomA/red.png");
  set prevBathAImg(value) {
    return value;
  }

  AssetImage get prevBathBImg => bathroomB.oldImg;
  AssetImage get prevBarImg => bar.oldImg;
  AssetImage get prevA1Img => a1.oldImg;
  AssetImage get prevA2Img => a2.oldImg;
  AssetImage get prevA3Img => a3.oldImg;
  AssetImage get prevA4Img => a4.oldImg;

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
