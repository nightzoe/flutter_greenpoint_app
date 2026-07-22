// Basic widget test สำหรับแอป GreenPoint
// ตรวจสอบว่าแอปเปิดขึ้นมาแล้วเจอหน้า Welcome (auth) ก่อนเข้าระบบ

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:greenpoint_app/main.dart';

void main() {
  testWidgets('GreenPoint app renders Welcome page on startup',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GreenPointApp());

    // ตรวจสอบว่าเปิดมาที่หน้า Welcome (มีปุ่ม "เข้าสู่ระบบ" และ "ลงทะเบียน")
    expect(find.text('เข้าสู่ระบบ'), findsOneWidget);
    expect(find.text('ลงทะเบียน'), findsOneWidget);
    expect(find.text('GreenPoint'), findsOneWidget);
  });
}
