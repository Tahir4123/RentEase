import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({
    Key? key,
    required this.selectedToggleIndex,
    required this.currentRangeValues,
    required this.onChanged,
  }) : super(key: key);

  final int selectedToggleIndex;
  final RangeValues currentRangeValues;
  final ValueChanged<RangeValues> onChanged;

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
RangeValues _currentRangeValues = RangeValues(0, 0);

@override
void initState() {
  super.initState();
  _currentRangeValues = widget.currentRangeValues;
}

String formatLabel(double value) {
  if (value < 1000) {
    return '0';
  } else if (value >= 1000 && value < 1000000) {
    return '${(value / 1000).toStringAsFixed(0)}k';
  } else {
    return '${(value / 1000000).toStringAsFixed(0)}M+';
  }
}

@override
Widget build(BuildContext context) {
  final double max = widget.selectedToggleIndex == 0 ? 100000 : 100000;
  final double start = _currentRangeValues.start.clamp(0, max);
  final double end = _currentRangeValues.end.clamp(0, max);
  _currentRangeValues = RangeValues(start, end);

  return RangeSlider(
    values: _currentRangeValues,
    max: max,
    divisions: 10,
    activeColor: kPrimaryColor,
    inactiveColor: kPrimaryExtremeLightColor,
    labels: RangeLabels(
      formatLabel(_currentRangeValues.start),
      formatLabel(_currentRangeValues.end),
    ),
    overlayColor: MaterialStateProperty.all(kPrimaryExtremeLightColor),
    onChanged: (RangeValues values) {
      setState(() {
        _currentRangeValues = values;
      });
      widget.onChanged(_currentRangeValues);
    },
  );
}
}

