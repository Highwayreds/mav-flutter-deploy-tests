import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:map_visualisation/classes/linedata.dart';
import 'package:stacked/stacked.dart';

class DataService extends BaseViewModel {
  int year = 2016;
  int barVar = 4;
  int bathAVar = 10;
  int bathBVar = 8;
  int a1Var = 3;
  int a2Var = 6;
  int a3Var = 10;
  int a4Var = 0;

  bool dumbthing = true;

  List<LineData> lineData = [
    LineData("2012", 5, 4, 3, 2, 1, 1, 1),
    LineData("2013", 5, 4, 3, 2, 1, 1, 1),
    LineData("2014", 5, 4, 3, 2, 1, 1, 1),
    LineData("2015", 5, 4, 3, 2, 1, 1, 1),
  ];

  Future getInfo() async {
    //   List<int> newValues = [];

    //   var response = await http
    //       .get(Uri.parse('https://mav-visualisation-api.azurewebsites.net/data'));

    //   if (response.statusCode == 200) {
    //     print(response.body);
    //     var jsonMessage = jsonDecode(response.body)[0];
    //     newValues.add(jsonMessage["camera-1"]["count"]);
    //     newValues.add(jsonMessage["camera-2"]["count"]);
    //     newValues.add(jsonMessage["ARQ-B2B"]["count"]);
    //     newValues.add(jsonMessage["camera-4"]["count"]);

    //     lineData.add(LineData(year.toString(), newValues[0], newValues[1], barVar,
    //         a1Var, a2Var, a3Var, a4Var));

    //     bathAVar = Random().nextInt(20);
    //     bathBVar = Random().nextInt(20);
    //     barVar = Random().nextInt(20);
    //     a1Var = Random().nextInt(20);
    //     a2Var = Random().nextInt(20);
    //     a3Var = Random().nextInt(20);
    //     a4Var = Random().nextInt(20);

    //     year += 1;
    //     if (lineData.length == 15) {
    //       lineData.removeAt(0);
    //     }
    //   } else {
    //     print(response.statusCode);
    //   }
    // }
  }
}
