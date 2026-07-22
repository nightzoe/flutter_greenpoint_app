import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'auth_widgets.dart';
import 'login_page.dart';
import 'register_step2_page.dart';

/// สร้างบัญชีผู้ประกอบการ - ขั้นที่ 1: ชื่อจริง / นามสกุล
class RegisterStep1Page extends StatefulWidget {
  const RegisterStep1Page({super.key});

  @override
  State<RegisterStep1Page> createState() => _RegisterStep1PageState();
}

class _RegisterStep1PageState extends State<RegisterStep1Page> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegisterStep2Page(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        ),
      ),
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
            const SizedBox(height: 260),
            AuthTextField(
              controller: _firstNameController,
              hintText: 'ชื่อจริง',
              icon: Icons.person_outline,
            ),
            AuthTextField(
              controller: _lastNameController,
              hintText: 'นามสกุล',
              icon: Icons.person_outline,
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
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
