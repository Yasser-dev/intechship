import 'package:flutter/material.dart';
import '../../screens/listings/listings_view.dart';
import '../../screens/viewmodel.dart';

class HomeViewModel extends Viewmodel {
  int currentIndex = 0;
  Widget currentScreen = ListingsScreen();

  void changePage(index, screen) {
    turnBusy();
    this.currentIndex = index;
    this.currentScreen = screen;
    turnIdle();
  }
}
