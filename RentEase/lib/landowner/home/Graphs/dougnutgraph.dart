import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ratingGraph extends StatefulWidget {
  const ratingGraph({super.key});

  @override
  State<ratingGraph> createState() => _ratingGraphState();
}

class _ratingGraphState extends State<ratingGraph> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('THE GRAND ESTATE', 9.7),
      _ChartData('THE CHATEAU', 8.5),
      _ChartData('THE PALAZZO', 8.0),
      _ChartData('THE OASIS APARTMENT', 7.2),
      _ChartData('THE HIDDEN TREASURE', 8.5),
      _ChartData('THE PARADISE', 7.1),
      _ChartData('THE COUNTRY RETREAT',5.5),
      _ChartData('THE RURAL RETREAT', 7.9),
      _ChartData('THE TRANQUIL ESCAPE',7.6),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        tooltipBehavior: _tooltip,
        palette: [kPrimaryColor,Color(0xffE396BC),Colors.pink,Colors.purple,Colors.orange,Colors.red,Colors.yellow,Colors.purpleAccent,Colors.deepOrange],
        series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Higest Rated',
              radius: '120'
          )
        ]);
  }
}


class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}