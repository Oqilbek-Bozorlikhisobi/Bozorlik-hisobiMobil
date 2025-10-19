import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedTab = 0;

  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Market App – Bozorni elektron hisobda yuri...',
      date: 'April 13, 2025 at 10:00 AM',
      isRead: false,
    ),
    NotificationItem(
      title: '+998 90 *** 7777 (Azimjon) foydalanuvchi sizga bozorlik ulashdi',
      date: 'April 13, 2025 at 10:00 AM',
      isRead: false,
    ),
    NotificationItem(
      title: 'Welcome to BozorApp v1.5 — Enjoy the ne...',
      date: 'April 13, 2025 at 10:00 AM',
      isRead: true,
    ),
    NotificationItem(
      title: 'Welcome to BozorApp v1.5 — Enjoy the ne...',
      date: 'April 13, 2025 at 10:00 AM',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "notifications".tr(),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:  Icon(Icons.check_box_outlined, color: AppColors.primaryColor, size: 28),
            onPressed: () {
              // Mark all as read action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab buttons
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildTabButton('Barchasi', 0),
                const SizedBox(width: 12),
                _buildTabButton('O\'qilmagan', 1),
                const SizedBox(width: 12),
                _buildTabButton('O\'qilgan', 2),
              ],
            ),
          ),

          // Notification list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                // Filter based on selected tab
                if (selectedTab == 1 && notification.isRead) return const SizedBox.shrink();
                if (selectedTab == 2 && !notification.isRead) return const SizedBox.shrink();

                return _buildNotificationCard(notification);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notification.isRead ? AppColors.grey : AppColors.primaryColor,
          width: notification.isRead ? 1 : 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: notification.isRead ? FontWeight.w400 : FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  notification.date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          if (!notification.isRead)
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: 10,
              height: 10,
              decoration:  BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String date;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.date,
    required this.isRead,
  });
}