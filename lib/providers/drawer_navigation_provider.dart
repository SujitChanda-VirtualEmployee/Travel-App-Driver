import 'package:flutter/material.dart';

class DrawerNavigationProvider with ChangeNotifier {
  int index = 0;
  List<bool> selected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  selectPageIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }

}
