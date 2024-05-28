import 'package:easycomply/components/donut_chart_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: DonutPieChart(),
        ),
    );
  }
}
