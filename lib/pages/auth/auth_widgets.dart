import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// สีตกแต่งมุมจอแบบ blob โค้งๆ ตาม UI (ม่วงอ่อน/ชมพูอ่อน)
class AuthColors {
  AuthColors._();
  static const Color lavenderBlob = Color(0xFFDCD3F0);
  static const Color pinkBlob = Color(0xFFF3D6DE);
}

/// บลอบวงกลมสีอ่อนๆ แปะไว้ที่มุมจอ ใช้ตกแต่งพื้นหลังหน้า auth
/// ใช้ Positioned ครอบตอนเรียกใช้งานเสมอ (ดูตัวอย่างใน AuthScaffold ด้านล่าง)
class CornerBlob extends StatelessWidget {
  final Color color;
  final double size;

  const CornerBlob({super.key, required this.color, this.size = 260});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

/// Scaffold กลางสำหรับหน้า auth ทุกหน้า: จัดบลอบมุมบน-ซ้าย และมุมล่างตามที่ระบุ
/// พร้อมพื้นที่เนื้อหาหลักแบบ scroll ได้ (กัน overflow ตอนคีย์บอร์ดเด้ง)
class AuthScaffold extends StatelessWidget {
  final Widget child;
  final Color topBlobColor;
  final Alignment bottomBlobAlignment; // Alignment.bottomLeft หรือ bottomRight
  final Color bottomBlobColor;

  const AuthScaffold({
    super.key,
    required this.child,
    this.topBlobColor = AuthColors.lavenderBlob,
    this.bottomBlobAlignment = Alignment.bottomLeft,
    this.bottomBlobColor = AuthColors.lavenderBlob,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // บลอบมุมบนซ้าย
          Positioned(
            top: -90,
            left: -90,
            child: CornerBlob(color: topBlobColor),
          ),
          // บลอบมุมล่าง (ซ้ายหรือขวาแล้วแต่หน้า)
          Positioned(
            bottom: -100,
            left: bottomBlobAlignment == Alignment.bottomLeft ? -100 : null,
            right: bottomBlobAlignment == Alignment.bottomRight ? -100 : null,
            child: CornerBlob(color: bottomBlobColor, size: 220),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

/// ป้ายข้อความสีเขียวพื้นหลังเขียวอ่อนแบบแคปซูล (subtitle ใต้ชื่อแอป)
class AuthSubtitlePill extends StatelessWidget {
  final String text;

  const AuthSubtitlePill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// ช่องกรอกข้อมูลทรงแคปซูลพื้นเทาอ่อน พร้อมไอคอนนำหน้า
/// ถ้า isPassword = true จะมีปุ่มตาซ่อน/แสดงรหัสผ่านให้อัตโนมัติ
class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.keyboardType,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: AppColors.primaryGreen, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscure : false,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: AppColors.textSecondary),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          if (widget.isPassword)
            GestureDetector(
              onTap: () => setState(() => _obscure = !_obscure),
              child: Icon(
                _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: AppColors.primaryGreen,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

/// ปุ่มหลักสีเขียวทรงแคปซูล เต็มความกว้าง ใช้ซ้ำได้ทุกหน้า auth
class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isOutlined; // true = พื้นเทาอ่อน ตัวหนังสือเขียว (ปุ่มรอง เช่น "ลงทะเบียน")

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? const Color(0xFFEDEDED) : AppColors.primaryGreen,
          foregroundColor: isOutlined ? AppColors.primaryGreen : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        child: Text(label),
      ),
    );
  }
}
