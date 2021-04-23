import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:map_visualisation/app/app.locator.dart';
import 'package:map_visualisation/classes/linedata.dart';
import 'package:map_visualisation/classes/mascot/mascot.dart';
import 'package:map_visualisation/classes/visualisations/fullarea.dart';
import 'package:map_visualisation/services/data_service.dart';
import 'package:map_visualisation/ui/viewmodels/map_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  DataService _dataService = locator<DataService>();

  LineData get data => _dataService.lineData[_dataService.lineData.length - 1];

  List<LineData> get getLineData => _dataService.lineData;

  int get bathACount => data.bathroomA;
  int get bathBCount => data.bathroomB;
  int get barCount => data.bar;
  int get a1Count => data.a1;
  int get a2Count => data.a2;
  int get a3Count => data.a3;
  int get a4Count => data.a4;

  int i = 0;

  // CREATE LIST OF MASCOTS, SET EACH AS DESIRED
  List<Mascot> get mascots => [
        Mascot("cuppy", barCount, "Bar"),
        Mascot("boggy", bathACount, "Toilets"),
        Mascot("dobby", a1Count, "Entrances"),
        Mascot("lector", a2Count, "Lecture Theatre"),
        Mascot("boothy", a3Count, "Booths")
      ];
  int get selectedCount => barCount;

  Mascot get currMascot => mascots[i];
  set currMascot(newMascot) {
    notifyListeners();
    return newMascot;
  }

  MapViewModel get mapImage => MapViewModel(
      bathACount, bathBCount, barCount, a1Count, a2Count, a3Count, a4Count);

  HomeViewModel() {
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      locator<DataService>().getInfo();

      mapImage.update(
          bathACount, bathBCount, barCount, a1Count, a2Count, a3Count, a4Count);

      notifyListeners();
    });

    Timer.periodic(Duration(seconds: 10), (Timer t) {
      if (i == mascots.length - 1) {
        i = 0;
      } else {
        i++;
      }

      notifyListeners();
    });
  }
}
