import 'package:flutter/material.dart';
import 'package:task_ui/view/cart/page/cart_page.dart';
import 'package:task_ui/view/dashboard/page/dashboard_page.dart';
import 'package:task_ui/view/status/page/status_page.dart';
import 'package:task_ui/view/profile/page/profile_page.dart';

class AppProvider extends ChangeNotifier {
// BottomNavigationBar Provider
  int _currentPageIndex = 0;
  List<Widget> get pages => [
        const DashboardPage(),
        const StatusPage(),
        const CartPage(),
        const ProfilePage(),
      ];
  int get currentPageIndex => _currentPageIndex;
  Widget get currentPage => pages[_currentPageIndex];

  void setPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
