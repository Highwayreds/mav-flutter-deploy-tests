import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.bathroomA, this.bathroomB, this.bar);
  final DateTime x;
  final num bathroomA;
  final num bathroomB;
  final num bar;
}

class FullArea extends StatefulWidget {
  @override
  _FullAreaState createState() => _FullAreaState();
}

class _FullAreaState extends State {
  // add later for the live updating
  // StackedLineViewModel stackedLineViewModel = StackedLineViewModel();
  //
  final List<ChartData> chartData = <ChartData>[
    ChartData(DateTime(2000, 1, 1), 0.61, 0.01, 5.48),
    ChartData(DateTime(2001, 1, 1), 0.81, 0.01, 5.53),
    ChartData(DateTime(2002, 1, 1), 0.91, 0.01, 6.57),
    ChartData(DateTime(2003, 1, 1), 1.00, 0.01, 7.61),
    ChartData(DateTime(2004, 1, 1), 1.19, 0.01, 10.63),
    ChartData(DateTime(2005, 1, 1), 1.47, 0.01, 0.64),
    ChartData(DateTime(2006, 1, 1), 1.74, 0.01, 0.66),
    ChartData(DateTime(2007, 1, 1), 1.98, 0.01, 0.76),
    ChartData(DateTime(2008, 1, 1), 1.99, 0.01, 0.77),
    ChartData(DateTime(2009, 1, 1), 1.70, 0.01, 0.55),
    ChartData(DateTime(2010, 1, 1), 1.48, 1.01, 0.54),
    ChartData(DateTime(2011, 1, 1), 1.38, 1.25, 0.57),
    ChartData(DateTime(2012, 1, 1), 1.66, 1.55, 0.61),
    ChartData(DateTime(2013, 1, 1), 1.66, 1.55, 0.67),
    ChartData(DateTime(2014, 1, 1), 1.67, 1.65, 0.67),
    ChartData(DateTime(2015, 1, 1), 1.98, 1.96, 0.98),
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
            child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
          StackedArea100Series<ChartData, DateTime>(
              animationDuration: 4500,
              color: Colors.red.shade400,
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.bathroomA),
          StackedArea100Series<ChartData, DateTime>(
              animationDuration: 4500,
              color: Colors.orange.shade400,
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.bathroomB),
          StackedArea100Series<ChartData, DateTime>(
              animationDuration: 4500,
              color: Colors.green.shade500,
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.bar),
        ])));
  }
}
