import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'auth_widgets.dart';
import 'login_page.dart';
import 'register_step1_page.dart';

/// หน้าแรกสุดของแอป (Welcome) แสดงโลโก้ + ชื่อแอป + ปุ่ม "เข้าสู่ระบบ" / "ลงทะเบียน"
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottomBlobAlignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            // โลโก้แอป - ใช้ Icon แทนรูปจริงไปก่อน (ต่อยอดใส่ asset โลโก้ทีหลังได้)
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.lightGreenBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.eco, color: AppColors.primaryGreen, size: 72),
            ),
            const SizedBox(height: 32),
            const Text(
              'GreenPoint',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 12),
            const AuthSubtitlePill(
              text: 'สมัครใช้งานเพื่อสร้างร้านค้าและอัพเดทสินค้า',
            ),
            const SizedBox(height: 48),
            AuthPrimaryButton(
              label: 'เข้าสู่ระบบ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            AuthPrimaryButton(
              label: 'ลงทะเบียน',
              isOutlined: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterStep1Page()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
