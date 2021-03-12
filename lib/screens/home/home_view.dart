import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../view.dart';
import '../../app/size_config.dart';
import '../../screens/employer/employer_view.dart';
import '../../screens/home/home_viewmodel.dart';
import '../listings/listings_view.dart';

class HomeScreen extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => HomeScreen());

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig().init(context);
    return Scaffold(
      body: View<HomeViewModel>(
        builder: (context, viewmodel, child) => viewmodel.currentScreen,
      ),
      bottomNavigationBar: View<HomeViewModel>(
        builder: (context, viewmodel, child) => BottomNavigationBar(
          fixedColor: Theme.of(context).primaryColor,
          elevation: 15,
          currentIndex: viewmodel.currentIndex,
          backgroundColor: Colors.white,
          onTap: (value) {
            if (value == viewmodel.currentIndex) {
              return;
            } else if (value == 0) {
              viewmodel.changePage(value, ListingsScreen());
            } else if (value == 1) {
              viewmodel.changePage(value, EmployerScreen());
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(LineIcons.graduationCap),
              label: 'Internships',
            ),
            BottomNavigationBarItem(
              label: 'Employer',
              icon: Icon(LineIcons.briefcase),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
