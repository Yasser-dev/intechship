import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/router.dart' as router;
import 'constants/app_themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intechship',
      theme: AppThemes.lightTheme,
      initialRoute: router.homeRoute,
      onGenerateRoute: router.createRoute,
    );
  }
}
