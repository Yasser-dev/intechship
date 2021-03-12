import 'package:flutter/material.dart';
import '../../../app/size_config.dart';

class LocationsFilterChips extends StatelessWidget {
  LocationsFilterChips({@required this.data, @required this.function});
  final Map<String, bool> data;
  final Function(String, bool) function;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: SizeConfig.blockSizeHorizontal * 5,
        alignment: WrapAlignment.center,
        children: data.keys
            .map(
              (key) => ChoiceChip(
                  elevation: 5,
                  selected: data[key],
                  selectedColor: Theme.of(context).primaryColor,
                  labelStyle: data[key]
                      ? TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.6,
                          color: Colors.white)
                      : TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.6),
                  label: Text(
                    key,
                  ),
                  onSelected: (val) => function(key, val)),
            )
            .toList());
  }
}
