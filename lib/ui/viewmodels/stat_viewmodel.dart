import 'dart:async';

import 'package:map_visualisation/classes/linedata.dart';
import 'package:map_visualisation/services/data_service.dart';
import 'package:stacked/stacked.dart';

// class StatViewModel extends BaseViewModel {
//   DataService chartDataService = DataService();
//   List<LineData> get lineData => chartDataService.lineData;

//   StatViewModel() {
//     Timer second;
//     int year = 2016;

//     // defines a timer
//     second = Timer.periodic(Duration(seconds: 2), (Timer t) {
//       chartDataService.getInfo();
//       notifyListeners();
//       year += 1;
//       second;
//     });
//   }
// }
