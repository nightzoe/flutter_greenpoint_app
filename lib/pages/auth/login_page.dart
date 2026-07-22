import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../home_page.dart';
import 'auth_widgets.dart';
import 'register_step1_page.dart';

/// หน้าเข้าสู่ระบบ (Login)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // TODO: ต่อ API/Firebase Auth จริงตรงนี้
    // ตอนนี้จำลองว่า login สำเร็จเสมอ แล้วพาเข้าหน้าแรกของแอป
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      bottomBlobAlignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'GreenPoint',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: AuthSubtitlePill(
                text: 'ลงชื่อเข้าใช้งานเพื่อจัดการร้านและสินค้า',
              ),
            ),
            const SizedBox(height: 40),
            AuthTextField(
              controller: _accountController,
              hintText: 'ชื่อบัญชี/อีเมล',
              icon: Icons.person_outline,
            ),
            AuthTextField(
              controller: _passwordController,
              hintText: 'รหัสผ่าน',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 8),
            AuthPrimaryButton(
              label: 'เข้าสู่ระบบ',
              onPressed: _handleLogin,
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 13),
                  children: [
                    const TextSpan(text: 'ลืมรหัสผ่าน ? '),
                    TextSpan(
                      text: 'รีเซ็ตรหัสผ่าน',
                      style: const TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: ไปหน้ารีเซ็ตรหัสผ่าน
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 13),
                  children: [
                    const TextSpan(text: 'ยังไม่มีบัญชี ? '),
                    TextSpan(
                      text: 'สร้างบัญชีเพื่อเข้าใช้งาน',
                      style: const TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const RegisterStep1Page()),
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
