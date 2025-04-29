import 'package:flutter/material.dart';
import 'package:task_ui/core/utilities/app_color.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final String iconPath;
  final Color color;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(iconPath,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            change,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
