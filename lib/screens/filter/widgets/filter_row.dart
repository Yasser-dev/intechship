import 'package:flutter/material.dart';
import 'package:xlive_switch/xlive_switch.dart';
import '../../../app/size_config.dart';

class FilterRow extends StatelessWidget {
  final String label;
  final bool switchValue;
  final Function(bool) switchFunction;
  FilterRow({
    @required this.label,
    @required this.switchValue,
    @required this.switchFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 5),
        ),
        XlivSwitch(
            activeColor: Theme.of(context).primaryColor,
            unActiveColor: Colors.grey.shade400,
            value: switchValue,
            onChanged: switchFunction)
      ],
    );
  }
}
