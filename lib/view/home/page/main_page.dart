import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ui/core/utilities/app_color.dart';
import 'package:task_ui/core/utilities/app_strings.dart';
import 'package:task_ui/provider/app_provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: app.currentPage,
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 60,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItem(
                  image: AppStrings.homeIcon,
                  label: 'Home',
                  index: 0,
                ),
                NavItem(
                  image: AppStrings.statusIcon,
                  label: 'Status',
                  index: 1,
                ),
                NavItem(
                  image: AppStrings.cartIcon,
                  label: 'Cart',
                  index: 2,
                ),
                NavItem(
                  image: AppStrings.profileIcon,
                  label: 'Profile',
                  index: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.image,
    required this.label,
    required this.index,
  });

  final String image;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        final bool isSelected = index == app.currentPageIndex;
        return GestureDetector(
          onTap: () => app.setPageIndex(index),
          child: Container(
            height: 48,
            width: isSelected ? 110 : 60,
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.pink.withOpacity(0.3) : Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  image,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                  color: isSelected ? AppColors.pink: AppColors.black,
                ),
                if (isSelected) ...[
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.pink,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
