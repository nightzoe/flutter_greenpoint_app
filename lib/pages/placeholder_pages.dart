import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Widget กลางสำหรับหน้าที่ยังไม่ได้พัฒนา (Home / Scan / Profile)
/// ต่อยอดแยกเป็นไฟล์ของตัวเองได้ภายหลัง เช่น home_page.dart, scan_page.dart, profile_page.dart
class PlaceholderTabPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderTabPage({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: AppColors.primaryGreen),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'หน้านี้ยังไม่ได้พัฒนา (Coming Soon)',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
