import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/linedata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// GLOBAL CHANGE CHANGE CHANGE
List<LineData> chartData;

class StackedLine extends StatefulWidget {
  StackedLine(data) {
    chartData = data;
  }

  @override
  _StackedLineState createState() => _StackedLineState();
}

class _StackedLineState extends State {
  // add later for the live updating
  // StackedLineViewModel stackedLineViewModel = StackedLineViewModel();

  double animationDur = 500;

  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SfCartesianChart(
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<LineData, String>(
                animationDuration: animationDur,
                dataSource: chartData,
                xValueMapper: (LineData data, _) => data.time,
                yValueMapper: (LineData data, _) => data.bathroomA,
                name: 'Bathroom A'),
            LineSeries<LineData, String>(
                animationDuration: animationDur,
                dataSource: chartData,
                xValueMapper: (LineData data, _) => data.time,
                yValueMapper: (LineData data, _) => data.bathroomB,
                name: 'Bathroom B'),
            LineSeries<LineData, String>(
                animationDuration: animationDur,
                dataSource: chartData,
                xValueMapper: (LineData data, _) => data.time,
                yValueMapper: (LineData data, _) => data.bar,
                name: 'Bar'),
            LineSeries<LineData, String>(
                animationDuration: animationDur,
                dataSource: chartData,
                xValueMapper: (LineData data, _) => data.time,
                yValueMapper: (LineData data, _) => data.a4,
                name: 'Aisles'),
          ]),
    ]));
  }
}
