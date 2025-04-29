import 'package:flutter/material.dart';
import 'package:task_ui/core/utilities/app_color.dart';
import 'package:task_ui/core/utilities/app_strings.dart';
import 'package:task_ui/view/dashboard/widget/activity_card_widget.dart';
import 'package:task_ui/view/dashboard/widget/quick_actions_widget.dart';
import 'package:task_ui/view/dashboard/widget/status_card_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          // Notification button .........................................
          Stack(
            children: [
              IconButton(
                icon: Image.asset(
                  AppStrings.notificationIcon,
                  height: 27,
                  width: 27,
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                  // Handle notification button press
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          // User profile image ..........................................
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              AppStrings.profileImageTest,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      // Page Drawer ..................................................
      drawer: Drawer(
        elevation: 16,
        child: Container(
          color: Colors.grey.shade50,
          child: Column(
            children: [
              Expanded(
                  child: ListView(padding: EdgeInsets.zero, children: const [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.tealAccent],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage(AppStrings.profileImageTest),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'عبدالله حماد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, John!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'Monday, 15 March 2025',
              style: TextStyle(fontSize: 14, color: AppColors.grey),
            ),
            const SizedBox(height: 30),
            // Recent Activity Section ....................................
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 20),
            const ActivityCardWidget(
              iconPath: AppStrings.activityIcon1,
              iconColor: AppColors.pink,
              title: 'You have a new message',
              time: '2 minutes ago',
              status: '15.00 EGP',
              statusColor: AppColors.pink,
            ),
            const SizedBox(height: 10),
            const ActivityCardWidget(
              iconPath: AppStrings.activityIcon2,
              iconColor: AppColors.blue,
              title: 'New Support Ticket',
              time: '15 minutes ago',
              status: 'Open',
              statusColor: AppColors.blue,
            ),
            const SizedBox(height: 30),
            // Stats Section ..............................................
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatsCard(
                    title: 'Total Orders',
                    value: '1,258',
                    change: '+12.5% from last week',
                    iconPath: AppStrings.statusIcon1,
                    color: AppColors.pink,
                  ),
                  SizedBox(width: 10),
                  StatsCard(
                    title: 'Revenue',
                    value: '\$24.5k',
                    change: '+12.5% from last week',
                    iconPath: AppStrings.statusIcon2,
                    color: AppColors.green,
                  ),
                  SizedBox(width: 10),
                  StatsCard(
                    title: 'Cash Flow',
                    value: '\$4.5k',
                    change: '+16.2% from last week',
                    iconPath: AppStrings.statusIcon2,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Quick Actions Section ........................................
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Handle "Edit" button press
                        },
                        child: const Icon(Icons.edit, color: AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 2.5,
                      shrinkWrap: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        6,
                        (index) => const QuickActionsWidget(
                          iconPath: AppStrings.statusIcon,
                          text: 'Orders',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
