import 'package:flutter/material.dart';
import 'package:task_ui/core/utilities/app_color.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget(
      {super.key, required this.iconPath, required this.text});
  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, height: 25, width: 25,color: AppColors.pink,),
          const SizedBox(width: 10),
           Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
