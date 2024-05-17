import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

const List<Widget> Options = <Widget>[
  Padding(
    padding: EdgeInsets.all(3.0),
    child: Text('For Lease'),
  ),
  Padding(
    padding: EdgeInsets.all(3.0),
    child: Text('For Rent'),
  ),
];


class LookigForToggle extends StatefulWidget {
  const LookigForToggle({Key? key, required this.onSelectedIndexChanged})
      : super(key: key);

  final ValueChanged<int> onSelectedIndexChanged;

  @override
  State<LookigForToggle> createState() => _LookigForToggleState();
}

class _LookigForToggleState extends State<LookigForToggle> {
  final List<bool> _selectedOptions = <bool>[true, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedOptions.length; i++) {
            _selectedOptions[i] = i == index;
          }
          widget.onSelectedIndexChanged(index);
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: kPrimaryColor,
      color: Colors.black,
      constraints: const BoxConstraints(
        minHeight: 30,
        minWidth: 50,
      ),
      isSelected: _selectedOptions,
      children: Options,
    );
  }
}
