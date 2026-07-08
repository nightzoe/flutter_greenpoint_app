import 'package:flutter/material.dart';

/// รวมสีหลักของแอป GreenPoint (โทน Eco-Green)
class AppColors {
  AppColors._();

  static const Color primaryGreen = Color(0xFF1B5E3C); // เขียวเข้ม - ปุ่ม/แท็บหลัก
  static const Color primaryGreenDark = Color(0xFF123D28);
  static const Color lightGreenBg = Color(0xFFE6F4EA); // เขียวอ่อน - พื้นหลังการ์ดไฮไลท์
  static const Color accentGreen = Color(0xFF2E9E5B);

  static const Color background = Color(0xFFF7F8F7);
  static const Color cardBackground = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color notificationRed = Color(0xFFE53935);
  static const Color starYellow = Color(0xFFFFB300);
  static const Color divider = Color(0xFFE0E0E0);
}

/// ThemeData หลักของแอป ใช้ Material 3
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreen,
        primary: AppColors.primaryGreen,
        secondary: AppColors.accentGreen,
        surface: AppColors.cardBackground,
      ),
      fontFamily: 'Sarabun', // เผื่อผู้ใช้เพิ่มฟอนต์ไทยภายหลัง ถ้าไม่มีจะ fallback เป็นฟอนต์ระบบ
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
