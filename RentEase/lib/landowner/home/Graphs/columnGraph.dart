import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class columnGraph extends StatefulWidget {
  const columnGraph({super.key});

  @override
  State<columnGraph> createState() => _columnGraphState();
}

class _columnGraphState extends State<columnGraph> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('MUM', 3),
      _ChartData('DEL', 2),
      _ChartData('BLR', 2),
      _ChartData('CHEN', 1),
      _ChartData('HYD', 1)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(color: Colors.transparent), // Hide Y-axis grid lines
          majorTickLines: MajorTickLines(color: Colors.transparent),
        ),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 5, interval: 1,
          majorGridLines: MajorGridLines(color: Colors.transparent), // Hide Y-axis grid lines
          majorTickLines: MajorTickLines(color: Colors.transparent),
        ),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Houses',
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              color: Colors.pink,
            width: 0.4
          )
        ]);
  }
}


class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}