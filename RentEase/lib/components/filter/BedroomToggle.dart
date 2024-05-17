import 'package:flutter/material.dart';
import 'package:rentease/constants.dart';

const List<Widget> Bedroom = <Widget>[
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('Any'),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('1'),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('2'),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('3'),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('4+'),
  )
];

class BedroomToggle extends StatefulWidget {
  const BedroomToggle({Key? key, required this.onSelectedIndexChanged})
      : super(key: key);

  final ValueChanged<int> onSelectedIndexChanged;

  @override
  State<BedroomToggle> createState() => _BedroomToggleState();
}

class _BedroomToggleState extends State<BedroomToggle> {
  final List<bool> _selectedBedroom = <bool>[true, false,false,false,false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedBedroom.length; i++) {
            _selectedBedroom[i] = i == index;
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
      isSelected: _selectedBedroom,
      children: Bedroom,
    );
  }
}
