import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentease/constants.dart';

List<Widget> icons = <Widget>[
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(Icons.view_list_outlined)
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(Icons.grid_view_rounded)
  ),
];


class list_gridToggle extends StatefulWidget {
  final ValueChanged<bool>? onToggle; // Add this line to accept the callback

  const list_gridToggle({Key? key, this.onToggle}) : super(key: key);

  @override
  State<list_gridToggle> createState() => _list_gridToggleState();
}

class _list_gridToggleState extends State<list_gridToggle> {
  final List<bool> _selectedView = <bool>[true, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedView.length; i++) {
            _selectedView[i] = i == index;
          }
          // Call the onToggle callback with the selected state
          if (widget.onToggle != null) {
            widget.onToggle!(_selectedView[index]);
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      constraints: const BoxConstraints(
        minHeight: 30,
        minWidth: 50,
      ),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: kPrimaryColor,
      color: Colors.black,
      isSelected: _selectedView,
      children: icons,
    );
  }
}

