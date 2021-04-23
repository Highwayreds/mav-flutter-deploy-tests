import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}

class StepArea extends StatefulWidget {
  @override
  _StepAreaState createState() => _StepAreaState();
}

class _StepAreaState extends State {
  // add later for the live updating
  // StackedLineViewModel stackedLineViewModel = StackedLineViewModel();
  //
  final List<ChartData> chartData = [
    ChartData(DateTime(2021, 1, 1, 1, 0), 50),
    ChartData(DateTime(2021, 1, 1, 1, 5), 10),
    ChartData(DateTime(2021, 1, 1, 1, 10), 134),
    ChartData(DateTime(2021, 1, 1, 1, 15), 152),
    ChartData(DateTime(2021, 1, 1, 1, 20), 140),
    ChartData(DateTime(2021, 1, 1, 1, 25), 169)
  ];

  int yrTest = 16;
  double numTest = 120;

  @override
  void initState() {
    super.initState();
  }

  int x = 25;
  double y = 130;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(children: [
      SfCartesianChart(primaryXAxis: DateTimeAxis(), series: <ChartSeries>[
        // Renders step line chart
        StepLineSeries<ChartData, DateTime>(
            animationDuration: 4500,
            dataSource: chartData,
            xValueMapper: (ChartData sales, _) => sales.x,
            yValueMapper: (ChartData sales, _) => sales.y)
      ]),
      FloatingActionButton(
        onPressed: () {
          setState(() {
            chartData.add(ChartData(DateTime(2021, 1, 1, 1, x), y));
            if (x == 60) {
              x = 0;
            } else {
              x += 5;
            }
            if (x.isEven) {
              y -= 10;
            } else {
              y += 10;
            }
          });
        },
        child: Icon(Icons.add),
      )
    ])));
  }
}
