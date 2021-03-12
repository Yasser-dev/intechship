import 'package:flutter/material.dart';
import '../app/size_config.dart';

AppBar intecshipAppbar(BuildContext context, [List<Widget> actions]) {
  return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'INTECHSHIP',
        style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 5,
          fontFamily: 'GoodTimes',
          color: Color(0xff610f28),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      elevation: 0,
      actions: actions);
}
