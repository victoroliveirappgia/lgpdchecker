import 'package:easycomply/pages/model/checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonutPieChart extends StatefulWidget {
  @override
  _DonutPieChartState createState() => _DonutPieChartState();
}

class _DonutPieChartState extends State<DonutPieChart> {
  late List<LGPDData> _chartData;
  late int complyingCount = 0;
  late int notComplyingCount = 0;
  late int totalCount = complyingCount + notComplyingCount;

  @override
  void initState() {
    super.initState();

    var box = Hive.box<CheckBoxState>('lgpd_checkboxes');

    complyingCount = box.toMap().entries
      .where((checkbox) => checkbox.value.value == true)
      .map((checkbox) => checkbox.value)
      .toList()
      .length;

    notComplyingCount = box.toMap().entries
      .where((checkbox) => checkbox.value.value == false)
      .map((checkbox) => checkbox.value)
      .toList()
      .length;
      
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1C4E89),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 50.0),
          child: SfCircularChart(
            title: ChartTitle(
              text:
                  'You are complying with \n $complyingCount points of LGPD from a total of $totalCount'
                      .toUpperCase(),
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            palette: <Color>[Color(0xFF2B8540), Color(0xFFE6EBF0)],
            legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                textStyle: TextStyle(color: Colors.white)),
            series: <CircularSeries>[
              DoughnutSeries<LGPDData, String>(
                dataSource: _chartData,
                xValueMapper: (LGPDData data, _) => data.label,
                yValueMapper: (LGPDData data, _) => data.count,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<LGPDData> getChartData() {
    final List<LGPDData> chartData = [
      LGPDData('Complying', complyingCount),
      LGPDData('Not Complying', notComplyingCount),
    ];

    return chartData;
  }
}

class LGPDData {
  final String label;
  final int count;

  LGPDData(this.label, this.count);
}
