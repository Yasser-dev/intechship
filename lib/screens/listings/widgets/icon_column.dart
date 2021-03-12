import 'package:flutter/material.dart';
import '../../../app/size_config.dart';

class IconColumn extends StatelessWidget {
  const IconColumn({
    @required this.icon,
    @required this.color,
    @required this.label,
    this.iconSize,
    this.labelSize,
  });

  final IconData icon;
  final Color color;
  final String label;
  final double labelSize;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 3),
      child: Column(
        children: [
          Icon(
            icon,
            size: iconSize ?? SizeConfig.blockSizeHorizontal * 5,
            color: color,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: labelSize ?? SizeConfig.blockSizeHorizontal * 4,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
