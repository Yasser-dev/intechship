import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../../app/size_config.dart';

class IntechshipToggle extends StatelessWidget {
  final String text;
  final List<String> toggleLabels;
  final List<IconData> icons;
  final Function(int) onToggle;
  final int selected;

  IntechshipToggle({
    @required this.text,
    @required this.toggleLabels,
    @required this.icons,
    @required this.selected,
    @required this.onToggle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeHorizontal * 2),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 5),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          FlutterToggleTab(
            isScroll: false,
            initialIndex: 0,
            selectedIndex: selected,
            width: SizeConfig.blockSizeHorizontal * 15,
            borderRadius: SizeConfig.blockSizeHorizontal * 3,
            selectedBackgroundColors: [Theme.of(context).primaryColor],
            unSelectedBackgroundColors: [Colors.grey.shade200],
            selectedTextStyle: TextStyle(color: Colors.white),
            unSelectedTextStyle: TextStyle(color: Colors.black54),
            labels: toggleLabels,
            icons: icons,
            selectedLabelIndex: onToggle,
          ),
        ],
      ),
    );
  }
}
