import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class popular extends StatefulWidget {
  const popular({super.key});

  @override
  State<popular> createState() => _popularState();
}

class _popularState extends State<popular> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('THE GRAND ESTATE', 5),
      _ChartData('THE CHATEAU', 3),
      _ChartData('THE PALAZZO', 0),
      _ChartData('THE OASIS APARTMENT', 2),
      _ChartData('THE HIDDEN TREASURE', 5),
      _ChartData('THE PARADISE', 1),
      _ChartData('THE COUNTRY RETREAT',0),
      _ChartData('THE RURAL RETREAT', 0),
      _ChartData('THE TRANQUIL ESCAPE',1),
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
              name: 'Popular Houses',
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