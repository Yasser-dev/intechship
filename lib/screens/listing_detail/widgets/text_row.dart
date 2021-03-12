import 'package:flutter/material.dart';
import '../../../app/size_config.dart';

class TextRow extends StatelessWidget {
  final String titleText;
  final String valueText;

  const TextRow({
    @required this.titleText,
    @required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: titleText,
        style: TextStyle(
          color: Colors.black87,
          fontSize: SizeConfig.blockSizeHorizontal * 5,
        ),
        children: [
          TextSpan(
            text: valueText,
            style: TextStyle(
              color: Colors.black54,
              fontSize: SizeConfig.blockSizeHorizontal * 5,
            ),
          ),
        ],
      ),
    );
  }
}
