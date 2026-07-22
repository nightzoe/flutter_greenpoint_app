import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../home_page.dart';
import 'auth_widgets.dart';
import 'login_page.dart';

/// สร้างบัญชีผู้ประกอบการ - ขั้นที่ 2: อีเมล / รหัสผ่าน / ยืนยันรหัสผ่าน
/// รับ firstName, lastName ต่อมาจากขั้นที่ 1 เพื่อไปรวมกับ API สมัครสมาชิกจริงในอนาคต
class RegisterStep2Page extends StatefulWidget {
  final String firstName;
  final String lastName;

  const RegisterStep2Page({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<RegisterStep2Page> createState() => _RegisterStep2PageState();
}

class _RegisterStep2PageState extends State<RegisterStep2Page> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('รหัสผ่านทั้งสองช่องไม่ตรงกัน')),
      );
      return;
    }
    // TODO: ต่อ API สมัครสมาชิกจริงตรงนี้ โดยใช้ widget.firstName, widget.lastName,
    // _emailController.text, _passwordController.text
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topBlobColor: AuthColors.pinkBlob,
      bottomBlobAlignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'สร้างบัญชีผู้ประกอบการ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 200),
            const Text(
              'สำหรับสร้างบัญชีผู้ใช้งาน',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            AuthTextField(
              controller: _emailController,
              hintText: 'อีเมล',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            AuthTextField(
              controller: _passwordController,
              hintText: 'รหัสผ่าน',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            AuthTextField(
              controller: _confirmPasswordController,
              hintText: 'รหัสผ่าน',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 8),
            AuthPrimaryButton(
              label: 'ดำเนินการต่อ',
              onPressed: _handleContinue,
            ),
            const SizedBox(height: 40),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 13),
                  children: [
                    const TextSpan(text: 'มีบัญชีอยู่แล้ว? '),
                    TextSpan(
                      text: 'เข้าสู่ระบบ',
                      style: const TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
                            (route) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
