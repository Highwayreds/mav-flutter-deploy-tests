import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class RadialBar extends StatefulWidget {
  @override
  _RadialBarState createState() => _RadialBarState();
}

class _RadialBarState extends State {
  // add later for the live updating
  // StackedLineViewModel stackedLineViewModel = StackedLineViewModel();
  //
  final List<ChartData> chartData = [
    ChartData("Bathroom A", 150),
    ChartData("Bathroom B", 190),
    ChartData("Bar", 134),
    ChartData("Aisles", 152),
    ChartData("Conference", 140),
    ChartData("Pavilion", 169)
  ];

  int yrTest = 16;
  double numTest = 120;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          child: SfCircularChart(
              // use for a more detailed view ????
              legend: Legend(
                  title: LegendTitle(
                      text: 'Area',
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900)),
                  isVisible: true),
              series: <CircularSeries>[
            RadialBarSeries<ChartData, String>(
                animationDuration: 4500,
                maximumValue: 200,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                radius: '100%',
                // Corner style of radial bar segment
                cornerStyle: CornerStyle.bothCurve),
          ]))
    ]);
  }
}
