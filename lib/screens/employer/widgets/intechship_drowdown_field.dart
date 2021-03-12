import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:line_icons/line_icons.dart';
import '../../../app/size_config.dart';

class IntechshipDropdownField extends StatelessWidget {
  final Function onChanged;
  final String initialValue;
  const IntechshipDropdownField({
    this.initialValue,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeHorizontal * 3),
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2.5),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            LineIcons.map,
            color: Colors.black38,
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
          Expanded(
            child: DropDown(
              initialValue: initialValue,
              showUnderline: false,
              isExpanded: true,
              items: [
                'Johor',
                'Kedah',
                'Kelantan',
                'Malacca',
                'Negeri Sembilan',
                'Pahang',
                'Penang',
                'Perak',
                'Perlis',
                'Sabah',
                'Sarawak',
                'Selangor',
                'Terengganu',
                'Putrajaya',
                'Labuan',
                'Kuala Lumpur'
              ],
              hint: Text('Location'),
              onChanged: (value) => onChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}
