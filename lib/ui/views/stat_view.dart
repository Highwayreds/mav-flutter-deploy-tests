import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_visualisation/classes/visualisations/fullarea.dart';
import 'package:map_visualisation/classes/visualisations/radialbar.dart';
import 'package:map_visualisation/classes/visualisations/stackedline.dart';
import 'package:map_visualisation/classes/visualisations/steparea.dart';
import 'package:map_visualisation/ui/viewmodels/stat_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StatView extends StatefulWidget {
  const StatView({Key key}) : super(key: key);

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State {
  // StatViewModel statViewModel = StatViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.pop(context);
          }),
      Expanded(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //
            //
            //
            //
            // ViewModelBuilder<StatViewModel>.reactive(
            //     builder: (context, model, child) =>
            //         Expanded(child: StackedLine(model.lineData)),
            //     viewModelBuilder: () => StatViewModel()),
            //
            //
            //
            //
            //
            //
            // StackedLine(statViewModel.lineData),
            RadialBar(),
            StepArea()
          ]),
          // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // FullArea(),
          // StackedLine(statViewModel.lineData),
          // StackedLine(statViewModel.lineData),
          // ]),
        ]),
      )
    ]));
  }
}
