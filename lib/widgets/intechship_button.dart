import 'package:flutter/material.dart';
import '../app/size_config.dart';

class IntechshipButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final Function onPressed;
  IntechshipButton(
      {@required this.text, @required this.onPressed, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ButtonStyle(),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.blockSizeHorizontal * 5),
        ),
      ),
    );
  }
}
