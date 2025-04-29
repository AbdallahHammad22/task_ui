import 'package:flutter/material.dart';
import 'package:task_ui/core/utilities/app_color.dart';

class ActivityCardWidget extends StatelessWidget {
  const ActivityCardWidget(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.time,
      required this.status,
      required this.statusColor,
      required this.iconColor});
  final String iconPath;
  final String title;
  final String time;
  final String status;
  final Color statusColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withOpacity(0.1),
            child: Image.asset(
              iconPath,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
